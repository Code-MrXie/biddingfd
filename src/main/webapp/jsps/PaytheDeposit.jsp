<%--
  Created by IntelliJ IDEA.
  User: m1761
  Date: 2020/11/27
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>缴纳保证金</title>
</head>
<body>
    <div id="abc">
        <div>
            <el-tabs v-model="activeName" @tab-click="handleClick" type="border-card">
                <el-tab-pane label="待处理" name="first" class="tabPan">
                    <%@include file="view/view.jsp"%>
                </el-tab-pane>
                <el-tab-pane label="已处理" name="second" class="tabPan">
                    <%@include file="view/view.jsp"%>
                </el-tab-pane>
            </el-tabs>
        </div>

        <el-dialog
                title="竞价记录"
                :visible.sync="dialogVisible"
                width="30%"
        >
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
                showtrue:false,
                activeName: 'first',
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
                axios.post("/pb-apply-info/selectApplyInfo/"+this.pageSize+"/"+this.currentPage+"/",this.biddingForm).then(res=>{
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
            formattermoney(row,column){
                if (row.money=null){
                    this.showtrue =true
                }else {
                    this.showtrue=false;
                }
                console.log(row.money)
                return row.money;
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
            },
            handleClick(tab, event) {
                console.log(tab, event);
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
    .tabPan{
        height: 90vh;
    }
</style>
