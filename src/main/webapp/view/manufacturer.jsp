<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<script type="text/javascript">
    $(function () {
        var toolbar = [{
            iconCls: 'icon-add',
            text: "添加",
            handler: function () {
                $("#addManufacturerDialog").dialog("open");
            }
        }, '-', {
            text: "修改",
            iconCls: 'icon-edit',
            handler: function () {
                //获取选中行
                var row = $("#manufacturerDatagrid").edatagrid("getSelected");
                if (row != null) {
                    //编辑指定行
                    var index = $("#manufacturerDatagrid").edatagrid("getRowIndex", row);
                    $("#manufacturerDatagrid").edatagrid("editRow", index);
                } else {
                    alert("请先选中行")
                }
            }
        }, '-', {
            text: "删除",
            iconCls: 'icon-remove',
            handler: function () {
                ///获取选中行
                var row = $("#manufacturerDatagrid").edatagrid("getSelected");
                if (row != null) {
                    if (confirm("确定删除？")) {
                        $.get(
                            "${pageContext.request.contextPath}/manufacturer/removeManufacturer",
                            {id: row.cargoId},
                            function () {
                                $("#manufacturerDatagrid").edatagrid("reload");
                                $.messager.show({
                                    title: "提示信息",
                                    msg: "删除成功"
                                });
                            }
                        );
                    }
                } else {
                    alert("请先选中行")
                }
            }
        }, '-', {
            text: "保存",
            iconCls: 'icon-save',
            handler: function () {
                $("#manufacturerDatagrid").edatagrid("saveRow");
                $("#manufacturerDatagrid").edatagrid("reload");
            }
        }, '-', {
            text: "导出数据",
            iconCls: 'icon-redo',
            handler: function () {
                window.location.href = "${pageContext.request.contextPath}/cargo/exportCargo";
            }
        }
        ]
        $("#manufacturerDatagrid").edatagrid({
            title: "厂家",
            fitColumns: true,
            url: "${pageContext.request.contextPath}/manufacturer/allManufacturersThisPage",
            columns: [[
                {field: 'manufacturerId', title: '厂家编号', width: '100'},
                {
                    field: 'manufacturerName', title: '厂家名称', width: '100', editor: {
                        type: "text",
                        options: {required: true}
                    }
                },
                {
                    field: 'manufacturerPhone', title: '联系方式', width: '200', editor: {
                        type: "text",
                        options: {required: true}
                    }
                },
                {
                    field: 'manufacturerAddress', title: '厂家地址', width: '100', editor: {
                        type: "text",
                        options: {required: true}
                    }
                },
                {
                    field: 'cooperationTimes', title: '进货次数', width: '100', editor: {
                        type: "text",
                        options: {required: true}
                    }
                },

            ]],
            toolbar: toolbar,
            loadMsg: "正在努力加载中，请稍候...",
            pagination: true,
            pageSize: 5,
            pageList: [5, 10, 15],
            autoSave: true,
            method: "get",
            updateUrl: "${pageContext.request.contextPath}/manufacturer/editManufacturer",

        });
        //添加
        $("#addManufacturerDialog").dialog({
            title: '添加厂家',
            width: 400,
            height: 260,
            closed: true,
            cache: false,
            href: '${pageContext.request.contextPath}/view/addManufacturer.jsp',
            modal: true
        });

    })
</script>


<div>
    <table id="manufacturerDatagrid">

    </table>
</div>
<div id="addManufacturerDialog" align="center">
</div>
