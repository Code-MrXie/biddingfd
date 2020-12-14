<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/4
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>交易大厅</title>
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
    .duodiv{
        border: 1px solid black;
        width: 300px;
        height: 400px;
        font-size: 14px;
        box-sizing: border-box;
        white-space: normal;
        word-wrap: break-word;
        word-break: break-all;
        overflow: hidden;
        display: inline-block;
    }
    .onediv{
        border: 1px solid black;
        width: 139px;
        height: 50px;
        font-size: 14px;
        box-sizing: border-box;
        white-space: normal;
        word-wrap: break-word;
        word-break: break-all;
        overflow: hidden;
        display: inline-block;
        text-align: center;
    }
</style>
<body>
<div id="fuDiv">
    <div v-for="test1 in PbItemInfo" id="wai">
        {{test1.itemName}}
        <hr>
            <div class="duodiv" v-for="test2 in test1.pbObjectInfoList" v-if="test2.objectId!=null" @click="clicktest(test2.objectId)">
                <img :src="test2.pbFileImgInfo.fileMd5" style="width: 300px;height: 200px">
                <h5>{{test2.objectName}}</h5>
                <h5>当前价 &nbsp <span style="color: red">￥11</span></h5>
                <h5>评估价 &nbsp {{test2.evaluatePrice}}</h5>
                <h5>预计 &nbsp {{test2.pauseTime}} &nbsp 结束</h5>
                <div style="border: 1px solid black;">
                    <div class="onediv">
                        ????次围观
                    </div>
                    <div class="onediv">
                        {{test2.pbApplyInfo2.length}}人报名
                    </div>
                </div>
            </div>
        <br><br>
    </div>
</div>
</body>
<script>
    new Vue({
        el: '#fuDiv',
        /*变量*/
        data(){
            return{
                PbItemInfo:[]
            }
        },
        //页面加载之前调用
        created(){
            this.showAllPbItemInfo();
        },
        //页面加载成功时完成
        mounted: function(){
        },
        /*方法函数  事件等*/
        methods: {
            showAllPbItemInfo:function () {
                axios.post('/pb-item-info/showAllPbItemInfo').then(res=>{
                    this.PbItemInfo = (res.data)
                    console.log(res.data)
                })
            },
            clicktest:function (objectId) {
                window.location.href=("/jsps/ListingLink.jsp?objectId="+objectId)
            }
        }
    })
</script>
</html>
