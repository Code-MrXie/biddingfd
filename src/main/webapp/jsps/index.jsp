
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Vue测试</title>
</head>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<!-- 引入样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
<!-- 引入组件库 -->
<script src="${pageContext.request.contextPath }/static/element/index.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>

<body>
<div id="abc">
{{name}}

    ​
</div>

</body>


<script>
    new Vue({
        el: '#abc',
        /*变量*/
        data () {
            return {
                name:'hello word',

            }
        },
        //页面加载成功时完成
        mounted: function(){


        },
        /*方法函数  事件等*/
        methods: {


        }
    });

</script>

</html>
