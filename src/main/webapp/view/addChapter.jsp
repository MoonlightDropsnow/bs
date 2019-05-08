<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
    $(function () {
        $("input").validatebox({
            required:true
        });
        $("#addChapterBtn").linkbutton({
            text: "添加此章节",
            iconCls: "icon-add",
            onClick: function () {
                $("#addChapterForm").form("submit");
            }
        });
        $("#addChapterForm").form({
            url: "${pageContext.request.contextPath }/chapter/addChapter?albumId=" +${param.albumId},
            onSubmit: function () {
                return  $("#addChapterForm").form("validate");
            },
            success: function () {
                $("#addChapterDialog").dialog("close");
                $.messager.show({
                    title: "我是提示信息",
                    msg: "章节添加成功"
                });
                $('#albumDatagrid').treegrid("reload");
            }
        });
    })
</script>
<form id="addChapterForm" method="post" enctype="multipart/form-data">
    <br/>
    <table align="center" align="left" border="0">
        <tr>
            <td width="60">音频标题：</td>
            <td><input name="title"/></td>
        </tr>
        <tr>
            <td width="60">音频文件：</td>
            <td><input name="file" type="file"/></td>
        </tr>
    </table>
    <br/>
    <a id="addChapterBtn"/>
</form>
