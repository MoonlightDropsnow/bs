<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<script type="text/javascript">
    $(function () {


        $("#importUserFile").filebox({
            required: true
        });
        $("#importUser").form({
            url: "${pageContext.request.contextPath}/user/importUser",
            submit: function () {
                return $("#importUser").form("validate");
            },
            success: function () {
                alert("上传成功");
            }
        });
        $("#importUserBtn").linkbutton({
            text: "提交",
            iconCls: "icon-add",
            onClick: function () {
                $("#importUser").form("submit");
            }
        });
    });

</script>

<form id="importUser" method="post" enctype="multipart/form-data">
    <table align="center">
        <tr>
            <td>
                <input id="importUserFile" name="file"/>
            </td>
        </tr>
        <tr>
            <td>
                <a id="importUserBtn">hehe</a>
            </td>
        </tr>
    </table>
</form>
