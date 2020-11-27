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
</head>
<body>
<div id="abc">
    <el-form :model="biddingForm" :rules="rules" ref="biddingForm" label-width="100px" class="demo-biddingForm">
        <el-row type="flex" class="row-bg">
            <el-col :span="4">
                <el-form-item label="项目名称" prop="itemName">
                    <el-input type="text" v-model="biddingForm.itemName"
                              placeholder="项目名称"></el-input>
                </el-form-item>
            </el-col>
            <el-col :span="3">
                <el-form-item label="资源类型" prop="resourceType">
                    <el-select v-model="biddingForm.resourceType" placeholder="资源类型">
                        <el-option
                                v-for="item in options"
                                :key="item.value"
                                :label="item.label"
                                :value="item.value">
                        </el-option>
                    </el-select>
                </el-form-item>
            </el-col>
            <el-row :span="4">
                <el-form-item>
                    <el-button type="primary" style="width: 150px;" @click="selectPbItemInfo()">查询</el-button>
                </el-form-item>
            </el-row>
        </el-row>
    </el-form>
    <div class="tableDiv">
        <el-table
                highlight-current-row
                border
                :data="tableData.data"
                style="width: 90%;height: 75vh;">
            <el-table-column type="index"></el-table-column>
            <el-table-column align="left" prop="itemCode" label="项目编号" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="itemName" label="项目名称" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="objectName" label="标的名称" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="trad" label="出让方式" :formatter="formatterTrad" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="resourceType"  label="资源类型" :formatter="formatter" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="bidStartTime" label="竞价开始时间" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="bidEndTime" label="竞价结束时间" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="bidderType" label="竞买人类别" :formatter="formatterbidderType" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="state" label="操作"
                             show-overflow-tooltip>
                <template slot-scope="scope">
                    <%--<el-button v-if="typeof scope.row.upstream ==='undefined' || scope.row.upstream ==='' "
                               @click.native.prevent="TerminationUpstream(scope.row,scope.$index)"
                               type="text"
                               size="mini">
                        进入竞价厅</el-button>--%>
                        <el-button type="text" @click.native.prevent="TerminationUpstream(scope.row,scope.$index)">进入竞价厅</el-button>
                        <el-dialog
                                title="竞价记录"
                                :closeOnClickModal="false"
                        :visible.sync="dialogVisible"
                        width="30%"
                        :showClose="false">
                            <el-table
                                    class="tablebidding"
                                    highlight-current-row
                                    border
                                    :data="BiddingHall.data">
                                <el-table-column type="index"></el-table-column>
                                <el-table-column align="left" prop="bidName" label="竞价人" :formatter="formatterbidName" show-overflow-tooltip></el-table-column>
                                    <ul class="infinite-list" v-infinite-scroll="load" style="overflow:auto">
                                        <li v-for="i in count" class="infinite-list-item">{{ i }}</li>
                                    </ul>
                            </el-table>
                            <el-pagination style="text-align: center"
                                           @size-change="handleSizeChange"
                                           @current-change="handleCurrentChange"
                                           :current-page.sync="currentPage2"
                                           :page-sizes="pageSizes2"
                                           :page-size="pageSize2"
                                           layout="total, sizes, prev, pager, next, jumper"
                                           :total="total2">
                            </el-pagination>
                        <span slot="footer" class="dialog-footer">
                          <el-button @click="dialogVisible = false">取 消</el-button>
                          <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
                        </span>
                        </el-dialog>
                </template>
            </el-table-column>
        </el-table>
        <el-pagination style="text-align: center"
                       @size-change="handleSizeChange"
                       @current-change="handleCurrentChange"
                       :current-page.sync="currentPage"
                       :page-sizes="pageSizes"
                       :page-size="pageSize"
                       layout="total, sizes, prev, pager, next, jumper"
                       :total="total">
        </el-pagination>
    </div>
</div>
<%@include file="jar.jsp"%>
</body>
</html>
<script>
    new Vue({
        el: '#abc',
        /*变量*/
        data() {
            return {
                count: 0,
                tableData: {
                    data: []
                },
                BiddingHall:{
                    data:[]
                },
                dialogVisible:false,

                currentPage: 1,//默认显示第几页
                total: 10,//总条数
                pageSizes: [10, 20, 30],//个数选择器
                pageSize: 10,//默认每页显示多少条
                currentPage2: 1,//默认显示第几页
                total2: 10,//总条数
                pageSizes2: [10, 20, 30],//个数选择器
                pageSize2: 10,//默认每页显示多少条

                biddingForm: {
                    itemName: "",
                    resourceType: ""
                },
                rules: {
                    itemName: [
                        { required: true, message: '请输入项目名称', trigger: 'blur' }
                    ],
                    resourceType: [
                        { min: 6, max: 16, message: '6-16位字母、数字和符号', trigger: 'blur' }
                    ]
                },
                options: [{
                    value: '1',
                    label: '国有产权'
                }, {
                    value: '2',
                    label: '公共资源'
                }],
                value: ''
            }
        },
        created(){
            this.selectPbItemInfo();
        },
        //页面加载成功时完成
        mounted: function(){
        },
        /*方法函数  事件等*/
        methods: {
            load () {
                this.count += 2
            },
            selectPbItemInfo() {
                axios.post("/pb-item-info/selectPbItemInfo/"+this.pageSize+"/"+this.currentPage+"/",this.biddingForm).then(res=>{
                    this.tableData.data=res.data.data;
                    this.total=res.data.total;
                }).catch((e)=>{
                })
            },
            formatter(row, column) {
                return row.resourceType === 1 ? '国有产权' : '拓展资源';;
            },
            formatterTrad(row, column) {
                return row.trad === 1 ? '竞价' : '线下';
            },
            formatterbidderType(row, column) {
                return row.bidderTyp === 1 ? '企业' : '个人';
            },
            TerminationUpstream(row, index){
                this.dialogVisible = true;
                itemId =row.itemId
                axios.get("/pb-item-info/selectBiddingHall/"+this.pageSize2+"/"+this.currentPage2+"/"+itemId).then(res=>{
                    this.BiddingHall.data=res.data.data;
                    this.total2=res.data.total;
                })
            },
            formatterbidName(row, column) {
                //如果时间格式是正确的，那下面这一步转化时间格式就可以不用了
                var dateBegin = new Date(row.quoteTime.replace(/-/g, "/"));//将-转化为/，使用new Date
                var dateEnd = new Date();//获取当前时间
                var dateDiff = dateEnd.getTime() - dateBegin.getTime();//时间差的毫秒数
                var dayDiff = Math.floor(dateDiff / (24 * 3600 * 1000));//计算出相差天数
                var leave1 = dateDiff % (24 * 3600 * 1000)    //计算天数后剩余的毫秒数
                var hours = Math.floor(leave1 / (3600 * 1000))//计算出小时数
                //计算相差分钟数
                var leave2 = leave1 % (3600 * 1000)    //计算小时数后剩余的毫秒数
                var minutes = Math.floor(leave2 / (60 * 1000))//计算相差分钟数
                //计算相差秒数
                var leave3 = leave2 % (60 * 1000)      //计算分钟数后剩余的毫秒数
                var seconds = Math.round(leave3 / 1000);
                var timesString = '';

                if (dayDiff != 0) {
                    timesString = dayDiff + '天之前';
                } else if (dayDiff == 0 && hours != 0) {
                    timesString = hours + '小时之前';
                } else if (dayDiff == 0 && hours == 0) {
                    timesString = minutes + '分钟之前';
                }
                return row.bidName+"于"+timesString+"竞价";
            },
            handleCurrentChange(){
            },
            handleSizeChange(){
            }
        }
    });
</script>
<style>
    .el-input{
        width: 180px;
        height: 40px;
    }
    .tableDiv{
        width: 1300px;
        height: 300px;
    }
    .demo-biddingForm{
    }
    .tablebidding{
        height: 500px;
    }
</style>