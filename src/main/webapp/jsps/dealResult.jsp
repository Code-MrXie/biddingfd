
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成交确认书</title>
</head>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<!-- 引入样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
<!-- 引入组件库 -->
<script src="${pageContext.request.contextPath }/static/element/index.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>

<body>
<div id="dealResult">

    <template>
        <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
            <el-tab-pane label="未办理" name="first">
            </el-tab-pane>
            <el-tab-pane label="办理中" name="second">
                <template>
                    <el-form :inline="true" :model="itemForm" class="demo-form-inline">
                        <el-form-item label="项目名称:">
                            <el-input v-model="itemForm.name"></el-input>
                        </el-form-item>
                        <el-form-item label="项目编号:">
                            <el-input v-model="itemForm.code"></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="likeItem()">查询</el-button>
                        </el-form-item>
                    </el-form>

                    <!-- 表格开始 -->
                    <el-table :data="resultTableData" border style="width: 100%">
                        <el-table-column prop="item_code" label="项目编号"></el-table-column>
                        <el-table-column prop="item_name" label="项目名称"></el-table-column>
                        <el-table-column prop="object_name" label="标的名称"></el-table-column>
                        <el-table-column prop="resource_type" label="资源类型">
                            <template slot-scope="scope">
                                <div v-if="scope.row.resource_type=='1'">国有产权</div>
                                <div v-if="scope.row.resource_type=='2'">拓展资源</div>
                            </template>
                        </el-table-column>
                        <el-table-column label="出让方式">竞价</el-table-column>
                        <el-table-column prop="user_name" label="竞得人"></el-table-column>
                        <el-table-column prop="start_price" label="起始价"></el-table-column>
                        <el-table-column prop="reserve_price" label="保留价"></el-table-column>
                        <el-table-column prop="close_price" label="成交价"></el-table-column>
                        <el-table-column prop="fee" label="佣金"></el-table-column>
                        <el-table-column label="操作">
                            <template slot-scope="scope">
                                <el-button @click="stopBid()" type="text" size="small">编辑确认书</el-button>
                                <el-button @click="subResult(scope.row.seq_id)" type="text" size="small">提交</el-button>
                            </template>
                        </el-table-column>
                    </el-table>
                    <!-- 表格结束 -->
                </template>
            </el-tab-pane>
            <el-tab-pane label="我已办结" name="third">

                <template>
                    <el-form :inline="true" :model="itemForm" class="demo-form-inline">
                        <el-form-item label="项目名称:">
                            <el-input v-model="itemForm.name"></el-input>
                        </el-form-item>
                        <el-form-item label="项目编号:">
                            <el-input v-model="itemForm.code"></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="likeItem()">查询</el-button>
                        </el-form-item>
                    </el-form>

                    <!-- 表格开始 -->
                    <el-table :data="resultTableData" border style="width: 100%">
                        <el-table-column prop="item_code" label="项目编号"></el-table-column>
                        <el-table-column prop="item_name" label="项目名称"></el-table-column>
                        <el-table-column prop="object_name" label="标的名称"></el-table-column>
                        <el-table-column prop="resource_type" label="资源类型">
                            <template slot-scope="scope">
                                <div v-if="scope.row.resource_type=='1'">国有产权</div>
                                <div v-if="scope.row.resource_type=='2'">拓展资源</div>
                            </template>
                        </el-table-column>
                        <el-table-column label="出让方式">竞价</el-table-column>
                        <el-table-column prop="user_name" label="竞得人"></el-table-column>
                        <el-table-column prop="start_price" label="起始价"></el-table-column>
                        <el-table-column prop="reserve_price" label="保留价"></el-table-column>
                        <el-table-column prop="close_price" label="成交价"></el-table-column>
                        <el-table-column prop="fee" label="佣金"></el-table-column>
                    </el-table>
                    <!-- 表格结束 -->
                </template>
            </el-tab-pane>
        </el-tabs>
    </template>


</div>

</body>

<script>
    new Vue({
        el: '#dealResult',
        /*变量*/
        data () {
            return {
                activeName: 'second',
                resultTableData:[],
                itemForm:{
                    name:'',
                    code:''
                },
                flow:2,
            }
        },
        //页面加载成功时完成
        mounted: function(){
            var vue = this;
            axios
                .post("/pb-result-info/resultShow/"+vue.flow)
                .then(function (res) {
                    vue.resultTableData=res.data
                })

        },
        /*方法函数  事件等*/
        methods: {
            handleClick(tab, event) {
                var vue = this;
                if(vue.activeName == 'first'){
                    vue.flow = 1;
                }else if(vue.activeName == 'second'){
                    vue.flow = 2;
                }else if(vue.activeName == 'third'){
                    vue.flow = 3;
                };
                axios
                    .post("/pb-result-info/resultShow/"+vue.flow)
                    .then(function (res) {
                        console.log(res.data)
                        vue.resultTableData=res.data
                    })

            },
            subResult(row){
                this.$confirm('是否提交？', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    axios
                        .post("/pb-result-info/subResult/"+row)
                        .then(function (res) {
                            alert("提交成功！！！")
                            location.reload()
                        });
                }).catch(() => {
                });
            }
        }
    });
</script>

</html>
