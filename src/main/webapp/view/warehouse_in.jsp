<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
    $(function () {
        $("#inCargoBtn").linkbutton({
            text: "确认添加",
            iconCls: "icon-add",
            onClick: function () {
                $("#inOperationForm").form("submit");
            }
        });
        $("#inOperationForm").form({
            url: "${pageContext.request.contextPath}/operation/addOperation",
            onSubmit: function () {
                return true;
            },
            success: function () {
                $("#inOperationDialog").dialog("close");
                $.messager.show({
                    title: "提醒",
                    msg: "入库成功"
                });
                $("#operationDatagrid").edatagrid("reload");
                $("#cargoDatagrid").edatagrid("reload");
            }
        });
    })
</script>
<form id="inOperationForm" enctype="multipart/form-data" method="post">
    <table align="center">
        <tr>
            <td>货物名称：</td>
            <td><input type="text" name="cargoName"></td>
        </tr>
        <tr>
            <td>入库数量：</td>
            <td><input type="text" name="inNumber"></td>
        </tr>
        <tr>
            <td>进货厂家：</td>
            <td><input type="text" name="manufacturerName"></td>
        </tr>
    </table>
    <p align="center">
        <a id="inCargoBtn"></a>
    </p>
</form>