<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>登录</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script type="text/javascript">
        /*$(function () {
            //点击更换验证码：
            $("#captchaImage").live("click", function () {
                $("#captchaImage").prop("src", "${pageContext.request.contextPath}/admin/validateCode?time=" + new Date());
            });
        });*/
        $(function () {
            $("#loginForm").form({
                url: "${pageContext.request.contextPath}/admin/login",
                onSubmit: function () {
                    return $(this).form('validate');
                },
                success: function (data) {
                    if (data != '"ok"') {
                        alert(data);
                    } else {
                        window.location.href = "${pageContext.request.contextPath}/main/main.jsp";

                    }
                }
            });
        });
    </script>
</head>
<body>

<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">
            </div>
            <form id="loginForm" method="post">
                <div class="panel loginbox">
                    <div class="text-center margin-big padding-big-top">
                        <h1>后台管理中心</h1>
                    </div>
                    <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="text" class="easyui-validatebox input input-big" required="true"
                                       name="name" id="username"
                                       placeholder="登录账号"/>
                                <span class="icon icon-user margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="password" class="easyui-validatebox input input-big" required="true"
                                       name="password" id="password"
                                       placeholder="登录密码"/>
                                <span class="icon icon-key margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field">
                                <input type="text" class="easyui-validatebox input input-big" required="true"
                                       id="enCode" name="enCode" maxlength="4"
                                       placeholder="填写右侧的验证码"/>
                                <img src="${pageContext.request.contextPath}/admin/validateCode" alt="" width="100"
                                     height="32" class="passcode" style="height:43px;cursor:pointer;"
                                     onClick="this.src=this.src+'?'">
                            </div>
                        </div>
                    </div>
                    <div style="padding:30px;">
                        <input type="submit" id="button" class="button button-block bg-main text-big input-big"
                               value="登录">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>