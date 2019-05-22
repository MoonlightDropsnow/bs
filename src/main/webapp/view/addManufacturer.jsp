<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
    $(function () {
        $("#addCargoBtn").linkbutton({
            text:"确认添加",
            iconCls:"icon-add",
            onClick:function () {
                $("#cargoForm").form("submit");
            }
        });
        $("#cargoForm").form({
            url:"${pageContext.request.contextPath}/cargo/addCargo",
            onSubmit:function () {
                return $(this).form('validate');
            },
            success:function () {
                $("#addCargoDialog").dialog("close");
                $.messager.show({
                    title:"提醒",
                    msg:"添加成功"
                });
                $("#cargoDatagrid").edatagrid("reload");
            }
        });
    })
</script>
    <form id="cargoForm" enctype="multipart/form-data" method="post">
        <table align="center">
            <tr><td>货物名称：</td><td><input type="text" class="easyui-validatebox" required="true" name="cargoName"></td></tr>
            <tr><td>货物进价：</td><td><input type="text" class="easyui-validatebox" required="true" name="cargoPprice" onKeyUp="this.value=this.value.replace(/[^\d\.]/g,'')" onBlur="checknum(this)" ></td></tr>
            <tr><td>货物售价：</td><td><input type="text" class="easyui-validatebox" required="true" name="cargoSprice" onKeyUp="this.value=this.value.replace(/[^\d\.]/g,'')" onBlur="checknum(this)" ></td></tr>
            <tr><td>货物图片：</td><td><input type="file" class="easyui-validatebox" required="true" name="file"/></td></tr>
            <tr><td>描述信息：</td><td><textarea class="easyui-validatebox" required="true" name="cargoDes" cols="23" rows="5" placeholder="输入货物的描述信息"></textarea></td></tr>
        </table>
        <p align="center">
        <a id="addManufacturerBtn"></a>
        </p>
    </form>