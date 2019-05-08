<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
    $(function () {
        $("#albumDetailsForm").form("load", "${pageContext.request.contextPath }/album/oneAlbum?id=${param.id}");
        $("input").validatebox({
            editable:false,
            required:true,
        });
        $.get(
            "${pageContext.request.contextPath }/album/oneAlbum",
            {"id":${param.id}},
            function (result) {
                $("#coverImage").prop("src","${pageContext.request.contextPath}/"+result.coverImg);
            },
            "json"
        );
    })
</script>
<form id="albumDetailsForm">
    <table align="center" align="left" border="0">
        <tr><td width="50">编号：</td><td><input name="id"/></td></tr>
        <tr><td width="50">标题：</td><td><input name="title"/></td></tr>
        <tr><td width="50">作者：</td><td><input name="author"/></td></tr>
        <tr><td width="50">播音：</td><td><input name="announcer"/></td></tr>
        <tr><td width="50">评分：</td><td><input name="score"/></td></tr>
        <tr><td width="50">集数：</td><td><input name="count"/></td></tr>
        <tr><td width="50">时间：</td><td><input name="pubDate"/></td></tr>
        <tr><td width="50">简介：</td><td><input name="brief"/></td></tr>
        <tr><td colspan="2" align="center">封面</td></tr>
        <tr><td colspan="2"><img id="coverImage" width="240" height="280"/></td></tr>
    </table>
</form>
