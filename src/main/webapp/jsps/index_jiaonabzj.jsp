<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/2
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>缴纳保证金订单</title>
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
        border: 1px solid black;
    }
    .mingcheng{
        background-color: #9d9d9d;
    }
    .row-bg{
        height: 35px;
    }
</style>
<body>
<div id="fuDiv">
    <template>
        <el-main v-model="selected" >
            <div class="block" style="height:800px;width: 850px">
                <div style="height:100%;width:100%">
                    <el-row type="flex" class="row-bg">
                        <el-col :span="4"><h5 style="text-align: right;">项目名称: &nbsp |</h5></el-col>
                        <el-col :span="21"><h5 style="text-align: left">&nbsp {{pbObjecetInfo.pbItemInfo.itemName}}</h5></el-col>
                    </el-row>
                    <hr>
                    <el-row type="flex" class="row-bg">
                        <el-col :span="4"><h5 style="text-align: right;">项目编号: &nbsp |</h5></el-col>
                        <el-col :span="21"><h5 style="text-align: left">&nbsp {{pbObjecetInfo.pbItemInfo.itemCode}}</h5></el-col>
                    </el-row>
                    <hr>
                    <el-row type="flex" class="row-bg">
                        <el-col :span="4"><h5 style="text-align: right;">标的名称: &nbsp |</h5></el-col>
                        <el-col :span="21"><h5 style="text-align: left">&nbsp {{pbObjecetInfo.objectName}}</h5></el-col>
                    </el-row>
                    <hr>
                    <el-row type="flex" class="row-bg">
                        <el-col :span="4"><h5 style="text-align: right;">标的编号: &nbsp |</h5></el-col>
                        <el-col :span="21"><h5 style="text-align: left">&nbsp {{pbObjecetInfo.objectCode}}</h5></el-col>
                    </el-row>
                    <hr>
                    <el-row type="flex" class="row-bg">
                        <el-col :span="4"><h5 style="text-align: right;">收款户名: &nbsp |</h5></el-col>
                        <el-col :span="21"><h5 style="text-align: left">&nbsp {{pbObjecetInfo.pbItemInfo.accountName}}</h5></el-col><%--开户名称--%>
                    </el-row>
                    <hr>
                    <el-row type="flex" class="row-bg">
                        <el-col :span="4"><h5 style="text-align: right;">收款银行: &nbsp |</h5></el-col>
                        <el-col :span="21"><h5 style="text-align: left">&nbsp {{pbObjecetInfo.pbItemInfo.bankName}}</h5></el-col><%--开户行--%>
                    </el-row>
                    <hr>
                    <el-row type="flex" class="row-bg">
                        <el-col :span="4"><h5 style="text-align: right;">收款账号: &nbsp |</h5></el-col>
                        <el-col :span="21"><h5 style="text-align: left">&nbsp {{pbObjecetInfo.pbItemInfo.bankCode}}</h5></el-col><%--开户账号--%>
                    </el-row>
                    <hr>
                    <el-row type="flex" class="row-bg">
                        <el-col :span="4"><h5 style="text-align: right;">缴纳账号名称: &nbsp |</h5></el-col>
                        <el-col :span="21"><h5 style="text-align: left">&nbsp {{pbObjecetInfo.pbItemInfo.depositCharge}}</h5></el-col><%--保证金收取单位--%>
                    </el-row>
                    <hr>
                    <el-row type="flex" class="row-bg">
                        <el-col :span="4"><h5 style="text-align: right;">缴纳金额: &nbsp |</h5></el-col>
                        <el-col :span="21"><h5 style="text-align: left;color: red">&nbsp {{pbObjecetInfo.cmcostAmount}}</h5></el-col><%--保证金--%>
                    </el-row>
                    <hr>
                    <el-row type="flex" class="row-bg">
                        <el-col :span="4"><h5 style="text-align: right;">缴纳截止时间: &nbsp |</h5></el-col>
                        <el-col :span="21"><h5 style="text-align: left">&nbsp {{pbObjecetInfo.pbItemInfo.depositTime}}</h5></el-col><%--保证金缴纳截止时间--%>
                    </el-row>
                    <hr>
                    <div style="text-align:center;vertical-align:middle;">
                        <input type="button" style="background-color: #3a8ee6;" value="打印">
                    </div>
                </div>
            </div>
        </el-main>
        <input type="button" value="上一步" @click="shangyibu()">
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
            this.showItemObject(this.objectId)
        },
        //页面加载成功时完成
        mounted: function(){
        },
        /*方法函数  事件等*/
        methods: {
            showItemObject:function (id) {
                var pbItemInfo = new URLSearchParams();
                pbItemInfo.append('objectId',id);
                axios.post('/pb-object-info/ShowObject',pbItemInfo).then(res=>{
                    this.pbObjecetInfo = (res.data)
                    console.log(res.data)
                })
            },
            shangyibu:function () {
                window.location.href=("/jsps/index_jiaona.jsp?objectId="+this.objectId)
            }
        }
    })
</script>
</html>
