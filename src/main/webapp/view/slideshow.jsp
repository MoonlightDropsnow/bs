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
                            "${pageContext.request.contextPath}/cargo/removeCargo",
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
            title: "货物",
            fitColumns: true,
            url: "${pageContext.request.contextPath}/cargo/allCargosThisPage",
            columns: [[
                {field: 'cargoId', title: '货物编号', width: '100'},
                {field: 'cargoName', title: '货物名称', width: '100'},
                {field: 'cargoImgpath', title: '货物图片', width: '200'},
                {field: 'cargoPprice', title: '货物进价', width: '200'},
                {field: 'cargoSprice', title: '货物售价', width: '100'},
                {field: 'cargoNumber', title: '货物数量', width: '100'},
                {
                    field: 'cargoStatus', title: '货物状态', width: '100', editor: {
                        type: "text",
                        options: {required: true}
                    }, formatter: function (value, rows, index) {
                        return value == 1 ? "正在出售" : "不在出售";
                    }
                },
            ]],
            toolbar: toolbar,
            loadMsg: "正在努力加载中，请稍候...",
            pagination: true,
            pageSize: 3,
            pageList: [3, 6, 9],
            autoSave: true,
            method: "get",
            updateUrl: "${pageContext.request.contextPath}/cargo/editCargo",
            view: detailview,
            detailFormatter: function (rowIndex, rowData) {
                return '<table><tr>' +
                    '<td rowspan="2" style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.cargoImgpath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>描述：' + rowData.cargoDes + '</p>' +
                    '<p>日期：' + rowData.cargoDate + '</p>' +
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
            title: '添加货物',
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
