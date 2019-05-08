<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<div id="userMap" style="width: 100%;height:100%;"></div>
<script type="text/javascript">
    var userMapChart = echarts.init(document.getElementById('userMap'));
    option = {
        title: {
            text: '用户数量分布图',
            subtext: '地区分布',
            left: 'center'
        },
        tooltip: {
            trigger: 'item'
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['用户数量']
        },
        visualMap: {
            min: 0,
            max: 2500,
            left: 'left',
            top: 'bottom',
            text: ['高', '低'],           // 文本，默认为数值文本
            calculable: true
        },
        toolbox: {
            show: true,
            orient: 'vertical',
            left: 'right',
            top: 'center',
            feature: {
                mark: {show: true},
                dataView: {show: true, readOnly: false},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        series: [
            {
                name: '用户数量',
                type: 'map',
                mapType: 'china',
                roam: false,
                label: {
                    normal: {
                        show: false
                    },
                    emphasis: {
                        show: true
                    }
                }
            }

        ]
    };
    userMapChart.setOption(option);
    $.get(
        "${pageContext.request.contextPath}/user/allUsersMsg",
        function (data) {
            userMapChart.setOption({
                series: [{
                    data: data
                }]
            });
        },
        "json"
    );
</script>
