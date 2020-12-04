
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>资格审核</title>
</head>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<!-- 引入样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
<!-- 引入组件库 -->
<script src="${pageContext.request.contextPath }/static/element/index.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>

<body>
<div id="qualification">

    <template>
        <el-tabs v-model="activeName" type="card">
            <el-tab-pane label="未办理" name="first">
                <el-table
                        :data="qualilficationTableData"
                        border
                        style="width: 100%">
                    <el-table-column
                            prop="item_code"
                            label="项目编号">
                    </el-table-column>
                    <el-table-column
                            prop="item_name"
                            label="项目名称">
                    </el-table-column>
                    <el-table-column
                            prop="object_name"
                            label="标的名称">
                    </el-table-column>
                    <el-table-column
                            label="资源类型">
                        <template slot-scope="scope">
                            <div v-if="scope.row.resource_type=='1'">国有产权</div>
                            <div v-if="scope.row.resource_type=='2'">拓展资源</div>
                        </template>
                    </el-table-column>
                    <el-table-column
                            label="出让方式">
                        竞价
                    </el-table-column>
                    <el-table-column
                            prop="bid_start_time"
                            label="竞价开始时间">
                    </el-table-column>
                    <el-table-column
                            prop="bid_end_time"
                            label="竞价结束时间">
                    </el-table-column>
                    <el-table-column
                            label="操作">
                        <template slot-scope="scope">
                            <el-button @click="applyTable(scope.row.item_id)" type="text" size="small">查看</el-button>
                        </template>
                    </el-table-column>
                </el-table>
            </el-tab-pane>
            <el-tab-pane label="已办理" name="second">
            </el-tab-pane>
        </el-tabs>
    </template>


    <!-- 竞买人列表开始 -->
    <el-dialog
            title="竞买人列表"
            :visible.sync="applyList"
            width="70%">
        <el-table
                :data="applyTableData"
                border>
            <el-table-column
                    prop="enter_org_code"
                    label="组织机构代码/身份证号">
            </el-table-column>
            <el-table-column
                    prop="company_name"
                    label="企业名称/姓名">
            </el-table-column>
            <el-table-column
                    prop="contacts_name"
                    label="联系人">
            </el-table-column>
            <el-table-column
                    prop="contacts_phone"
                    label="联系电话">
            </el-table-column>
            <el-table-column
                    prop="create_time"
                    label="注册时间">
            </el-table-column>
            <el-table-column
                    label="操作">
                <template slot-scope="scope">
                    <el-button @click="applyDetail" type="text" size="small">查看</el-button>
                </template>
            </el-table-column>
        </el-table>
        <span slot="footer" class="dialog-footer">
            <el-button @click="applyList = false">取 消</el-button>
        </span>
    </el-dialog>
    <!-- 竞买人列表结束 -->
</div>
</body>


<script>
    new Vue({
        el: '#qualification',
        /*变量*/
        data () {
            return {
                activeName: 'first',
                qualilficationTableData:[],
                applyTableData:[],
                applyList:false,
            }
        },
        //页面加载成功时完成
        mounted: function(){
            var _this = this;
            axios
                .post('/pb-item-info/likeElectronic',{
                    name:'',code:''
                })
                .then(function (res) {
                    _this.qualilficationTableData = res.data;
                })

        },
        /*方法函数  事件等*/
        methods: {
            applyTable(row){
                var _this = this;
                _this.applyList= true;
                axios
                    .post('/pb-apply-info/applyTable/'+row)
                    .then(function (res) {
                        console.log(res.data)
                        _this.applyTableData = res.data;
                    })
            }

        },
        handleClose(){

        },
        applyDetail(){
            //指定跳转地址
            //this.$router.replace('/electronic.jsp')
        }
    });

</script>

</html>
