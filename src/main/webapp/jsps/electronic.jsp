
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电子竞价管理</title>
</head>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<!-- 引入样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
<!-- 引入组件库 -->
<script src="${pageContext.request.contextPath }/static/element/index.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>

<body>
<div id="abc">

    <template>
        <el-tabs v-model="activeName" type="card">
            <el-tab-pane label="进行中" name="first">
                <template>

                        <el-button type="primary">新增</el-button>

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
                    <el-table
                            :data="electronicTableData"
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
                                prop="bid_start_time"
                                label="竞价开始时间">
                        </el-table-column>
                        <el-table-column
                                prop="bid_delay_time"
                                label="竞价结束时间">
                        </el-table-column>
                        <el-table-column
                                label="竞价规则">
                            <template slot-scope="scope">
                                    <div v-if="scope.row.bid_rule != null">已设置</div>
                                    <div v-if="scope.row.bid_rule== null ">待设置</div>
                            </template>
                        </el-table-column>
                        <el-table-column
                                label="启动状态">
                            <template slot-scope="scope">
                                <div v-if="scope.row.start_state=='1'">已启动</div>
                                <div v-if="scope.row.start_state=='2'">终止中</div>
                            </template>
                        </el-table-column>
                        <el-table-column
                                label="竞价方式">
                            <template slot-scope="scope">
                                <div v-if="scope.row.bid_way=='1'">加价</div>
                                <div v-if="scope.row.bid_way=='2'">减价</div>
                            </template>
                        </el-table-column>
                        </el-table-column>
                        <el-table-column
                                label="操作">
                            <template slot-scope="scope">
                                <el-button @click="stopBid(scope.row.item_id)" type="text" size="small">竞价终止</el-button>
                                <el-button @click="rule(scope.row.item_id)" type="text" size="small">设置规则</el-button>
                                <el-button @click="signInfo(scope.row.item_id)" type="text" size="small">竞价记录单</el-button>
                            </template>
                        </el-table-column>
                    </el-table>
                    <!-- 表格结束 -->
                </template>
            </el-tab-pane>
            <el-tab-pane label="已结束" name="second">已结束</el-tab-pane>
        </el-tabs>
    </template>


    <!-- 竞价规则设置开始 -->
    <el-dialog
            title="竞价规则设置"
            :visible.sync="bidRules"
            width="70%"
            :before-close="handleClose">
        <el-form :inline="true" :label-position="labelPosition" label-width="180px" :model="setBidRule">
            <el-form-item label="竞价模式">
                <el-input v-model="setBidRule.rule_model"></el-input>
            </el-form-item>
            <el-form-item label="自由竞价时长（秒）" >
                <el-input v-model="setBidRule.free_bid_time"></el-input>
            </el-form-item>
            <br>
            <el-form-item label="延时竞价时长（秒）">
                <el-input v-model="setBidRule.bid_delay_time"></el-input>
            </el-form-item>
            <el-form-item label="竞价标的间隔长（秒）">
                <el-input v-model="setBidRule.bid_interval_time"></el-input>
            </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
            <el-button @click="bidRules = false">取 消</el-button>
            <el-button type="primary" @click="subBidRule()">确 定</el-button>
        </span>
    </el-dialog>
    <!-- 竞价规则设置结束 -->

    <!-- 标的信息列表开始 -->
    <el-dialog
            title="标的信息列表"
            :visible.sync="info"
            width="80%"
            :before-close="handleClose">
            <el-table
                    :data="signTableData"
                    border
                    style="width: 100%">
                <el-table-column
                        prop="orderNum"
                        label="序号"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="objectName"
                        label="标的名称">
                </el-table-column>
                <el-table-column
                        prop="cmcostAmount"
                        label="保证金(元)"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="startPrice"
                        label="起始价">
                </el-table-column>
                <el-table-column
                        prop="isReservePrice"
                        label="是否有保留价"
                        width="130">
                </el-table-column>
                <el-table-column
                        prop="reservePrice"
                        label="保留价">
                </el-table-column>
                <el-table-column
                        prop="quoteIncrement"
                        label="加价幅度"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="unit"
                        label="报价单位"
                        width="100">
                </el-table-column>
                <el-table-column
                        label="操作">
                    <template slot-scope="scope">
                        <el-button @click="setRule(scope.row.objectId)" type="text" size="small">修改</el-button>
                        <el-button @click="ruleDetail(scope.row.object_code)" type="text" size="small">查看详细</el-button>
                        <el-button @click="info=true" type="text" size="small">删除</el-button>
                    </template>
                </el-table-column>
            </el-table>
        <span slot="footer" class="dialog-footer">
            <el-button @click="info = false">取 消</el-button>
            <el-button type="primary" @click="info = false">确 定</el-button>
        </span>
    </el-dialog>
    <!-- 标的信息列表结束 -->


    <!-- 标的规则设置开始 -->
    <el-dialog
            title="标的规则设置"
            :visible.sync="sign"
            width="75%"
            :before-close="handleClose">
        <el-form :inline="true" :label-position="labelPosition" label-width="200px" :model="signRule">
            <el-form-item label="标的名称">
                <el-input v-model="signRule.objectName" style="width: 620px"></el-input>
            </el-form-item>
            <br>
            <el-form-item label="竞价模式">
                <el-input v-model="signRule.bidState"></el-input>
            </el-form-item>
            <el-form-item label="竞价方式">
                <el-radio-group v-model="signRule.trad">
                    <el-radio label="1">加价</el-radio>
                    <el-radio label="2">减价</el-radio>
                </el-radio-group>
            </el-form-item>
            <br>
            <el-form-item label="优先权使用方式">
                <el-select v-model="signRule.priorityWay">
                    <el-option label="场内单次行权" value="1"></el-option>
                    <el-option label="场内多次行权" value="2"></el-option>
                    <el-option label="场外行权" value="3"></el-option>
                    <el-option label="无优先权" value="4"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="优先权确认时长（秒）">
                <el-input v-model="signRule.priorityConfirmLen"></el-input>
            </el-form-item>
            <br>
            <el-form-item label="优先权竞买人">
                <el-select v-model="signRule.priorityBidType" placeholder="竞买人类别">
                    <el-option label="个人" value="1"></el-option>
                    <el-option label="企业" value="2"></el-option>
                </el-select>
                <el-input  v-model="signRule.priorityApplyId" style="width: 390px"> </el-input>
            </el-form-item>
            <br>
            <el-form-item label="报价单位">
                <el-select v-model="signRule.unit" >
                    <el-option value="元"></el-option>
                    <el-option value="万元"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="报价小数点设置">
                <el-select v-model="signRule.splitDecimal" >
                    <el-option label="不保留小数点设置" value="1"></el-option>
                    <el-option label="保留小数点后一位" value="2"></el-option>
                    <el-option label="保留小数点后两位" value="3"></el-option>
                </el-select>
            </el-form-item>
            <br>
            <el-form-item label="保留价">
                <el-input v-model="signRule.reservePrice"></el-input>
            </el-form-item>
            <el-form-item label="手续费">
            <el-radio-group v-model="signRule.chargeState">
                <el-radio  label="1">百分比</el-radio>
                <el-radio label="2">金额</el-radio>
            </el-radio-group>
            <el-input v-model="signRule.scale" style="width: 100px" size="small"></el-input>%
        </el-form-item>
            <br>
            <el-form-item label="起始价">
                <el-input v-model="signRule.startPrice"></el-input>
            </el-form-item>
            <el-form-item label="加价幅度">
                <el-input v-model="signRule.quoteIncrement"></el-input>
            </el-form-item>
            <br>
            <el-form-item label="竞价开始时间">
                <el-date-picker type="date" placeholder="选择日期" v-model="signRule.bidStartTime" style="width: 220px"></el-date-picker>
            </el-form-item>
            <el-form-item label="竞价结束时间">
                <el-date-picker type="date" placeholder="选择日期" v-model="signRule.bidDelayTime" style="width: 220px"></el-date-picker>
            </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
            <el-button @click="sign = false">取 消</el-button>
            <el-button type="primary" @click="subSetSignRule()">确 定</el-button>
        </span>
    </el-dialog>
    <!-- 标的规则设置结束 -->



</div>

</body>

<script>
    new Vue({
        el: '#abc',
        /*变量*/
        data () {

            return {

                activeName: 'first',
                electronicTableData:[],
                signTableData:[],
                itemForm: {
                    name: '',
                    code: ''
                },
                formInline:{
                    user:'',
                    region:''
                },
                setBidRule:{
                    rule_model:'',
                    free_bid_time:'',
                    bid_delay_time:'',
                    bid_interval_time:''
                },
                signRule:{
                    objectName:'',
                    bidState:''
                },
                item_id:'',
                objectId:'',
                labelPosition:"right",
                bidRules:false,
                info:false,
                sign:false,
                show:false
            }
        },
        //页面加载成功时完成
        mounted: function(){
            var _this = this;
            axios
                .post('/pb-item-info/electronicTable')
                .then(function (res) {
                    _this.electronicTableData = res.data;
                })

        },
        /*方法函数  事件等*/
        methods: {

            //模糊查询
            likeItem() {
                var _this = this;
                var name = _this.itemForm.name;
                var code = _this.itemForm.code;
                axios
                    .post('/pb-item-info/likeElectronic',{
                        name:name,
                        code:code
                    })
                    .then(function (res) {
                            _this.electronicTableData = res.data;
                    })
            },
            handleClose(){

            },
            //竞价终止
            stopBid(row){
                this.$confirm('确定要终止竞价?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    axios
                        .get('/pb-item-info/stopBid/'+row)
                        .then(function (res) {
                            alert("竞价已终止")
                            location.reload();
                        });
                }).catch(() => {
                });


            },
            //竞价规则设置
            rule(row){
                var _this = this;
                _this.bidRules=true;
                _this.item_id=row;
                axios
                    .post('/pb-item-info/bidRuleDetail/'+row)
                    .then(function (res) {
                        if(res.data){
                            _this.setBidRule.rule_model=res.data.ruleModel;
                            _this.setBidRule.bid_delay_time=res.data.bidDelayTime;
                            _this.setBidRule.bid_interval_time=res.data.bidIntervalTime;
                            _this.setBidRule.free_bid_time=res.data.freeBidTime;
                        }


                    });


            },
            subBidRule(){
                var _this = this;
                var rule_model=_this.setBidRule.rule_model;
                var free_bid_time=_this.setBidRule.free_bid_time;
                var bid_delay_time=_this.setBidRule.bid_delay_time;
                var bid_interval_time=_this.setBidRule.bid_interval_time;

                axios
                    .post('/pb-item-info/subBidRule/'+_this.item_id,{
                        rule_model:rule_model,
                        free_bid_time:free_bid_time,
                        bid_delay_time:bid_delay_time,
                        bid_interval_time:bid_interval_time
                    })
                    .then(function (res) {
                        alert("设置成功")
                        _this.bidRules=false;
                    });

            },


            //竞价记录单
            signInfo(row){
                var _this = this;
                _this.info = true;
                axios
                    .post('/pb-item-info/signInfo/'+row)
                    .then(function (res) {
                        _this.signTableData=res.data;
                    });
            },
            //设置标的规则
            setRule(row){
                var _this = this;
                _this.sign=true;
                _this.objectId=row;
                axios
                    .post('/pb-item-info/signRuleInfo/'+row)
                    .then(function (res) {
                        console.log(res.data.objectName)
                        console.log(res.data.bidState)
                        _this.signRule.objectName = res.data.objectName;
                        _this.signRule.bidState = res.data.bidState;

                    });

            },
            subSetSignRule(){
                var _this = this;
                console.log(_this.objectId)
                axios
                    .post('/pb-item-info/subSetSignRule/'+_this.objectId,{
                        signRule:_this.signRule
                    })
                    .then(function (res) {
                        alert("设置成功")
                    });

            },
            ruleDetail(row){

            }

        }
    });

</script>

</html>
