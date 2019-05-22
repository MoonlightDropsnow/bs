<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<script type="text/javascript">
    $(function () {
        var toolbar = [{
            iconCls: 'icon-add',
            text: "出库",
            handler: function () {
                $("#outOperationDialog").dialog("open");
            }
        }, '-', {
            text: "修改",
            iconCls: 'icon-edit',
            handler: function () {
                //获取选中行
                var row = $("#operationOutDatagrid").edatagrid("getSelected");
                if (row != null) {
                    //编辑指定行
                    var index = $("#operationOutDatagrid").edatagrid("getRowIndex", row);
                    $("#operationOutDatagrid").edatagrid("editRow", index);
                } else {
                    alert("请先选中行")
                }
            }
        }, '-', {
            text: "删除",
            iconCls: 'icon-remove',
            handler: function () {
                ///获取选中行
                var row = $("#operationOutDatagrid").edatagrid("getSelected");
                if (row != null) {
                    if (confirm("确定删除？")) {
                        $.get(
                            "${pageContext.request.contextPath}/cargo/removeCargo",
                            {id: row.id},
                            function () {
                                $("#operationOutDatagrid").edatagrid("reload");
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
        }, /*'-', {
            text: "保存",
            iconCls: 'icon-save',
            handler: function () {
                $("#operationOutDatagrid").edatagrid("saveRow");
                $("#operationOutDatagrid").edatagrid("reload");
            }
        }*/ '-', {
            text: "查看详情",
            iconCls: 'icon-edit',
            handler: function () {
                //获取选中行
                var row = $("#operationDatagrid").edatagrid("getSelected");
                if (row != null) {
                    //编辑指定行
                    var index = $("#operationDatagrid").edatagrid("getRowIndex", row);
                    $("#operationDatagrid").edatagrid("editRow", index);
                } else {
                    alert("请先选中行")
                }
            }
        },'-', {
            text: "导出数据",
            iconCls: 'icon-redo',
            handler: function () {
                window.location.href = "${pageContext.request.contextPath}/cargo/exportCargo";
            }
        }]
        $("#operationOutDatagrid").edatagrid({
            title: "货物",
            fitColumns: true,
            url: "${pageContext.request.contextPath}/operation/allOutOperationsThisPage",
            columns: [[
                {field: 'operationId', title: '货物编号', width: '100'},
                {field: 'cargoName', title: '货物名称', width: '100'},
                {field: 'outNumber', title: '出货数量', width: '200'},
                {field: 'operationTime', title: '操作时间', width: '100'},

            ]],
            toolbar: toolbar,
            loadMsg: "正在努力加载中，请稍候...",
            pagination: true,
            pageSize: 5,
            pageList: [5, 10, 15],
            autoSave: true,
            method: "get",
            updateUrl: "${pageContext.request.contextPath}/cargo/editCargo",

        });
        //出库
        $("#outOperationDialog").dialog({
            title: '货物出库',
            width: 400,
            height: 260,
            closed: true,
            cache: false,
            href: '${pageContext.request.contextPath}/view/warehouse_out.jsp',
            modal: true
        });

    })
</script>


<div>
    <table id="operationOutDatagrid">

    </table>
</div>
<div id="outOperationDialog" align="center">
</div>
