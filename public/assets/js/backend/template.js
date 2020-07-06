define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'template/index' + location.search,
                    add_url: 'template/add',
                    edit_url: 'template/edit',
                    del_url: 'template/del',
                    multi_url: 'template/multi',
                    table: 'template',
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
                        },
                        {field: 'id', title: __('Id')},
                        {field: 'user_version', title: __('Version')},
                        {field: 'user_desc', title: __('Desc')},
                        {field: 'source_miniprogram', title:  __('Miniprogram')},
                        {field: 'developer', title: __('Developer')},
                        {field: 'create_time', title:__('CreateTime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        
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
                url: 'template/recyclebin' + location.search,
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
                                    url: 'template/restore',
                                    refresh: true
                                },
                                {
                                    name: 'Destroy',
                                    text: __('Destroy'),
                                    classname: 'btn btn-xs btn-danger btn-ajax btn-destroyit',
                                    icon: 'fa fa-times',
                                    url: 'template/destroy',
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
                    this.table = table
                    return Table.api.formatter.operate.call(this, value,row,index);  
                },
            },
        }
    };
    return Controller;
});