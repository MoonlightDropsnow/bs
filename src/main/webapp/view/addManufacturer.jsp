<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
    $(function () {
        $("#addManufacturerBtn").linkbutton({
            text: "确认添加",
            iconCls: "icon-add",
            onClick: function () {
                $("#manufacturerForm").form("submit");
            }
        });
        $("#manufacturerForm").form({
            url: "${pageContext.request.contextPath}/manufacturer/addManufacturer",
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function () {
                $("#addManufacturerDialog").dialog("close");
                $.messager.show({
                    title: "提醒",
                    msg: "添加成功"
                });
                $("#manufacturerDatagrid").edatagrid("reload");
            }
        });
    })
</script>
<form id="manufacturerForm" enctype="multipart/form-data" method="post">
    <table align="center">
        <tr>
            <td>厂家名称：</td>
            <td><input type="text" class="easyui-validatebox" required="true" name="manufacturerName"></td>
        </tr>
        <tr>
            <td>联系方式：</td>
            <td><input type="text" class="easyui-validatebox" required="true" name="manufacturerPhone"></td>
        </tr>
        <tr>
            <td>厂家地址：</td>
            <td><input type="text" class="easyui-validatebox" required="true" name="manufacturerAddress"></td>
        </tr>
    </table>
    <p align="center">
        <a id="addManufacturerBtn"></a>
    </p>
</form>