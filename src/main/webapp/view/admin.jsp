<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<script type="text/javascript">
    $(function () {
        var toolbar = [{
            iconCls: 'icon-add',
            text: "添加",
            handler: function () {
                $("#addCargoDialog").dialog("open");
            }
        }, '-', {
            text: "修改",
            iconCls: 'icon-edit',
            handler: function () {
                //获取选中行
                var row = $("#adminDatagrid").edatagrid("getSelected");
                if (row != null) {
                    //编辑指定行
                    var index = $("#adminDatagrid").edatagrid("getRowIndex", row);
                    $("#adminDatagrid").edatagrid("editRow", index);
                } else {
                    alert("请先选中行")
                }
            }
        }, '-', {
            text: "删除",
            iconCls: 'icon-remove',
            handler: function () {
                ///获取选中行
                var row = $("#adminDatagrid").edatagrid("getSelected");
                if (row != null) {
                    if (confirm("确定删除？")) {
                        $.get(
                            "${pageContext.request.contextPath}/cargo/removeCargo",
                            {id: row.id},
                            function () {
                                $("#adminDatagrid").edatagrid("reload");
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
                $("#adminDatagrid").edatagrid("saveRow");
                $("#adminDatagrid").edatagrid("reload");
            }
        }]
        $("#adminDatagrid").edatagrid({
            title: "货物",
            fitColumns: true,
            url: "${pageContext.request.contextPath}/admin/allAdminsThisPage",
            columns: [[
                {field: 'id', title: '账户编号', width: '100'},
                {field: 'name', title: '账户名称', width: '100'},
                {field: 'password', title: '账户密码', width: '200'},

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
        $("#addCargoDialog").dialog({
            title: '添加货物',
            width: 400,
            height: 260,
            closed: true,
            cache: false,
            href: '${pageContext.request.contextPath}/view/addCargo.jsp',
            modal: true
        });

    })
</script>


<div>
    <table id="adminDatagrid">

    </table>
</div>
<div id="addCargoDialog" align="center">
</div>