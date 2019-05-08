<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<div id="userBar" style="width: 100%;height:100%;"></div>
<script type="text/javascript">
    $(function () {


        //柱状图
        // 基于准备好的dom，初始化echarts实例
        var userBarChart = echarts.init(document.getElementById('userBar'));
        var barOption = {
            title: {
                text: '用户注册数量',
                subtext: '时间分段'
            },
            tooltip: {},
            legend: {
                type: "scroll",
                data: ['注册人数']
            },
            xAxis: {
                data: []
            },
            yAxis: {}
        }
        userBarChart.setOption(barOption);
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/user/allUserNumbers",
            dataType: "json",
            success: function (result) {
                //console.log(result);
                var x = [];
                var y = [];
                for (var i in result) {
                    y.push(i);
                    x.push(result[i]);
                }
                userBarChart.setOption({
                    series: [{
                        // 根据名字对应到相应的系列
                        name: '注册人数',
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
                userBarChart.setOption({
                    series: [{
                        // 根据名字对应到相应的系列
                        name: '注册人数',
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
