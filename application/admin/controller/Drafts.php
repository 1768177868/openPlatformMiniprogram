<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use app\common\model\OpenPlatform as OpenPlatformModel;

/**
 * 草稿箱
 *
 * @icon fa fa-circle-o
 */
class Drafts extends Backend
{
    
    /**
     * Drafts模型对象
     * @var \app\admin\model\Drafts
     */
    protected $model = null;
    protected $openPlatformModel;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\Drafts;
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
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            $res = $this->openPlatformModel->gettemplatedraftlist();
            if ($res['errcode'] == 0) {
                $list = $res['draft_list'];
            }else{
                $list = [];
            } 
            foreach($list as $k=>$v){
                $list[$k]['id'] = $v['draft_id'];
            }
            $result = array("total" => count($list), "rows" => $list);
            return json($result);
        }
        return $this->view->fetch();
    }

    /**
     * 添加到模板库
     *
     * @param [type] $ids 草稿id
     * @return void
     */
    public function addtotemplate($ids = null)
    {
        if ($this->request->isPost()) {
            $res = $this->openPlatformModel->addtotemplate($ids);
            if($res['errcode'] == 0){
                $this->success();
            }
            $this->error($res['errmsg']);
        }
    }

}
