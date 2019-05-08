<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
    $(function () {
        $("#addBannerBtn").linkbutton({
            text:"添加图片",
            iconCls:"icon-add",
            onClick:function () {
                $("#bannerForm").form("submit");
            }
        });
        $("#bannerForm").form({
            url:"${pageContext.request.contextPath}/banner/addBanner",
            onSubmit:function () {
                return true;
            },
            success:function () {
                $("#addBannerDialog").dialog("close");
                $.messager.show({
                    title:"提醒",
                    msg:"添加成功"
                });
                $("#slideshowDatagrid").edatagrid("reload");
            }
        });
    })
</script>
    <form id="bannerForm" enctype="multipart/form-data" method="post">
        <table align="center">
            <tr><td>图片标题：</td><td><input type="text" name="title"></td></tr>
            <tr><td>选择图片：</td><td><input type="file" name="file"/></td></tr>
            <tr><td>描述信息：</td><td><textarea name="description" cols="23" rows="5" placeholder="输入图片的描述信息"></textarea></td></tr>
        </table>
        <p align="center">
        <a id="addBannerBtn"></a>
        </p>
    </form>