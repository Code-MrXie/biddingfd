<%--
  Created by IntelliJ IDEA.
  User: m1761
  Date: 2020/11/25
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>竞价厅</title>
    <script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
    <!-- 引入组件库 -->
    <script src="${pageContext.request.contextPath }/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>

</head>
<body>
<%@include file="jar.jsp"%>
<el-input v-model="input" placeholder="请输入内容"></el-input>
项目名称
<el-input v-model="input" placeholder="请输入内容"></el-input>
资源类型
<el-select v-model="value" placeholder="请选择">
    <el-option
            v-for="item in options"
            :key="item.value"
            :label="item.label"
            :value="item.value">
    </el-option>
</el-select>
</body>
</html>
<script>
        new Vue({
            /*变量*/
            data() {
                return {
                    input: '',
                    options: [{
                        value: '选项1',
                        label: '黄金糕'
                    }, {
                        value: '选项2',
                        label: '双皮奶'
                    }, {
                        value: '选项3',
                        label: '蚵仔煎'
                    }, {
                        value: '选项4',
                        label: '龙须面'
                    }, {
                        value: '选项5',
                        label: '北京烤鸭'
                    }],
                    value: ''
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
