<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/2
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>竞价大厅</title>
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
    .img_head{
        width: 50px;
        height: 50px;
        border-radius: 45px;
        border: 1px solid #9d9d9d;
    }
    .block{
        border: 1px solid black;
    }
</style>
<body>
<div id="fuDiv">
    <img class="img_head" src="/static/images/p1.png"/>-------------------------
    <img class="img_head" src="/static/images/p2.png"/>-------------------------
    <img class="img_head" src="/static/images/p3.png"/>-------------------------
    <img class="img_head" src="/static/images/pm4.png"/>
    <div class="block" style="width: 900px">
        <img style="width: 300px;height: 300px" src="/static/images/1.jpg">
    </div>
    <input type="button" value="上一步" @click="shangyibu()">
</div>
</body>
<script>
    new Vue({
        el: '#fuDiv',
        /*变量*/
        data(){
            return{
                pbObjecetInfo:[],
                objectId:${param.objectId}
            }
        },
        //页面加载之前调用
        created(){
            this.showThis(this.objectId)
        },
        //页面加载成功时完成
        mounted: function(){
        },
        /*方法函数  事件等*/
        methods: {
            showThis:function(id){
                var pbItemInfo = new URLSearchParams();
                pbItemInfo.append('objectId',id);
                axios.post('/pb-object-info/ShowObject',pbItemInfo).then(res=>{
                    this.pbObjecetInfo = (res.data)
            })
            },
            shangyibu:function () {
                window.location.href=("/jsps/index_jiaona.jsp?objectId="+this.objectId)
            }
        }
    })
</script>
</html>
