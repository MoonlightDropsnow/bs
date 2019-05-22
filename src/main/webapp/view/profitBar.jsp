<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<div id="profitBar" style="width: 100%;height:100%;"></div>
<script type="text/javascript">
    $(function () {
        //柱状图
        // 基于准备好的dom，初始化echarts实例
        var profitBarChart = echarts.init(document.getElementById('profitBar'));
        var barOption = {
            title: {
                text: '货物数量',
                subtext: '数量分段'
            },
            tooltip: {},
            legend: {
                type: "scroll",
                data: ['货物数量']
            },
            xAxis: {
                data: []
            },
            yAxis: {}
        }
        profitBarChart.setOption(barOption);
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/cargo/allCargoNumbers",
            dataType: "json",
            success: function (result) {
                //console.log(result);
                var x = [];
                var y = [];
                for (var i in result) {
                    y.push(i);
                    x.push(result[i]);
                }
                profitBarChart.setOption({
                    series: [{
                        // 根据名字对应到相应的系列
                        name: '货物数量',
                        data: x,
                        type: "bar"
                    }],
                    xAxis: {
                        data: y
                    }
                })
            }
        })
        goEasy.subscribe({
            channel: 'goeasy',
            onMessage: function (result) {
                var x = [];
                var y = [];
                var r = eval("(" + result.content + ")");
                for (var i in r) {
                    y.push(i);
                    x.push(r[i]);
                }
                profitBar.setOption({
                    series: [{
                        // 根据名字对应到相应的系列
                        name: '货物数量',
                        data: x,
                        type: "bar"
                    }],
                    xAxis: {
                        data: y
                    }
                })
            }
        });
    });
</script>
