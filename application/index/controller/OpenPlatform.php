<?php

namespace app\index\controller;

use EasyWeChat\Foundation\Application;
// use app\common\controller\Backend;
use think\Controller;
use app\common\model\OpenPlatform as OpenPlatformModel;

/**
 * 微信第三方开放平台
 */
class OpenPlatform extends Controller
{

    public $openPlatform;
    public $businessModel;
    public $miniprogramModel;
    public $openPlatformModel;
    public $accessToken;


    public function _initialize()
    {
        parent::_initialize();

        $this->openPlatformModel = new OpenPlatformModel;
        $this->businessModel = new \app\admin\model\Business;
        $this->miniprogramModel = new \app\admin\model\Miniprogram;
        $this->openPlatform = $this->openPlatformModel->openPlatform;
    }


    /**
     * 监听微信服务器推送事件
     *
     * @return void
     */
    public function ticket()
    {
        
        // 默认处理方式
        $this->openPlatform->server->serve();

    }


    /**
     * 消息与事件接收URL
     *
     * $id 商户id
     * @return void
     */
    public function callback($id = null)
    {
        $param = request()->param();
        $miniprogram = $this->miniprogramModel->where(['business_id'=>$id])->find();
        if($miniprogram){
            $authorizer_token = json_decode($miniprogram['authorizer_token'],true);
            if(isset($authorizer_token['expires_in']) && $authorizer_token['expires_in'] + $this->openPlatformModel->expires > time()){
                $this->success('授权成功',request()->domain().'/ZpQNKcLtFz.php/business?ref=addtabs');
            }  
        }
        $this->authorization($param['auth_code'],$id,$miniprogram);
        $this->success('授权成功',request()->domain().'/ZpQNKcLtFz.php/business?ref=addtabs');
    }

    /**
     * 授权信息
     *
     * @param [type] $authorizationCode 授权码
     * @param [type] $id 商户id
     * @param [type] $miniprogram 小程序表数据
     * @return void
     */
    private function authorization($authorizationCode,$id,$miniprogram)
    {
        //使用授权码换取公众号的接口调用凭据和授权信息
        $author = $this->openPlatform->getAuthorizationInfo($authorizationCode);
        $authorization_info = $author->authorization_info;

        //授权方 appid
        $authorizer_appid = $authorization_info['authorizer_appid'];

        //接口调用令牌
        $authorizer_access_token = $authorization_info['authorizer_access_token'];

        //刷新令牌
        $authorizer_refresh_token = $authorization_info['authorizer_refresh_token'];

        //authorizer_access_token 的有效期
       // $expires_in = $authorization_info['expires_in'];
        
        //获取授权方的公众号帐号基本信息
        $getAuthorizerInfo = $this->openPlatform->getAuthorizerInfo($authorizer_appid);

        $data = [
            'appid'=>$authorizer_appid,
            'name'=>$getAuthorizerInfo['authorizer_info']['nick_name'],
            'qrcode'=>$getAuthorizerInfo['authorizer_info']['qrcode_url'],
            'authorizer_token'=>json_encode([
                'authorizer_access_token'=>$authorizer_access_token,
                'authorizer_refresh_token'=>$authorizer_refresh_token,
                'expires_in'=>time() + $this->openPlatformModel->expires,
            ]),
            'authorizer_info'=>json_encode($getAuthorizerInfo['authorizer_info']),
            'business_id'=>$id,
        ];

        //判断小程序是否已被其他商户授权
        $is_miniprogram = $this->miniprogramModel
        ->where(['appid'=>$authorizer_appid])
        ->where(['business_id','<>',$id])
        ->find();

        if($is_miniprogram){
            unset($data['business_id']);
            $this->miniprogramModel->save($data,['appid' => $authorizer_appid]);
            $this->error('小程序已被绑定');
        }
       
        if($miniprogram){
            $this->miniprogramModel->save($data,['id' => $miniprogram['id']]);
        }else{
            $this->miniprogramModel->save($data);
            $miniprogram['id'] = $this->miniprogramModel->id;
        }

        $this->businessModel->save(['miniprogram_id'=>$miniprogram['id']],['id'=>$id]);
        $this->redirect( request()->domain().'/ZpQNKcLtFz.php/business?ref=addtabs');
        
    }

}
