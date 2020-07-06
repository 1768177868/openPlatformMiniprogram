<?php

namespace app\admin\model;

use think\Model;
use traits\model\SoftDelete;

class Miniprogram extends Model
{

    use SoftDelete;

    

    // 表名
    protected $name = 'miniprogram';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    protected $deleteTime = 'deletetime';

    // 追加属性
    protected $append = [
        'status_text'
    ];
    

    
    public function getStatusList()
    {
        return ['0' => __('Status 0'), '1' => __('Status 1'), '2' => __('Status 2'), '3' => __('Status 3'),'3' => __('Status 4')];
    }


    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['status']) ? $data['status'] : '');
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }




    public function template()
    {
        return $this->belongsTo('Template', 'template_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function business()
    {
        return $this->belongsTo('Business', 'business_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
