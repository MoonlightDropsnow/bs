<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/themes/IconExtension.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/datagrid-detailview.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
    <!-- Echarts -->
    <script src="../js/echarts.min.js"></script>
    <script src="../js/china.js"></script>
    <script type="text/javascript" src="https://cdn-hangzhou.goeasy.io/goeasy.js"></script>
</head>
<script type="text/javascript">
    var goEasy = new GoEasy({
        appkey:"BC-0e7e8c1d21b94a9b83a985ee2d60e8e0"
    });
    <!--菜单处理-->
    $(function () {
        //退出
        $.ajax({
            url: "${pageContext.request.contextPath}/menu/allMenus",
            type: "post",
            dataType: "json",
            success: function (data) {
                $.each(data, function (i, val) {
                    $("#menu").accordion("add", {
                        title: val.text,
                        iconCls: val.iconCls,
                        selected: false,
                        content: "<div><ul id='" + val.id + "'></ul></div>"
                    });
                    $.ajax({
                        url: "${pageContext.request.contextPath}/menu/allMenus",
                        type: "post",
                        data: "parent_id=" + val.id,
                        dataType: "json",
                        success: function (data) {
                            $("#" + val.id).tree({
                                data: data,
                                lines:true,
                                onClick:function (node) {
                                    var bn = $("#"+val.id).tree("isLeaf",node.target);
                                    if(bn){
                                        if($("#tabs").tabs("exists",node.text)){
                                            $("#tabs").tabs("select",node.text);
                                        }else{
                                            $("#tabs").tabs("add",{
                                                title:node.text,
                                                closable:true,
                                                href:"${pageContext.request.contextPath}/"+node.url
                                            });
                                        }
                                    }
                                }
                            });
                        }
                    });
                });

            }
        });
    })
</script>
<body class="easyui-layout">
<div data-options="region:'north',split:true" style="height:60px;background-color: #7EC0EE">
    <div style="font-size: 24px;color: #FFFFFF;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px">
        货物管理系统
    </div>
    <div style="font-size: 16px;color: #FFFFFF;font-family: 楷体;width: 300px;float:right;padding-top:15px">
        欢迎您:<!-- $ {sessionScope.admin.name}-->
        &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back',onClick:function(){location.href='${pageContext.request.contextPath}/admin/quit';}">退出系统</a>
        &nbsp;&nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-help'">帮助</a>
    </div>
</div>
<div data-options="region:'south',split:true" style="height: 40px;background: #7EC0EE">
    <div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体">&copy;2351162147@qq.com</div>
</div>

<div data-options="region:'west',title:'功能菜单',split:true" style="width:200px;">
    <div id="menu" class="easyui-accordion" data-options="fit:true">

    </div>
</div>
<div data-options="region:'center'">
    <div id="tabs" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
        <div title="欢迎" data-options="iconCls:'icon-neighbourhood',"
             style="background-image:url(${pageContext.request.contextPath}/main/image/main.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
    </div>

</div>
</body>
</html>