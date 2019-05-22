<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
    $(function () {
        $("#addAdminBtn").linkbutton({
            text: "确认添加",
            iconCls: "icon-add",
            onClick: function () {
                $("#adminForm").form("submit");
            }
        });
        $("#adminForm").form({
            url: "${pageContext.request.contextPath}/admin/addAdmin",
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function () {
                $("#addAdminDialog").dialog("close");
                $.messager.show({
                    title: "提醒",
                    msg: "添加成功"
                });
                $("#adminDatagrid").edatagrid("reload");
            }
        });
    })
</script>
<form id="adminForm" method="post">
    <table align="center">
        <tr>
            <td>账户名称：</td>
            <td><input type="text" class="easyui-validatebox" required="true" name="name"></td>
        </tr>
        <tr>
            <td>账户密码：</td>
            <td><input type="text" class="easyui-validatebox" required="true" name="password"></td>
        </tr>
        <tr>
            <td>账户级别：</td>
            <td><input type="text" class="easyui-validatebox" required="true" name="duty"></td>
        </tr>
    </table>
    <p align="center">
        <a id="addAdminBtn"></a>
    </p>
</form>