<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/29
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>标的信息</title>
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
<style scoped>
    .grid-content {
        min-height: 50px;
        min-width: 100px;
        border: 1px solid black;
    }
    .block{
        padding: 30px 24px;
        border: 1px solid red;
    }
    .mingcheng{
        background-color: #9d9d9d;
    }
</style>
<body>
<div id="fuDiv">
    <el-main v-model="selected" >
        <el-input style="width: 100px" value="标的信息" readonly=""></el-input>
        <div class="block" style="height:300px;width: 1000px">
            <div style="height:100%;width:100%">
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid-content " >标的编号</div></el-col>
                    <el-col :span="6"><div class="grid-content ">{{pbObjecetInfo.objectCode}}</div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid-content ">标的名称</div></el-col>
                    <el-col :span="4"><div class="grid-content ">{{pbObjecetInfo.objectName}}</div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid-content ">竞价方式</div></el-col>
                    <el-col :span="4"><div class="grid-content ">{{pbObjecetInfo.trad}}</div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid-content " >标的位置</div></el-col>
                    <el-col :span="14"><div class="grid-content ">{{pbObjecetInfo.objectAddress}}</div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid-content ">延时竞价</div></el-col>
                    <el-col :span="4"><div class="grid-content ">{{pbObjecetInfo.bidDelayTime}}</div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid-content " >起始价</div></el-col>
                    <el-col :span="6"><div class="grid-content ">{{pbObjecetInfo.startPrice}}万元</div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid-content ">评估价</div></el-col>
                    <el-col :span="4"><div class="grid-content ">{{pbObjecetInfo.evaluatePrice}}万元</div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid-content ">加价幅度</div></el-col>
                    <el-col :span="4"><div class="grid-content ">{{pbObjecetInfo.quoteIncrement}}万元</div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid-content " >保证金</div></el-col>
                    <el-col :span="6"><div class="grid-content ">{{pbObjecetInfo.cmcostAmount}}万元</div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid-content ">交易服务费</div></el-col>
                    <el-col :span="4"><div class="grid-content ">{{pbObjecetInfo.charge}}万元</div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid-content ">保留价</div></el-col>
                    <el-col :span="4"><div class="grid-content ">{{pbObjecetInfo.reservePrice}}万元</div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid-content " >保证金缴纳截止时间</div></el-col>
                    <el-col :span="6"><div class="grid-content">{{pbObjecetInfo.depositPayEndTime}}</div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid-content ">竞价开始时间</div></el-col>
                    <el-col :span="4"><div class="grid-content">{{pbObjecetInfo.bidStartTime}}</div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid-content ">竞价结束时间</div></el-col>
                    <el-col :span="4"><div class="grid-content">{{pbObjecetInfo.bidEndTime}}</div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid-content " >标的概况</div></el-col>
                    <el-col :span="22"><div class="grid-content">{{pbObjecetInfo.remark}}</div></el-col>
                </el-row>
            </div>
        </div>
        <el-input style="width: 100px" value="标的信息" readonly=""></el-input>
        <div class="block" style="height:300px;width: 1000px">

        </div>
    </el-main>
</div>
</body>
<script>
    new Vue({
        el: '#fuDiv',
        /*变量*/
        data(){
            return{
                pbObjecetInfo:[]
            }
        },
        //页面加载之前调用
        created(){
            this.ShowObject(1)
        },
        //页面加载成功时完成
        mounted: function(){
        },
        /*方法函数  事件等*/
        methods: {
            ShowObject:function(id){
                var pbItemInfo = new URLSearchParams();
                pbItemInfo.append('objectId',id);
                axios.post('/pb-object-info/ShowObject',pbItemInfo).then(res=>{
                    this.pbObjecetInfo = (res.data)
                })
            },
        }
    })
</script>
</html>
