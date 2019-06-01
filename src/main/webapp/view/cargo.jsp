<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<script type="text/javascript">
    $(function () {
        var toolbar = [{
            iconCls: 'icon-add',
            text: "添加",
            handler: function () {
                $("#addCargoDialog").dialog("open");
            }
        }, '-', {
            text: "修改",
            iconCls: 'icon-edit',
            handler: function () {
                //获取选中行
                var row = $("#cargoDatagrid").edatagrid("getSelected");
                if (row != null) {
                    //编辑指定行
                    var index = $("#cargoDatagrid").edatagrid("getRowIndex", row);
                    $("#cargoDatagrid").edatagrid("editRow", index);
                } else {
                    alert("请先选中行")
                }
            }
        }, '-', {
            text: "删除",
            iconCls: 'icon-remove',
            handler: function () {
                ///获取选中行
                var row = $("#cargoDatagrid").edatagrid("getSelected");
                if (row != null) {
                    if (confirm("确定删除？")) {
                        $.get(
                            "${pageContext.request.contextPath}/cargo/removeCargo",
                            {id: row.cargoId},
                            function () {
                                $("#cargoDatagrid").edatagrid("reload");
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
                $("#cargoDatagrid").edatagrid("saveRow");
                $("#cargoDatagrid").edatagrid("reload");
            }
        }, '-', {
            text: "导出数据",
            iconCls: 'icon-redo',
            handler: function () {
                window.location.href = "${pageContext.request.contextPath}/cargo/exportCargo";
            }
        }
        ]
        $("#cargoDatagrid").edatagrid({
            title: "货物",
            fitColumns: true,
            url: "${pageContext.request.contextPath}/cargo/allCargosThisPage",
            columns: [[
                {field: 'cargoId', title: '货物编号', width: '100'},
                {field: 'cargoName', title: '货物名称', width: '100'},
                {field: 'cargoPprice', title: '货物进价', width: '200'},
                {
                    field: 'cargoSprice', title: '货物售价', width: '100', editor: {
                        type: "text",
                        options: {required: true}
                    }
                },
                {field: 'cargoNumber', title: '货物数量（件）', width: '100'},
                {
                    field: 'cargoStatus', title: '货物状态', width: '100', editor: {
                        type: "text",
                        options: {required: true}
                    }, formatter: function (value, rows, index) {
                        return value == 1 ? "货物充足" : "货物不足";
                    }
                },
            ]],
            toolbar: toolbar,
            loadMsg: "正在努力加载中，请稍候...",
            pagination: true,
            pageSize: 5,
            pageList: [5, 10, 15],
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
            }
        });
        //添加
        $("#addCargoDialog").dialog({
            title: '添加货物',
            width: 400,
            height: 260,
            closed: true,
            cache: false,
            href: '${pageContext.request.contextPath}/view/addCargo.jsp',
            modal: true
        });

    })

    function checknum(obj) {
        if (!/^\d*(\.\d{1,2})?$/.test(obj.value)) alert("请输入正确的价钱（两位小数点）!");
    }
</script>


<div>
    <table id="cargoDatagrid">

    </table>
</div>
<div id="addCargoDialog" align="center">
</div>
