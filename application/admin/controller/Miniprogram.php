<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use app\common\model\OpenPlatform as OpenPlatformModel;

/**
 * 小程序管理
 *
 * @icon fa fa-circle-o
 */
class Miniprogram extends Backend
{

    /**
     * Miniprogram模型对象
     * @var \app\admin\model\Miniprogram
     */
    protected $model = null;
    protected $openPlatformModel;

    //不需要权限控制 但是需要登陆
    protected $noNeedRight = [];

    //不需要登陆
    protected $noNeedLogin = [];


    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\Miniprogram;
        $this->openPlatformModel = new OpenPlatformModel;
        $this->view->assign("statusList", $this->model->getStatusList());
    }

    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */



    /**
     * 查看
     */
    public function index()
    {
        //当前是否为关联查询
        $this->relationSearch = true;
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                ->with(['business'])
                // ->with(['template','business'])
                ->where($where)
                ->order($sort, $order)
                ->count();

            $list = $this->model
                ->with(['business'])
                //->with(['template','business'])
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            foreach ($list as $row) {
                $row->visible(['id', 'appid', 'name', 'qrcode', 'status', 'template_id', 'template_version', 'business_id', 'createtime']);
                // $row->visible(['template']);
                // $row->getRelation('template')->visible(['version']);
                $row->visible(['business']);
                $row->getRelation('business')->visible(['name']);

            }
          
            $list = collection($list)->toArray();
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }


    /**
     * 更新小程序审核状态
     *
     * @return void
     */
    public function update_audit()
    {
        $list = $this->model->select();
        $list = collection($list)->toArray();
        foreach($list as $v){
            $res = $this->openPlatformModel->get_latest_auditstatus($v['id']);
            if($res['errcode'] == 0){
                $this->model->save(['status'=>$res['status']],['id'=>$v['id']]);
            }else{
                $this->model->save(['status'=>4],['id'=>$v['id']]);
            }
        }
        $this->success();
      
    }
    

    /**
     * 小程序自定义的配置 ext.json
     *
     * @param [type] $ids
     * @return void
     */
    public function config($ids = null)
    {
        $row = $this->model->get($ids);
        if (!$row) {
            $this->error(__('No Results were found'));
        }
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds)) {
            if (!in_array($row[$this->dataLimitField], $adminIds)) {
                $this->error(__('You have no permission'));
            }
        }

        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");

            if (!empty($params['config'])) {
                $config = json_decode($params['config'], true);
                if (!is_array($config)) {
                    $this->error('不是合法的json数据');
                }
            }

            $result = $row->allowField(true)->save($params);
            if ($result !== false) {
                $this->success();
            } else {
                $this->error(__('No rows were updated'));
            }
        }

        $this->view->assign("row", $row);
        return $this->view->fetch();
    }

    /**
     * 小程序体验码
     *
     * @param [type] $ids
     * @return void
     */
    function qrcode($ids = null)
    {
        $row = $this->model->get($ids);
        if (!$row) {
            $this->error(__('No Results were found'));
        }
        $qrcode = $this->openPlatformModel->get_qrcode($row['business_id']);
        $this->view->assign("qrcode", $qrcode);
        return $this->view->fetch();
    }

    /**
     * 上传代码
     *
     * @param [type] $ids
     * @return void
     */
    function commit($ids = null)
    {
        $row = $this->model->get($ids);
        if (!$row) {
            $this->error(__('No Results were found'));
        }

        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            $template_version = $this->template_version($params['template_id']);

            //配置文件
            if(empty($row['config'])){
                $ext_json = json_encode([]);
            }else{
                $ext_json = $row['config'];
            }
            
            //上传参数
            $commit_params = [
                'template_id' => $row['template_id'],
                'ext_json' => $ext_json,
                'user_version' => $row['template_version'],
                'user_desc' => '',
            ];
            
            $res = $this->openPlatformModel->commit($row['business_id'],$commit_params);
            if ($res['errcode'] != 0) {
                $this->error($row['name'].' 上传代码失败 :'.$res['errmsg']);
            }
            $params = [
                'template_id' => $params['template_id'],
                'template_version' => $template_version,
            ];
            $this->model->save($params, ['id' => $row['id']]);
            $this->success($row['name'].' 上传代码成功');
        }

        $this->view->assign("row", $row);

        return $this->view->fetch();
    }


    /**
     * 批量上传代码
     *
     * @param [type] $ids
     * @return void
     */
    public function commit_batch($ids = null)
    {
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            $template_version = $this->template_version($params['template_id']);
            $ids = explode(',', $params['ids']);

            foreach ($ids as $id) {
                $row = $this->model->get($id);

                //配置文件
                if(empty($row['config'])){
                    $ext_json = json_encode([]);
                }else{
                    $ext_json = $row['config'];
                }
                

                //上传参数
                $commit_params = [
                    'template_id' => $row['template_id'],
                    'ext_json' => $ext_json,
                    'user_version' => $row['template_version'],
                    'user_desc' => '',
                ];
                
                $res = $this->openPlatformModel->commit($row['business_id'],$commit_params);
                if ($res['errcode'] == 0) {
                    $params = [
                        'template_id' => $params['template_id'],
                        'template_version' => $template_version,
                    ];

                    $this->model->save($params, ['id' => $row['id']]);
                }
            }

            $this->success();
        }

        $this->view->assign("ids", $ids);

        return $this->view->fetch();
    }


    /**
     * 模板版本
     *
     * @param [type] $template_id
     * @return void
     */
    public function template_version($template_id)
    {
        $res = $this->openPlatformModel->gettemplatelist();
        $template_list = $res['template_list'];
        $template_version = '';
        foreach ($template_list as $v) {
            if ($v['template_id'] == $template_id) {
                $template_version = $v['user_version'];
                break;
            }
        }
        return $template_version;
    }

    /**
     * 模板描述
     *
     * @param [type] $template_id
     * @return void
     */
    public function template_version_desc($template_id)
    {
        $res = $this->openPlatformModel->gettemplatelist();
        $template_list = $res['template_list'];
        $template_version_desc = '';
        foreach ($template_list as $v) {
            if ($v['template_id'] == $template_id) {
                $template_version_desc = $v['user_desc'];
                break;
            }
        }
        return $template_version_desc;
    }


    /**
     * 提交审核
     *
     * @param [type] $ids
     * @return void
     */
    public function submit_audit($ids = null)
    {
        $row = $this->model->get($ids);
        if (!$row) {
            $this->error(__('No Results were found'));
        }

        if ($this->request->isPost()) {
            $res = $this->openPlatformModel->submit_audit($row['business_id']);
            if ($res['errcode'] != 0) {
                $this->error($row['name'].' 提交审核失败 :'.$res['errmsg']);
            }
            $this->success($row['name'].' 提交审核成功');
        }
    }


    /**
     * 发布小程序
     *
     * @param [type] $ids
     * @return void
     */
    public function release($ids = null)
    {
        $row = $this->model->get($ids);
        if (!$row) {
            $this->error(__('No Results were found'));
        }

        if ($this->request->isPost()) {
            $res = $this->openPlatformModel->release($row['business_id']);
            if ($res['errcode'] == 0) {
                $this->success($row['name'].' 发布成功');
            }
            $this->error($row['name'].' 发布失败 :'.$res['errmsg']);
        }
    }

}
