<?php

namespace app\common\model;

use EasyWeChat\Foundation\Application;
use fast\Http;
use think\Log;

/**
 * 开放平台
 */
class OpenPlatform
{
    public $openPlatform;
    public $businessModel;
    public $miniprogramModel;
    public $accessToken;
    public $expires;

    public function __construct()
    {
        $this->expires = 7000;
        $config = fconfig('openPlatform');

        //开放平台第三方配置
        $options = [
            'debug'     => true,
            'open_platform' => [
                'app_id'   => $config['appid']['value'],
                'secret'   => $config['secret']['value'],
                'token'    => $config['token']['value'],
                'aes_key'  => $config['aes_key']['value']
            ],
            'log' => [
                'level' => 'debug',
                'file'  => ROOT_PATH . 'runtime' . DS . 'log' . DS . 'easywechat.log',
            ],
        ];

        $app = new Application($options);
        $openPlatform = $app->open_platform;
        $this->openPlatform = $openPlatform;

        $this->businessModel = new \app\admin\model\Business;
        $this->miniprogramModel = new \app\admin\model\Miniprogram;

        // 第三方平台令牌 component_access_token
        $accessToken = $this->openPlatform->access_token;
        $this->accessToken = $accessToken->getToken();
    }

    /**
     * 获取时间
     *
     * @return void
     */
    public function expires()
    {
        return $this->expires;
    }

    /**
     * 开放平台对象
     *
     * @return void
     */
    public function openPlatform()
    {
        return  $this->openPlatform;
    }

    /**
     * access token
     *
     * @return void
     */
    public function accessToken()
    {
        return $this->accessToken;
    }

    /**
     * 获取全局token
     *
     * @param [type] $id 商户id
     * @return void
     */
    public function getAuthorizerToken($id)
    {
        $miniprogram = $this->miniprogramModel->where(['id' => $id])->find();
        $appid = $miniprogram['appid'];
        $authorizer_token = json_decode($miniprogram['authorizer_token'], true);
        if ($authorizer_token['expires_in'] + $this->expires < time()) {
            $authorizerToken = $this->openPlatform->getAuthorizerToken($appid, $authorizer_token['authorizer_refresh_token']);
            $data = [
                'authorizer_token' => json_encode([
                    'authorizer_access_token' => $authorizerToken->authorizer_access_token,
                    'authorizer_refresh_token' => $authorizerToken->authorizer_refresh_token,
                    'expires_in' => time() + $this->expires,
                ]),
            ];
            $this->miniprogramModel->save($data, ['id' => $miniprogram['id']]);
            return $authorizerToken->authorizer_access_token;
        }

        return $authorizer_token['authorizer_access_token'];
    }

    /**
     * 代码模板列表
     *
     * @return void
     */
    public function gettemplatelist()
    {
        $url = "https://api.weixin.qq.com/wxa/gettemplatelist?access_token=$this->accessToken";
        $res = Http::get($url);
        $res = json_decode($res, true);
        if ($res['errcode'] != 0) {
            Log::record($res, 'error');
        }
        return $res;
    }

    /**
     * 草稿箱列表
     *
     * @return void
     */
    public function gettemplatedraftlist()
    {
        $url = "https://api.weixin.qq.com/wxa/gettemplatedraftlist?access_token=$this->accessToken";
        $res = Http::get($url);
        $res = json_decode($res, true);
        if ($res['errcode'] != 0) {
            Log::record($res, 'error');
        }
        return $res;
    }


    /**
     * 已上传的代码的页面列表
     *
     * @param [type] $id 商户id
     * @return void
     */
    public function get_page($id)
    {
        $access_token = $this->getAuthorizerToken($id);
        $url = "https://api.weixin.qq.com/wxa/get_page?access_token=$access_token";
        $res = Http::get($url);
        $res = json_decode($res, true);
        if ($res['errcode'] != 0) {
            Log::record($res, 'error');
        }
        return $res;
    }


    /**
     * 获取体验版二维码
     *
     * @param [type] $id 商户id
     * @return void
     */
    public function get_qrcode($id)
    {
        $access_token = $this->getAuthorizerToken($id);
        $url = "https://api.weixin.qq.com/wxa/get_qrcode?access_token=$access_token";
        $res = Http::get($url);
        $img_dir =  ROOT_PATH . 'public' . DS . 'uploads' . DS . 'wxqrcode' . DS . 'experience' . DS;
        if (!is_dir($img_dir)) {
            mkdir($img_dir, 0755, true);
        }
        $filename = $id . '.jpg';
        $file = fopen($img_dir . $filename, "w"); //打开文件准备写入
        fwrite($file, $res); //写入,$res为图片二进制内容
        fclose($file); //关闭
        $img_src = request()->domain() . "/uploads/wxqrcode/experience/$filename";
        return $img_src;
    }

    /**
     * 查询最新一次提交的审核状态
     *
     * @param [type] $id
     * @return void
     */
    public function get_latest_auditstatus($id)
    {
        $access_token = $this->getAuthorizerToken($id);
        $url = "https://api.weixin.qq.com/wxa/get_latest_auditstatus?access_token=$access_token";
        $res = Http::get($url);
        $res = json_decode($res, true);
        if ($res['errcode'] != 0) {
            Log::record($res, 'error');
        }
        return $res;
    }

    /**
     * 将草稿添加到代码模板库
     *
     * @param [type] $draft_id 草稿id
     * @return void
     */
    public function addtotemplate($draft_id)
    {
        $url = "https://api.weixin.qq.com/wxa/addtotemplate?access_token=$this->accessToken";
        $params = [
            'draft_id' => $draft_id,
        ];
        $res = Http::post($url, json_encode($params));
        $res = json_decode($res, true);
        if ($res['errcode'] != 0) {
            Log::record($res, 'error');
        }
        return $res;
    }

    /**
     * 删除指定代码模板
     *
     * @param [type] $template_id 模板id
     * @return void
     */
    public function deletetemplate($template_id)
    {
        $url = "https://api.weixin.qq.com/wxa/deletetemplate?access_token=$this->accessToken";
        $params = [
            'template_id' => $template_id,
        ];
        $res = Http::post($url, json_encode($params));
        $res = json_decode($res, true);
        if ($res['errcode'] != 0) {
            Log::record($res, 'error');
        }
        return $res;
    }

    /**
     * 上传代码
     *
     * @param [type] $id 商户id
     * @param [type] $template_id 模板id
     * @return void
     */
    public function commit($id,$commit_params)
    {
        $access_token = $this->getAuthorizerToken($id);
        $url = "https://api.weixin.qq.com/wxa/commit?access_token=$access_token";
        $res = Http::post($url, json_encode($commit_params));
        $res = json_decode($res, true);
        if ($res['errcode'] != 0) {
            Log::record($res, 'error');
        }
        return $res;
    }

    /**
     * 提交审核
     *
     * @param [type] $id 商户id
     * @return void
     */
    public function submit_audit($id)
    {
        $access_token = $this->getAuthorizerToken($id);
        $url = "https://api.weixin.qq.com/wxa/submit_audit?access_token=$access_token";
        $params = [
            //'version_desc'=>'',//小程序版本说明和功能解释
        ];
        $res = Http::post($url, json_encode($params));
        $res = json_decode($res, true);
        if ($res['errcode'] != 0) {
            Log::record($res, 'error');
        }
        return $res;
    }

    /**
     * 发布已通过审核的小程序
     *
     * @param [type] $id 商户id
     * @return void
     */
    public function release($id)
    {
        $access_token = $this->getAuthorizerToken($id);
        $url = "https://api.weixin.qq.com/wxa/release?access_token=$access_token";
        $res = Http::post($url);
        $res = json_decode($res, true);
        if ($res['errcode'] != 0) {
            Log::record($res, 'error');
        }
        return $res;
    }

    /**
     * 加急审核申请
     *
     * @param [type] $id 商户id
     * @return void
     */
    public function speedupaudit($id)
    {
        $access_token = $this->getAuthorizerToken($id);
        $url = "https://api.weixin.qq.com/wxa/speedupaudit?access_token=$access_token";
        $res = Http::post($url);
        $res = json_decode($res, true);
        if ($res['errcode'] != 0) {
            Log::record($res, 'error');
        }
        return $res;
    }
}
