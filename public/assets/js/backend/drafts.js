define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'drafts/index' + location.search,
                    add_url: 'drafts/add',
                    edit_url: 'drafts/edit',
                    del_url: 'drafts/del',
                    multi_url: 'drafts/multi',
                    table: 'drafts',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                pagination:false,
                search:false,
                commonSearch:false,
                columns: [
                    [
                        // {checkbox: true},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, 
                        // formatter: Table.api.formatter.operate
                        formatter: Controller.api.formatter.operate, 
                        buttons: [
                            {
                                name: 'ajax',
                                text: __('Addtotemplate'),
                                title: __('Addtotemplate'),
                                classname: 'btn btn-xs btn-success btn-magic btn-ajax',
                                icon: 'fa',
                                url: 'drafts/addtotemplate',
                                confirm: '确定把草稿箱代码添加到模板库？',
                                success: function (data, ret) {
                                  
                                   // Layer.alert(ret.msg + ",返回数据：" + JSON.stringify(data));
                                    //如果需要阻止成功提示，则必须使用return false;
                                    //return false;
                                },
                                error: function (data, ret) {
                                    console.log(data, ret);
                                    Layer.alert(ret.msg);
                                    return false;
                                }
                            },
                        ],
                    },
                        {field: 'draft_id', title: __('Id')},
                        {field: 'user_version', title: __('Version')},
                        {field: 'create_time', title: __('CreateTime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},

                        {field: 'user_desc', title: __('Desc')},
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        recyclebin: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    'dragsort_url': ''
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: 'drafts/recyclebin' + location.search,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {
                            field: 'deletetime',
                            title: __('Deletetime'),
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        },
                        {
                            field: 'operate',
                            width: '130px',
                            title: __('Operate'),
                            table: table,
                            events: Table.api.events.operate,
                            buttons: [
                                {
                                    name: 'Restore',
                                    text: __('Restore'),
                                    classname: 'btn btn-xs btn-info btn-ajax btn-restoreit',
                                    icon: 'fa fa-rotate-left',
                                    url: 'drafts/restore',
                                    refresh: true
                                },
                                {
                                    name: 'Destroy',
                                    text: __('Destroy'),
                                    classname: 'btn btn-xs btn-danger btn-ajax btn-destroyit',
                                    icon: 'fa fa-times',
                                    url: 'drafts/destroy',
                                    refresh: true
                                }
                            ],
                            formatter: Table.api.formatter.operate
                        }
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            },
            formatter: {
                //隐藏编辑按钮
                operate:function (value,row,index) { 
                    var table = this.table
                    $(table).data('operate-edit', null)
                    $(table).data('operate-del', null)
                    this.table = table
                    return Table.api.formatter.operate.call(this, value,row,index);  
                },
            },
        }
    };
    return Controller;
});