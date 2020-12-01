<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/25
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成交结果录入办理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- 引入样式 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
    <script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
    <!-- 引入组件库 -->
    <script src="${pageContext.request.contextPath }/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>
</head>
<style type="text/css">
    .tab { height:23px;}
    .tab ul { list-style:none; }
    .tab li { border:1px solid #ccc; background:#eee; cursor:pointer; display:block; float:left; text-align:center; text-decoration:none; width:68px; font-size:12px; height:21px; line-height:21px; margin:0 2px; position:relative; top:1px; z-index:9; }
    .tab li:hover { text-decoration:underline; }
    .tab li.curr { background:#fff; border-bottom-color:#fff; cursor:default; font-weight:bold; }
    .cc { border:1px solid #ccc; padding:100px; width:1300px;}
</style>

<body>
<div id="fuDiv">
    <div class="tab">
        <ul>
            <li id="a1" @click="setTab('a',1)" class="curr">未办理</li>
            <li id="a2" @click="setTab('a',2)">办理中</li>
            <li id="a3" @click="setTab('a',3)">已办理</li>
        </ul>
    </div>

    <div id="con_a_1" class="cc">
        <div style="width: 600px;height: 50px">
            项目名称：<input v-model="itemName">
            项目编号：<input v-model="itemCode">
            <input type="button" value="查询" @click="submit">
        </div>
        <el-table
                highlight-current-row
                border
                :data="pbItemInfoList"
                style="width: 90%;height: 75vh;">
            <el-table-column prop="itemId" type="index"></el-table-column>
            <el-table-column align="left" prop="itemId" label="项目id" show-overflow-tooltip v-if="show"></el-table-column>
            <el-table-column align="left" prop="itemCode" label="项目编号" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="itemName" label="项目名称" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="resourceType" label="资源类型" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="tradWay" label="出让方式" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="applyStartTime" label="报名开始时间" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="applyEndTime" label="报名结束时间" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="applyNotice" label="办理事项" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="otherDeal" label="状态与流程图" show-overflow-tooltip></el-table-column>
            <el-table-column label="操作">
                <template slot-scope="scope">
                    <el-button @click="deleteThis(scope.row.itemId)" type="text" size="small">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</div>
</body>
<script>
    new Vue({
        el: '#fuDiv',
        /*变量*/
        data(){
            return{
                show:false,
                pbItemInfoList:[],
                itemName: "",
                itemCode : "",
                phase:""
            }
        },
        //页面加载之前调用
        created(){
            this.onlardTest()
        },
        //页面加载成功时完成
        mounted: function(){
        },
        /*方法函数  事件等*/
        methods: {
            showAll:function(phase){
                var pbItemInfo = new URLSearchParams();
                pbItemInfo.append('phase',phase);
                axios.post('/pb-item-info/findPbItemInfo',pbItemInfo).then(res=>{
                    this.pbItemInfoList = (res.data)
                })
            },
            onlardTest:function(){
                this.phase = 1
                this.showAll(this.phase)
            },
            setTab : function (name,cursel){
                for(i=1;i<=3;i++){
                    var menu=document.getElementById(name+i);
                    var con=document.getElementById("con_"+name+"_"+i);
                    menu.className=i==cursel?"curr":"";
                }
                this.phase = cursel
                this.showAll(cursel)
            },
            submit : function () {
                var itemName=this.itemName;
                var itemCode=this.itemCode;
                var phase=this.phase;
                var pbItemInfo = new URLSearchParams();
                pbItemInfo.append('itemName',itemName);
                pbItemInfo.append('itemCode',itemCode);
                pbItemInfo.append('phase',phase);
                axios.post('/pb-item-info/findPbItemInfo',pbItemInfo).then(res=>{
                    this.pbItemInfoList = (res.data);
                })
            },
            TerminationUpstream : function () {
                var seqId=this.pbItemInfoList.itemCode
                console.log(seqId)
            },
            deleteThis(row){
                var pbItemInfo = new URLSearchParams();
                pbItemInfo.append('itemId',row);
                this.$confirm('确定要删除?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    axios.post('/pb-item-info/deteleThis/',pbItemInfo).then(function (res){
                        if (res.data){
                            alert("删除成功")
                            location.reload();
                        } else {
                            alert("删除失败")
                            location.reload();
                        }
                    });
                })
            },
        }
    });
</script>
</html>
