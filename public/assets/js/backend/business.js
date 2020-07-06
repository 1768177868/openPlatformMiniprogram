define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {


        index: function () {

            // $(document).on('click','.btn-authorize',function(e){
            //     alert('a');
            //     console.log($(this))
            //     console.log(e)
            // });
            

            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'business/index' + location.search,
                    add_url: 'business/add',
                    edit_url: 'business/edit',
                    del_url: 'business/del',
                    multi_url: 'business/multi',
                    authorize_url: 'business/authorize',
                    table: 'business',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'name', title: __('Name')},
                        {field: 'domain', title: __('Domain')},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'expiretime', title: __('Expiretime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.expiretime},
                        {field: 'miniprogram.name', title: __('Miniprogram.name')},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate,  
                        buttons: [
                            {
                                name: 'Authorize',
                                text: __('Authorize'),
                                title: __('Authorize'),
                                classname: 'btn btn-xs btn-warning btn-addtabs btn-authorize',
                                icon: 'fa fa-folder-o',
                                url: '{authorize_url}'
                            },


                            // {
                            //     name: 'detail',
                            //     text: __('弹出窗口打开'),
                            //     title: __('弹出窗口打开'),
                            //     classname: 'btn btn-xs btn-primary btn-dialog',
                            //     icon: 'fa fa-list',
                            //     url: 'example/bootstraptable/detail',
                            //     callback: function (data) {
                            //         Layer.alert("接收到回传数据：" + JSON.stringify(data), {title: "回传数据"});
                            //     },
                            //     visible: function (row) {
                            //         //返回true时按钮显示,返回false隐藏
                            //         return true;
                            //     }
                            // },

                            // {
                            //     name: 'ajax',
                            //     text: __('发送Ajax'),
                            //     title: __('发送Ajax'),
                            //     classname: 'btn btn-xs btn-success btn-magic btn-ajax',
                            //     icon: 'fa fa-magic',
                            //     url: 'example/bootstraptable/detail',
                            //     confirm: '确认发送',
                            //     success: function (data, ret) {
                            //         Layer.alert(ret.msg + ",返回数据：" + JSON.stringify(data));
                            //         //如果需要阻止成功提示，则必须使用return false;
                            //         //return false;
                            //     },
                            //     error: function (data, ret) {
                            //         console.log(data, ret);
                            //         Layer.alert(ret.msg);
                            //         return false;
                            //     }
                            // },
                            // {
                            //     name: 'addtabs',
                            //     text: __('新选项卡中打开'),
                            //     title: __('新选项卡中打开'),
                            //     classname: 'btn btn-xs btn-warning btn-addtabs',
                            //     icon: 'fa fa-folder-o',
                            //     url: 'example/bootstraptable/detail'
                            // }
                        ],
                        formatter: Table.api.formatter.operate}
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
                url: 'business/recyclebin' + location.search,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'name', title: __('Name'), align: 'left'},
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
                                    url: 'business/restore',
                                    refresh: true
                                },
                                {
                                    name: 'Destroy',
                                    text: __('Destroy'),
                                    classname: 'btn btn-xs btn-danger btn-ajax btn-destroyit',
                                    icon: 'fa fa-times',
                                    url: 'business/destroy',
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
        //授权
        authorize: function () {
            alert('afsafasf')
            //Controller.api.bindevent();
        },
        //解绑
        Unbound: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        },
      
    };
    return Controller;
});