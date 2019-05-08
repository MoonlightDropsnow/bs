<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<script type="text/javascript">
    $(function () {
        var toolbar = [{
            iconCls: 'icon-tip',
            text: "专辑详情",
            handler: function () {
                //https://www.cnblogs.com/nuccch/p/7151228.html
                //获取选中行
                var row = $("#albumDatagrid").edatagrid("getSelected");
                if (row != null) {
                    //获得指定行
                    var id;
                    if (!row.albumId) {
                        id = row.id;
                    } else {
                        id = row.albumId;
                    }
                    //详情
                    $("#albumBriefDialog").dialog({
                        title: '专辑详情',
                        width: 400,
                        height: 400,
                        closed: true,
                        cache: false,
                        href: '${pageContext.request.contextPath}/view/albumDetails.jsp?id=' + id,
                        modal: true
                    });
                    //打开
                    $("#albumBriefDialog").dialog("open");

                } else {
                    alert("请先选中行")
                }
            }
        }, '-', {
            text: "添加专辑",
            iconCls: 'icon-add',
            handler: function () {
                //打开
                $("#addAlbumDialog").dialog("open");
            }
        }, '-', {
            text: "添加章节",
            iconCls: 'icon-add',
            handler: function () {
                var row = $("#albumDatagrid").edatagrid("getSelected");
                if (row != null) {
                    var albumId;
                    if (!row.albumId) {
                        albumId = row.id;
                        //添加章节
                        $("#addChapterDialog").dialog({
                            title: '添加章节',
                            width: 400,
                            height: 400,
                            closed: true,
                            cache: false,
                            href: '${pageContext.request.contextPath}/view/addChapter.jsp?albumId=' + albumId,
                            modal: true
                        });
                        //打开
                        $("#addChapterDialog").dialog("open");
                    } else {
                        albumId = row.albumId;
                        //添加章节
                        $("#addChapterDialog").dialog({
                            title: '添加章节',
                            width: 400,
                            height: 400,
                            closed: true,
                            cache: false,
                            href: '${pageContext.request.contextPath}/view/addChapter.jsp?albumId=' + albumId,
                            modal: true
                        });
                        $("#addChapterDialog").dialog("open");
                    }
                } else {
                    alert("请选中添加到的专辑");
                }
            }
        }, '-', {
            text: "下载音频",
            iconCls: 'icon-save',
            handler: function () {
                var row = $("#albumDatagrid").edatagrid("getSelected");
                if (row != null) {
                    if (!row.albumId) {
                        alert("请选择具体章节");
                    } else {
                        window.location.href = "${pageContext.request.contextPath}/chapter/downloadChapter?chapterId=" + row.id;
                    }
                } else {
                    alert("请选中要下载的章节");
                }

            }
        }, '-', {
            text: "导出专辑",
            iconCls: 'icon-redo',
            handler: function () {
                window.location.href = "${pageContext.request.contextPath}/album/exportAlbum";
            }
        }]
        $('#albumDatagrid').treegrid({
            method: "get",
            url: '${pageContext.request.contextPath}/album/allAlbumsThisPage',
            idField: 'id',
            treeField: 'title',
            columns: [[
                {field: 'title', title: '名称', width: 60},
                {
                    field: 'size', title: '大小', width: 40, formatter: function (value) {
                        if (!isNaN(value)) {
                            return value + "MB";
                        }
                    }
                },
                {
                    field: 'time', title: '时长', width: 40, formatter: function (value) {
                        if (!isNaN(value)) {
                            return value + "分钟";
                        }
                    }
                },
                {field: 'url', title: '路径', width: 80},
                {field: 'uploadDate', title: '上传时间', width: 80},
                {
                    field: 'listen', title: '播放', width: 100, formatter: function (value, rows) {
                        if (rows.url) {
                            return "<audio controls='controls' src='${pageContext.request.contextPath}/" + rows.url + "'/>";
                        }
                    }
                }
            ]],
            fitColumns: true,
            toolbar: toolbar,
            pagination: true,
            pageSize: 3,
            pageList: [3, 6, 9],
            onLoadSuccess: function () {
                $("#albumDatagrid").treegrid("collapseAll");
            },

        });
        //添加专辑
        $("#addAlbumDialog").dialog({
            title: '添加专辑',
            width: 400,
            height: 300,
            closed: true,
            cache: false,
            href: '${pageContext.request.contextPath}/view/addAlbum.jsp',
            modal: true
        });
    })
</script>


<div>
    <table id="albumDatagrid">

    </table>
</div>
<div id="albumBriefDialog" align="center">
</div>
<div id="addAlbumDialog" align="center">
</div>
<div id="addChapterDialog" align="center">
</div>
