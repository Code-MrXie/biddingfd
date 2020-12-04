<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/2
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>缴纳保证金</title>
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
    <template>
        <img class="img_head" src="/static/images/p1.png"/>-------------------------
        <img class="img_head" src="/static/images/p2.png"/>-------------------------
        <img class="img_head" src="/static/images/pm3.png"/>-------------------------
        <img class="img_head" src="/static/images/p4.png"/>
        <el-main v-model="selected" >
            <div class="block" style="height:800px;width: 850px">
                <h3 style="text-align: center">标的编号:{{pbObjecetInfo.objectCode}}</h3>
                <h3 style="text-align: center">标的名称:{{pbObjecetInfo.objectName}}</h3>
                <h3 style="text-align: center">保证金金额:{{pbObjecetInfo.cmcostAmount}}</h3>
                <h3 style="text-align: center">保证金缴纳截止时间:{{pbObjecetInfo.depositPayEndTime}}</h3>
                <h3 style="text-align: center">到账时间:{{pbObjecetInfo.objectCode}}</h3>
                <h3 style="text-align: center">缴纳状态:{{pbObjecetInfo.objectCode}}</h3>
                <h3 style="text-align: center">备注:{{pbObjecetInfo.remark}}</h3>
                <hr>
                <h3 style="text-align: center; color: red">
                    温馨提示：
                    <br>
                    1.请一次性缴纳足额保证金，否则无法进行竞价直到一次性缴纳足额保证金<br>
                    2.银行汇款可能出现时间的延迟，请您尽可能提前完成支付，确保您的正常<br>
                    竞价不受影响。如因保证金未在规定时间内到账而导致本系统无法确认您<br>
                    的竞买资格，所产生的责任后果由竞买人自行承担。
                </h3>
                <input style="background-color: #3a8ee6" type="button" value="缴纳保证金" @click="jiaona()">
                <input style="background-color: #3a8ee6" type="button" value="刷新" @click="shuaxin()">
            </div>
        </el-main>
        <input type="button" value="上一步" @click="shangyibu()">
        <input type="button" value="下一步" @click="xiayibu()">
    </template>
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
                window.location.href=("/jsps/index_jingjia.jsp?objectId="+this.objectId)
            },
            shuaxin:function () {
                window.location.reload()
            },
            jiaona:function () {
                window.location.href=("/jsps/index_jiaonabzj.jsp?objectId="+this.objectId)
            },
            xiayibu:function () {
                window.location.href=("/jsps/index_dating.jsp?objectId="+this.objectId)
            }
        }
    })
</script>
</html>
