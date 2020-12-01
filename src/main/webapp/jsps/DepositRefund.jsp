<%--
  Created by IntelliJ IDEA.
  User: m1761
  Date: 2020/11/30
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>保证金退付管理</title>
</head>
<body>
<div id="abc">
    <div>
        <el-tabs v-model="activeName" @tab-click="handleClick" type="border-card">
            <el-tab-pane label="待处理" name="first" class="tabPan">
                <%@include file="view/reFundview.jsp"%>
            </el-tab-pane>
            <el-tab-pane label="已处理" name="second" class="tabPan">
                <%@include file="view/reFundview.jsp"%>
            </el-tab-pane>
        </el-tabs>
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
                applyId:null,
                showtrue:false,
                activeName: 'first',
                count: 0,
                moneyStatus:1,
                tableData: {
                    data: [],
                },
                BiddingHall:{
                    data:[]
                },
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
                axios.post("/pb-apply-info/selectApplyInfo23/"+this.pageSize+"/"+this.currentPage+"/"+this.moneyStatus,this.biddingForm).then(res=>{
                    this.tableData.data=res.data.data;
                    this.total=res.data.total;
                })
            },
            formatter(row, column) {
                return row.resourceType === 1 ? '国有产权' : '拓展资源';
            },
            formatterTrad(row, column) {
                return row.trad === 1 ? '竞价' : '线下';
            },
            formatterbidderType(row, column) {
                return row.bidderTyp === 1 ? '企业' : '个人';
            },
            returnPayTheDeposit(row, column){
                this.$alert('确定退回保证金吗', '缴退缴纳金', {
                    confirmButtonText: '确定',
                    showConfirmButton:true,
                    showCancelButton:true,
                    callback: action => {
                        if (action==='confirm'){
                            var applyId =row.applyId
                            this.moneyStatus=2;
                            axios.get("/pb-apply-info/updateApplyInfoMoneyStatus/"+applyId+"/"+this.moneyStatus).then(res=>{
                                if (res.data.flag){
                                    this.moneyStatus=1;
                                    this.selectPbItemInfo()
                                    this.$notify({
                                        title: '成功',
                                        message: '等待审核',
                                        type: 'success'
                                    });
                                }else{
                                    this.$notify.error({
                                        title: '失败',
                                        message: '反馈',
                                    });
                                }
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

            },
            handleCurrentChange(){
            },
            handleSizeChange(){
            },
            handleClick(tab, event) {
                if(tab.name == 'second'){
                    this.moneyStatus=2;
                    this.selectPbItemInfo();
                }else{
                    this.moneyStatus=1;
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
        width: 1500px;
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

