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
                        <el-form-item label="收款账号" prop="money">
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
                          <el-button type="primary" plain @click="payMoney()">确 定 缴 纳</el-button>
           </span>
        </el-dialog>
        <el-dialog
                title="标的报名上传资料详情"
                :visible.sync="dialogVisible2"
                width="60%">
            <el-form :model="ObjectPbApplyInfo" :rules="rules" ref="ObjectPbApplyInfo" label-width="100px" class="demo-ObjectPbApplyInfo">
                <div class="divSpan">
                    <span  style="margin-left: 20px;">标的详情</span>
                </div>
                <div class="boxdiv">
                    <el-row>
                        <el-col :span="4"
                                class="elCol value">
                            <div class="grid-content bg-purple">
                            项目名称
                            </div>
                        </el-col>
                        <el-col :span="8" class="elCol">
                            <div class="grid-content bg-purple-light">
                                {{ObjectPbApplyInfo.itemName}}
                            </div>
                        </el-col>
                        <el-col :span="4" class="elCol value">
                            <div class="grid-content bg-purple" >
                                批文名称或编号
                            </div>
                        </el-col>
                        <el-col :span="8" class="elCol">
                            <div class="grid-content bg-purple-light">
                                {{ObjectPbApplyInfo.itemCode}}
                            </div>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="4" class="elCol value">
                            <div class="grid-content bg-purple" >
                                标的名称
                            </div>
                        </el-col>
                        <el-col :span="8" class="elCol">
                            <div class="grid-content bg-purple-light">
                                {{ObjectPbApplyInfo.objectName}}
                            </div>
                        </el-col>
                        <el-col :span="4" class="elCol value">
                            <div class="grid-content bg-purple" >
                                资源类型
                            </div>
                        </el-col>
                        <el-col :span="8" class="elCol">
                            <div class="grid-content bg-purple-light">
                                <span v-if="ObjectPbApplyInfo.resourceType===1">国有产权</span>
                                <span v-else="ObjectPbApplyInfo.resourceType===2">拓展资源</span>
                            </div>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="4" class="elCol value">
                            <div class="grid-content bg-purple" >
                                报名开始时间
                            </div>
                        </el-col>
                        <el-col :span="8" class="elCol">
                            <div class="grid-content bg-purple-light">
                                {{ObjectPbApplyInfo.applyStartTime}}
                            </div>
                        </el-col>
                        <el-col :span="4" class="elCol value">
                            <div class="grid-content bg-purple" >
                                报名结束时间
                            </div>
                        </el-col>
                        <el-col :span="8" class="elCol">
                            <div class="grid-content bg-purple-light">
                                {{ObjectPbApplyInfo.applyEndTime}}
                            </div>
                        </el-col>
                    </el-row>
                </div><br>
                <div class="divSpan">
                </div>
                <div class="boxdiv">
                    <el-row>
                        <el-col :span="24" class="elCol">
                            <div class="grid-content bg-purple" class="elRow">
                                标的上传图片
                            </div>
                        </el-col>
                    </el-row>
                </div><br>
                <el-button type="primary" style="margin-left: 45%" plain @click="dialogVisible2 =false">关 闭</el-button>
            </el-form>
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
                moneyStatus:0,
                tableData: {
                    data: [],
                    data: []
                },
                BiddingHall:{
                    data:[]
                },
                dialogVisible:false,
                dialogVisible2:false,
                PaytheDepositOrder:{
                    companyName:"",
                    objectName:"",
                    applyId:"",
                    money:""
                },
                ObjectPbApplyInfo:{
                    itemName:"",
                    itemCode:"",
                    objectName:"",
                    applyEndTime:"",
                    resourceType:"",
                    applyStartTime:""
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
                    resourceType: "",
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
                axios.post("/pb-apply-info/selectApplyInfo/"+this.pageSize+"/"+this.currentPage+"/"+this.moneyStatus,this.biddingForm).then(res=>{
                    this.tableData.data=res.data.data;
                    this.total=res.data.total;
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
                var money = this.PaytheDepositOrder.money
                var applyId =this.PaytheDepositOrder.applyId
                axios.get("/pb-apply-info/updateApplyInfoMoney/"+money+"/"+applyId).then(res=>{
                    if (res.data.flag){
                        this.dialogVisible = false;
                        this.selectPbItemInfo()
                        this.$notify({
                            title: '成功',
                            message: '该用户缴纳保证金成功',
                            type: 'success'
                        });
                    }else{
                        this.$notify.error({
                            title: '失败',
                            message: '该用户缴纳保证金失败',
                        });
                    }
                })
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
                            var applyId =row.applyId
                            axios.post("/pb-apply-info/selectPaytheDeposit/"+applyId).then(res=>{
                                console.log(res.data.data)
                                this.PaytheDepositOrder.companyName = res.data.data.companyName
                                this.PaytheDepositOrder.objectName = res.data.data.objectName
                                this.PaytheDepositOrder.applyId = res.data.data.applyId
                                this.PaytheDepositOrder.money = 80000
                                this.dialogVisible = true;
                            })
                        }
                    }
                });
            },
            TerminationUpstream(row, index){
                axios.get("/pb-apply-info/selectObjectInfo/"+row.itemId).then(res=>{
                    this.ObjectPbApplyInfo.itemName = res.data.data.itemName
                    this.ObjectPbApplyInfo.itemCode = res.data.data.itemCode
                    this.ObjectPbApplyInfo.objectName = res.data.data.objectName
                    this.ObjectPbApplyInfo.applyEndTime = res.data.data.applyEndTime
                    this.ObjectPbApplyInfo.resourceType = res.data.data.resourceType
                    this.ObjectPbApplyInfo.applyStartTime = res.data.data.applyStartTime
                })
                this.dialogVisible2 = true;

            },
            handleCurrentChange(){
            },
            handleSizeChange(){
            },
            handleClick(tab, event) {
                if(tab.name == 'second'){
                    this.moneyStatus=1;
                    this.selectPbItemInfo();
                }else{
                    this.moneyStatus=0;
                    this.selectPbItemInfo()
                }
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
    .elCol{
        display:flex;
        justify-content:center;/*主轴上居中*/
        align-items:center;/*侧轴上居中*/
        height: 40px;
        border:1px solid rgba(1,1,1,0.3) ;
    }
    .value{
        background-color:aliceblue;
    }
    .elRow{
        height: 100px;
    }
    .boxdiv{
        border: 1px solid rgba(1,1,1,0.3) ;padding:10px;;
    }
    .divSpan{
        display:flex;align-items:center;height:30px;background-color: aliceblue;border: 1px solid rgba(1,1,1,0.3) ;border-radius:3px 3px 0 0 ;
    }
</style>
