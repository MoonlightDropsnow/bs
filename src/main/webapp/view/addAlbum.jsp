<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
    $(function () {
        $("#addAlbumBtn").linkbutton({
            text:"添加此专辑",
            iconCls:"icon-add",
            onClick:function () {
                $("#addAlbumForm").form("submit");
            }
        });
        $("#addAlbumForm").form({
            url:"${pageContext.request.contextPath }/album/addAlbum",
            onSubmit:function () {
                return true;
            },
            success:function () {
                $("#addAlbumDialog").dialog("close");
                $.messager.show({
                   title:"我是提示信息",
                   msg:"专辑添加成功"
                });
                $('#albumDatagrid').treegrid("reload");
            }
        });
    })
</script>
<form id="addAlbumForm" method="post" enctype="multipart/form-data">
    <br/>
    <table align="center" align="left" border="0">
        <tr><td width="50">标题：</td><td><input name="title"/></td></tr>
        <tr><td width="50">作者：</td><td><input name="author"/></td></tr>
        <tr><td width="50">播音：</td><td><input name="announcer"/></td></tr>
        <tr><td width="50">简介：</td><td><input name="brief"/></td></tr>
        <tr><td width="50">封面：</td><td><input name="file" type="file"/></td></tr>
    </table>
    <br/>
    <a id="addAlbumBtn" />
</form>
