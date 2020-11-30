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
                title="投标保证金缴纳订单"
                :visible.sync="dialogVisible"
                width="50%">
            <el-form :model="PaytheDepositOrder" :rules="rules" ref="PaytheDepositOrder" label-width="100px" class="demo-biddingForm">
                <el-row type="flex" class="row-bg">
                    <el-col>
                        <el-form-item label="投标单位" prop="itemName">
                            <el-input type="text" class="inputText" v-model="PaytheDepositOrder.companyName"
                                       :disabled="true"></el-input>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col>
                        <el-form-item label="标段名称" prop="resourceType">
                            <el-input type="text" class="inputText" v-model="PaytheDepositOrder.objectName"
                                      :disabled="true"></el-input>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col>
                        <el-form-item label="收款银行" prop="resourceType">
                            <el-input type="text"  class="inputText"
                                      :disabled="true"></el-input>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col>
                        <el-form-item label="收款户名" prop="resourceType">
                            <el-input type="text" class="inputText"
                                      :disabled="true"></el-input>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col>
                        <el-form-item label="收款账号" prop="resourceType">
                            <el-input type="text" class="inputText"
                                      :disabled="true"></el-input>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="7">
                        <el-form-item label="应付金额" prop="resourceType">
                            <el-input type="text" placeholder="80000元"
                                      :disabled="true"></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="6">
                        <el-form-item label="大写金额" prop="resourceType">
                            <el-input type="text" placeholder="捌万元整"
                                      :disabled="true"/>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                </el-row>
                </el-row>
            </el-form>
            <span slot="footer" class="dialog-footer">
                          <el-button type="primary" @click="payMoney(scope.row,scope.$index)">确 定 缴 纳</el-button>
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
                applyId:null,
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
                PaytheDepositOrder:{
                    companyName:"",
                    objectName:"",
                    applyId:""
                },
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
            payMoney(row, column) {

            },
            PayTheDeposit(row, column){
                this.$alert('请确认用户是否已经缴费', '修改缴纳金', {
                    confirmButtonText: '确定',
                    showConfirmButton:true,
                    showCancelButton:true,
                    callback: action => {
                        if (action==='confirm'){
                            /*this.$message({
                                type: 'info',
                                message: 'action: ${ action }'
                            });*/
                            applyId =row.applyId
                            axios.post("/pb-apply-info/selectPaytheDeposit/"+applyId).then(res=>{
                                console.log(res.data.data)
                                this.PaytheDepositOrder.companyName = res.data.data.companyName
                                this.PaytheDepositOrder.objectName = res.data.data.objectName
                                this.PaytheDepositOrder.applyId = res.data.data.applyId
                                this.dialogVisible = true;
                            }).catch((e)=>{
                            })
                        }
                    }
                });
            },
            TerminationUpstream(row, index){

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
        width: 1000px;
    }
    .tabPan{
        height: 90vh;
    }
    .inputText{
        width: 500px;
    }
    .dialog-footer{
        margin-right: 40%;
    }
</style>
