<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/8
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>外网（报名）</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- 引入样式 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
    <script src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
    <!-- 引入组件库 -->
    <script src="${pageContext.request.contextPath }/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>
</head>
<style>
    .block{
        border: 1px solid red;
    }
</style>
<body>
<div id="fuDiv">
    <div class="block" style="width: 900px">
        <div v-for="test in PbObjectInfo">
            <a @click="gogogo(test.objectId)">{{test.objectName}}<span style="color: red">(点击跳转)</span></a>
        </div>
    </div>
</div>
</body>
<script>
    new Vue({
        el: '#fuDiv',
        /*变量*/
        data(){
            return{
                PbObjectInfo:[]
            }
        },
        //页面加载之前调用
        created(){
            this.showAllPbItemInfo()
        },
        /*方法函数  事件等*/
        methods: {
            showAllPbItemInfo:function () {
                axios.post('/pb-object-info/showAllPbObjectInfo').then(res=>{
                    this.PbObjectInfo = (res.data)
                })
            },
            gogogo:function (objectId) {
                window.location.href=("/jsps/ListingLink.jsp?objectId="+objectId)
            }
        }
    })
</script>
</html>
