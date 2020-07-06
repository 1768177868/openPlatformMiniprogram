define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {

            //更新小程序审核状态
            $(document).on('click','.btn-updateaudit',function () {
                var url = $.fn.bootstrapTable.defaults.extend.updateaudit_url;
                Fast.api.ajax(url, function () {
                    table.bootstrapTable('refresh');
                });
                Layer.close(index);
            });

             //批量上传小程序代码按钮事件
            $(document).on('click','.btn-commit',function () {
                var ids = Table.api.selectedids(table);
                var url = $.fn.bootstrapTable.defaults.extend.commit_url;
                var ids = ids.toString()
                url = url+'/ids/'+ids
                Fast.api.open(url, __('Commit'), $(this).data() || {});
            });

            //批量审核小程序按钮事件
            $(document).on('click','.btn-submitaudit',function () {
                var ids = Table.api.selectedids(table);
                Layer.confirm(
                    __('确定要提交审核?', ids.length),
                    {icon: 3, title: __('Warning'), offset: 0, shadeClose: true},
                    function (index) {
                        for(var i=0;i<ids.length;i++){
                            var url = $.fn.bootstrapTable.defaults.extend.submitaudit_url;
                            Fast.api.ajax(url+'/ids/'+ids[i], function () {
                                table.bootstrapTable('refresh');
                                
                            });
                            Layer.close(index);
                        }
                    }
                );
            });
            
            //批量发布小程序按钮事件
            $(document).on('click','.btn-release',function () {
                var ids = Table.api.selectedids(table);
                Layer.confirm(
                    __('确定要发布小程序?', ids.length),
                    {icon: 3, title: __('Warning'), offset: 0, shadeClose: true},
                    function (index) {
                        for(var i=0;i<ids.length;i++){
                            var url = $.fn.bootstrapTable.defaults.extend.release_url;
                            Fast.api.ajax(url+'/ids/'+ids[i], function () {
                                table.bootstrapTable('refresh');
                                
                            });
                            Layer.close(index);
                        }
                    }
                );
            });


            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'miniprogram/index' + location.search,
                    add_url: 'miniprogram/add',
                    edit_url: 'miniprogram/edit',
                    del_url: 'miniprogram/del',
                    multi_url: 'miniprogram/multi',
                    commit_url: 'miniprogram/commit_batch',
                    submitaudit_url:'miniprogram/submit_audit',
                    release_url: 'miniprogram/release',
                    updateaudit_url: 'miniprogram/update_audit',
                    table: 'miniprogram',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                pageSize: 50,
                columns: [
                    [
                        {checkbox: true},
                        {
                            field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate,
                            // formatter: Table.api.formatter.operate
                            formatter: Controller.api.formatter.operate,
                            buttons: [
                                {
                                    name: 'config',
                                    text: __('Config'),
                                    title: __('Config'),
                                    classname: 'btn btn-xs btn-primary btn-dialog btn-config',
                                    icon: 'fa',
                                    url: 'miniprogram/config',
                                    callback: function (data) {
                                        console.log(data)
                                        //Layer.alert("接收到回传数据：" + JSON.stringify(data), { title: "回传数据" });
                                    },
                                    visible: function (row) {
                                        console.log(row);
                                        //返回true时按钮显示,返回false隐藏
                                        return true;
                                    }
                                },
                                {
                                    name: 'commit',
                                    text: __('UpCode'),
                                    title: __('UpCode'),
                                    classname: 'btn btn-xs btn-primary btn-dialog',
                                    icon: 'fa',
                                    url: 'miniprogram/commit',
                                    callback: function (data) {
                                        console.log(data)
                                        //Layer.alert("接收到回传数据：" + JSON.stringify(data), { title: "回传数据" });
                                    },
                                    visible: function (row) {
                                        //返回true时按钮显示,返回false隐藏
                                        return true;
                                    }
                                },
                                {
                                    name: 'qrcode',
                                    text: __('ExperienceCode'),
                                    title: __('ExperienceCode'),
                                    classname: 'btn btn-xs btn-primary btn-dialog',
                                    icon: 'fa',
                                    url: 'miniprogram/qrcode',
                                    callback: function (data) {
                                        console.log(data)
                                        //Layer.alert("接收到回传数据：" + JSON.stringify(data), { title: "回传数据" });
                                    },
                                    visible: function (row) {
                                        //返回true时按钮显示,返回false隐藏
                                        return true;
                                    }
                                },
                                {
                                    name: 'ajax',
                                    text: __('SubmitAudit'),
                                    title: __('SubmitAudit'),
                                    classname: 'btn btn-xs btn-success btn-magic btn-ajax',
                                    icon: 'fa',
                                    url: 'miniprogram/submit_audit',
                                    confirm: '确定要提交审核？',
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
                                {
                                    name: 'ajax',
                                    text: __('Release'),
                                    title: __('Release'),
                                    classname: 'btn btn-xs btn-success btn-magic btn-ajax',
                                    icon: 'fa',
                                    url: 'miniprogram/release',
                                    confirm: '确定要发布小程序？',
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
                        { field: 'id', title: __('Id') },
                        { field: 'appid', title: __('Appid') },
                        { field: 'name', title: __('Name') },
                        { field: 'qrcode', title: __('Qrcode'), formatter: Table.api.formatter.image, events: Table.api.events.img,
                       
                        },                        
                        { field: 'status', title: __('Status'), searchList: { "0": __('Status 0'), "1": __('Status 1'), "2": __('Status 2'), "3": __('Status 3'),"4": __('Status 4') }, formatter: Table.api.formatter.status },
            
                        { field: 'template_version', title: __('Template.version') },
                        { field: 'business.name', title: __('Business.name') },

                        { field: 'createtime', title: '创建时间', operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime },
  
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
                url: 'miniprogram/recyclebin' + location.search,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        { checkbox: true },
                        { field: 'id', title: __('Id') },
                        { field: 'name', title: __('Name'), align: 'left' },
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
                                    url: 'miniprogram/restore',
                                    refresh: true
                                },
                                {
                                    name: 'Destroy',
                                    text: __('Destroy'),
                                    classname: 'btn btn-xs btn-danger btn-ajax btn-destroyit',
                                    icon: 'fa fa-times',
                                    url: 'miniprogram/destroy',
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
        config: function () {
            Controller.api.bindevent();
        },
        commit: function () {
            Controller.api.bindevent();
        },

        commit_batch: function () {
            Controller.api.bindevent();
        },

        submitaudit_batch: function () {
            Controller.api.bindevent();
        },

        release_batch: function () {
            Controller.api.bindevent();
        },

        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            },
            formatter: {
                //隐藏编辑按钮
                operate: function (value, row, index) {
                    var table = this.table
                    $(table).data('operate-edit', null)
                    $(table).data('operate-del', null)
                    this.table = table
                    return Table.api.formatter.operate.call(this, value, row, index);
                },
            },
        }
    };
    return Controller;
});