<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
    $(function () {
        $("#outCargoBtn").linkbutton({
            text: "确认出库",
            iconCls: "icon-add",
            onClick: function () {
                $("#outOperationForm").form("submit");
            }
        });
        $("#outOperationForm").form({
            url: "${pageContext.request.contextPath}/operation/addOperation",
            onSubmit: function () {
                return true;
            },
            success: function () {
                $("#outOperationDialog").dialog("close");
                $.messager.show({
                    title: "提醒",
                    msg: "出库成功"
                });
                $("#operationOutDatagrid").edatagrid("reload");
                $("#cargoDatagrid").edatagrid("reload");
            }
        });
    })
</script>
<form id="outOperationForm" enctype="multipart/form-data" method="post">
    <table align="center">
        <tr>
            <td>货物名称：</td>
            <td><input type="text" name="cargoName"></td>
        </tr>
        <tr>
            <td>出库数量：</td>
            <td><input type="text" name="outNumber"></td>
        </tr>
    </table>
    <p align="center">
        <a id="outCargoBtn"></a>
    </p>
</form>