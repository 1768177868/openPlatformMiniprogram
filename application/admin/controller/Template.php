<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use app\common\model\OpenPlatform as OpenPlatformModel;

/**
 * 模板管理
 *
 * @icon fa fa-circle-o
 */
class Template extends Backend
{
    
    /**
     * Template模型对象
     * @var \app\admin\model\Template
     */
    protected $model = null;
    protected $openPlatformModel;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\Template;
        $this->openPlatformModel = new OpenPlatformModel;

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
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {
     
            $res = $this->openPlatformModel->gettemplatelist();
            $list = [];
            if ($res['errcode'] == 0) {
                $list = $res['template_list'];
                foreach($list as $k=>$v){
                    $list[$k]['id'] = $v['template_id'];
                }
            }

            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
              //  return $this->selectpage();
                foreach($list as $k=>$v){
                    $list[$k]['user_version'] = $v['user_version'].' - '.$v['user_desc'];
                }
                $result = array("list" => $list,"total" => count($list));
                return json($result);
            }

            $result = array("total" => count($list), "rows" => $list);
            return json($result);
        }
        return $this->view->fetch();
    }

    
    /**
     * 删除
     */
    public function del($ids = "")
    {
        if ($ids) {
            $res = $this->openPlatformModel->deletetemplate($ids);
            if($res['errcode'] == 0){
                $this->success();
            }
            $this->error($res['errmsg']);
        }
        $this->error(__('Parameter %s can not be empty', 'ids'));
    }
}
