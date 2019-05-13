<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<script type="text/javascript">
    $(function () {
        var toolbar = [{
            iconCls: 'icon-add',
            text: "入库",
            handler: function () {
                $("#inOperationDialog").dialog("open");
            }
        }, '-', {
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
        }]
        $("#operationDatagrid").edatagrid({
            title: "货物",
            fitColumns: true,
            url: "${pageContext.request.contextPath}/operation/allInOperationsThisPage",
            columns: [[
                {field: 'operationId', title: '货物编号', width: '100'},
                {field: 'cargoName', title: '货物名称', width: '100'},
                {field: 'inNumber', title: '进货数量', width: '200'},
                {field: 'operationTime', title: '操作时间', width: '100'},

            ]],
            toolbar: toolbar,
            loadMsg: "正在努力加载中，请稍候...",
            pagination: true,
            pageSize: 3,
            pageList: [3, 6, 9],
            autoSave: true,
            method: "get",
            updateUrl: "${pageContext.request.contextPath}/cargo/editCargo",
        });
        //添加
        $("#inOperationDialog").dialog({
            title: '货物入库',
            width: 400,
            height: 260,
            closed: true,
            cache: false,
            href: '${pageContext.request.contextPath}/view/warehouse_in.jsp',
            modal: true
        });

    })
</script>


<div>
    <table id="operationDatagrid">

    </table>
</div>
<div id="inOperationDialog" align="center">
</div>
