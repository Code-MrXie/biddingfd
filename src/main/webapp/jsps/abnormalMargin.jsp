<%--
  Created by IntelliJ IDEA.
  User: m1761
  Date: 2020/12/1
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>异常保证金</title>
</head>
<body>
<%@include file="jar.jsp"%>
<div id="normal">
    <div>
        <el-form :model="biddingForm" :rules="rules" ref="biddingForm" label-width="100px" class="demo-biddingForm"><br>
            <el-row type="flex" class="row-bg">
                <el-col :span="5">
                    <el-form-item label="项目名称" prop="itemName">
                        <el-input type="text" v-model="biddingForm.itemName"
                                  placeholder="项目名称"></el-input>
                    </el-form-item>
                </el-col>
                <el-col :span="4">
                    <el-form-item label="缴款状态" prop="resourceType">
                        <el-select v-model="biddingForm.moneyStatus" placeholder="已/未缴纳">
                            <el-option
                                    v-for="item in options"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                            </el-option>
                        </el-select>
                    </el-form-item>
                </el-col>
                <el-col :span="4">
                    <el-form-item label="退款状态" prop="resourceType">
                        <el-select v-model="biddingForm.moneyStatus1" placeholder="已/未退款">
                            <el-option
                                    v-for="item in options2"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                            </el-option>
                        </el-select>
                    </el-form-item>
                </el-col>
                <el-row :span="4">
                    <el-form-item>
                        <el-button type="primary" style="width: 150px;" @click="selectAbNormalMargin()">查询</el-button>
                    </el-form-item>
                </el-row>
            </el-row>
        </el-form>
    </div>
    <div class="tableDiv">
        <el-table
                highlight-current-row
                border
                :data="tableData.data"
                style="width: 100%;height: 78vh;">
            <el-table-column align="left" prop="moneyStatus" :formatter="formatterMoneyStatus" label="异常类型" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="itemCode" label="项目编号" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="itemName" label="项目名称" width="180px" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="objectName" label="标的名称" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="bidName" label="竞买人"  show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="money" label="金额(元)"  show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="resourceType"  label="资源类型" :formatter="formatter" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="applyStartTime" label="报名开始时间" width="200px" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="itemDepositTime" label="保证金缴纳截止时间" width="200px" show-overflow-tooltip></el-table-column>
            <el-table-column align="left" prop="bidStartTime" label="竞价开始时间" width="200px" show-overflow-tooltip></el-table-column>
            <el-table-column  label="操作" width="150px">
                <template slot-scope="scope">
                    <el-button v-if="scope.row.moneyStatus == 2"
                               @click.native.prevent="returnPayTheDeposit(scope.row,scope.$index)"
                               type="text"
                               size="mini">
                        退保证金
                    </el-button>
                    <el-button  v-if="scope.row.moneyStatus == 3"
                                @click.native.prevent="TerminationUpstream(scope.row,scope.$index)"
                                type="text"
                                size="mini">
                        查看详情
                    </el-button>
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
</body>
<script>
    new Vue({
        el:"#normal",
        data()  {
            return{
                biddingForm:{
                    moneyStatus:"",
                    moneyStatus1:"",
                    itemName:""
                },
                currentPage: 1,//默认显示第几页
                total: 10,//总条数
                pageSizes: [10, 20, 30],//个数选择器
                pageSize: 10,//默认每页显示多少条
                rules: {
                    itemName: [
                        { required: true, message: '请输入项目名称', trigger: 'blur' }
                    ],
                },
                tableData:{
                    data:[],
                },
                options:[{
                    value: '1',
                    label: '已缴纳'
                },{
                    value: '0',
                    label: '未缴纳'
                }],
                options2:[{
                    value: '3',
                    label: '已退款'
                },{
                    value: '2',
                    label: '未退款'
                }],
            }
        },
        created(){
            this.selectAbNormalMargin()
        },
        mounted:function () {

        },
        methods:{
            selectAbNormalMargin(){
                axios.post("/pb-apply-info/selectAbNormalMargin/"+this.pageSize+"/"+this.currentPage+"/",this.biddingForm).then(res=>{
                    this.tableData.data=res.data.data;
                    this.total=res.data.total;
                })
            },
            formatterMoneyStatus(row,column){
                if(row.resourceType==0){
                    return "未缴纳"
                }else if(row.resourceType==1){
                    return "未申请退款"
                }else if (row.resourceType==2){
                    return "未退还"
                }
            },
            formatter(row,column){
                return row.resourceType ===1? "国有产权":"拓展资源"
            },
            handleSizeChange(){
                alert(1)
            },
            handleCurrentChange(){
                alert(2)
            }
        }
    })
</script>
</html>
