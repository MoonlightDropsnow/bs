<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<div id="manufacturerMap" style="width: 100%;height:100%;"></div>
<script type="text/javascript">
    var manufacturerMapChart = echarts.init(document.getElementById('manufacturerMap'));
    option = {
        title: {
            text: '厂家位置分布图',
            subtext: '地区分布',
            left: 'center'
        },
        tooltip: {
            trigger: 'item'
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['厂家数量']
        },
        visualMap: {
            min: 0,
            max: 20,
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
                name: '厂家数量',
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
    manufacturerMapChart.setOption(option);
    $.get(
        "${pageContext.request.contextPath}/manufacturer/allManufacturersMsg",
        function (data) {
            manufacturerMapChart.setOption({
                series: [{
                    data: data
                }]
            });
        },
        "json"
    );
</script>
