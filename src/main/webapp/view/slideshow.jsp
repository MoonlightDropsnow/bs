<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<script type="text/javascript">
    $(function () {
        var toolbar = [{
            iconCls: 'icon-add',
            text: "添加",
            handler: function () {
                $("#addBannerDialog").dialog("open");
            }
        }, '-', {
            text: "修改",
            iconCls: 'icon-edit',
            handler: function () {
                //获取选中行
                var row = $("#slideshowDatagrid").edatagrid("getSelected");
                if (row != null) {
                    //编辑指定行
                    var index = $("#slideshowDatagrid").edatagrid("getRowIndex", row);
                    $("#slideshowDatagrid").edatagrid("editRow", index);
                } else {
                    alert("请先选中行")
                }
            }
        }, '-', {
            text: "删除",
            iconCls: 'icon-remove',
            handler: function () {
               /* //获取选中行
                var row = $("#slideshowDatagrid").edatagrid("getSelected");
                //编辑指定行
                var index = $("#slideshowDatagrid").edatagrid("getRowIndex", row);
                $("#slideshowDatagrid").edatagrid("destroyRow", index);
                $("#slideshowDatagrid").edatagrid("reload");
*/
               ///获取选中行
                var row = $("#slideshowDatagrid").edatagrid("getSelected");
                if (row != null) {
                    if (confirm("确定删除？")) {
                        $.get(
                            "${pageContext.request.contextPath}/banner/removeBanner",
                            {id: row.id},
                            function () {
                                $("#slideshowDatagrid").edatagrid("reload");
                                $.messager.show({
                                    title: "提示信息",
                                    msg: "删除成功"
                                });
                            }
                        );
                    }
                } else {
                    alert("请先选中行")
                }
            }
        }, '-', {
            text: "保存",
            iconCls: 'icon-save',
            handler: function () {
                $("#slideshowDatagrid").edatagrid("saveRow");
                $("#slideshowDatagrid").edatagrid("reload");
            }
        }]
        $("#slideshowDatagrid").edatagrid({
            title: "轮播图",
            fitColumns: true,
            url: "${pageContext.request.contextPath}/banner/allBannersThisPage",
            columns: [[
                {field: 'id', title: '图片编号', width: '100'},
                {field: 'title', title: '图片标题', width: '100'},
                {field: 'imgPath', title: '图片路径', width: '200'},
                {
                    field: 'status', title: '图片状态', width: '100', editor: {
                        type: "text",
                        options: {required: true}
                    }, formatter: function (value, rows, index) {
                        return value == 1 ? "正在使用" : "不在使用";
                    }
                },
                {field: 'pubDate', title: '发布日期', width: '200'},
                {field: 'description', title: '描述信息', width: '100'}
            ]],
            toolbar: toolbar,
            loadMsg: "正在努力加载中，请稍候...",
            pagination: true,
            pageSize: 3,
            pageList: [3, 6, 9],
            autoSave: true,
            method: "get",
            updateUrl: "${pageContext.request.contextPath}/banner/editBanner",
            view: detailview,
            detailFormatter: function (rowIndex, rowData) {
                return '<table><tr>' +
                    '<td rowspan="2" style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.imgPath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>描述：' + rowData.description + '</p>' +
                    '<p>日期：' + rowData.pubDate + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }/*,
            destroyUrl:"/banner/removeBanner",
            destroyMsg:{
                norecord:{    // 在没有记录选择的时候执行
                    title:'你好',
                    msg:'请选中要删除的行'
                },
                confirm:{       // 在选择一行的时候执行		title:'Confirm',
                    title:"请确认",
                    msg:'你确定要删除吗？'
                }
            }*/
        });
        //添加
        $("#addBannerDialog").dialog({
            title: '添加轮播图',
            width: 400,
            height: 260,
            closed: true,
            cache: false,
            href: '${pageContext.request.contextPath}/view/addBanner.jsp',
            modal: true
        });

    })
</script>


<div>
    <table id="slideshowDatagrid">

    </table>
</div>
<div id="addBannerDialog" align="center">
</div>
