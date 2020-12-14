<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/11
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>建管办备案</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- 引入样式 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
    <script src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
    <!-- 引入组件库 -->
    <script src="${pageContext.request.contextPath }/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>
</head>
<style scoped>
    .grid-content {
        min-height: 50px;
        min-width: 100px;
        border: 1px solid black;
    }
    .block{
        padding: 30px 24px;
        border: 1px solid red;
    }
    .mingcheng{
        background-color: #9d9d9d;
    }
</style>
<body>
<div id="fuDiv">
    <template>
        <el-main>
            <el-input style="width: 200px" value="公共资源-竞价-项目登记" readonly=""></el-input>
            <div class="block" style="height:522px;width: 1000px">
                <div style="height:100%;width:100%">
                    <el-row type="flex" class="row-bg" justify="center">
                        <el-col :span="4" class="mingcheng"><div class="grid-content " >项目名称</div></el-col>
                        <el-col :span="9">
                            <div class="grid-content ">
                                <el-input
                                    placeholder="请输入内容"
                                    v-model="pbItemInfo.itemName"
                                    clearable>
                                </el-input>
                            </div>
                        </el-col>
                        <el-col :span="4" class="mingcheng"><div class="grid-content ">项目编号</div></el-col>
                        <el-col :span="9">
                            <div class="grid-content ">
                                <el-input
                                        placeholder="请输入内容"
                                        v-model="pbItemInfo.itemCode"
                                        clearable>
                                </el-input>
                            </div>
                        </el-col>
                    </el-row>
                    <el-row type="flex" class="row-bg" justify="center">
                        <el-col :span="4" class="mingcheng"><div class="grid-content " >所属地区</div></el-col>
                        <el-col :span="9">
                            <div class="grid-content ">
                                <el-input
                                        placeholder="请输入内容"
                                        v-model="pbItemInfo.itemArea"
                                        clearable>
                                </el-input>
                            </div>
                        </el-col>
                        <el-col :span="4" class="mingcheng"><div class="grid-content ">交易方式</div></el-col>
                        <el-col :span="9">
                            <div class="grid-content ">
                                <el-input
                                        placeholder="请输入内容"
                                        v-model="pbItemInfo.tradWay"
                                        clearable>
                                </el-input>
                            </div>
                        </el-col>
                    </el-row>
                    <el-row type="flex" class="row-bg" justify="center">
                        <el-col :span="4" class="mingcheng"><div class="grid-content " >出让方</div></el-col>
                        <el-col :span="22">
                            <div class="grid-content ">
                                <el-input
                                        placeholder="请输入内容"
                                        v-model="pbItemInfo.transferor"
                                        clearable>
                                </el-input>
                            </div>
                        </el-col>
                    </el-row>
                    <el-row type="flex" class="row-bg" justify="center">
                        <el-col :span="4" class="mingcheng"><div class="grid-content " >出让发联系人</div></el-col>
                        <el-col :span="9">
                            <div class="grid-content ">
                                <el-input
                                        placeholder="请输入内容"
                                        v-model="pbItemInfo.transferorMan"
                                        clearable>
                                </el-input>
                            </div>
                        </el-col>
                        <el-col :span="4" class="mingcheng"><div class="grid-content ">出让方联系电话</div></el-col>
                        <el-col :span="9">
                            <div class="grid-content ">
                                <el-input
                                        placeholder="请输入内容"
                                        v-model="pbItemInfo.transferorPhone"
                                        clearable>
                                </el-input>
                            </div>
                        </el-col>
                    </el-row>
                    <el-row type="flex" class="row-bg" justify="center">
                        <el-col :span="4" class="mingcheng"><div class="grid-content " >出让方联系地址</div></el-col>
                        <el-col :span="22">
                            <div class="grid-content ">
                                <el-input
                                        placeholder="请输入内容"
                                        v-model="pbItemInfo.transferorAddr"
                                        clearable>
                                </el-input>
                            </div>
                        </el-col>
                    </el-row>
                    <el-row type="flex" class="row-bg" justify="center">
                        <el-col :span="4" class="mingcheng"><div class="grid-content " >保证金缴纳方式</div></el-col>
                        <el-col :span="9">
                            <div class="grid-content">
                                <el-radio v-model="pbItemInfo.depositPayWay" label="1">线下</el-radio>
                                <el-radio v-model="pbItemInfo.depositPayWay" label="2" disabled>线上</el-radio><%--disabled--%>
                                （目前只支持线下）
                            </div>
                        </el-col>
                        <el-col :span="4" class="mingcheng"><div class="grid-content ">报名方式</div></el-col>
                        <el-col :span="9">
                            <div class="grid-content ">
                                <el-select v-model="pbItemInfo.OptionsValue1" placeholder="请选择">
                                    <el-option
                                            v-for="item in pbItemInfo.options"
                                            :key="item.value"
                                            :label="item.label"
                                            :value="item.value">
                                    </el-option>
                                </el-select>
                            </div>
                        </el-col>
                    </el-row>
                    <el-row type="flex" class="row-bg" justify="center">
                        <el-col :span="4" class="mingcheng"><div class="grid-content " >保证金缴纳截止时间</div></el-col>
                        <el-col :span="9">
                            <div class="grid-content ">
                                <el-date-picker
                                        v-model="pbItemInfo.depositTime"
                                        align="right"
                                        type="date"
                                        value-format="yyyy-MM-dd HH:mm:ss"
                                        placeholder="选择日期"
                                        :picker-options="pbItemInfo.pickerOptions">
                                </el-date-picker>
                            </div>
                        </el-col>
                        <el-col :span="4" class="mingcheng"><div class="grid-content "></div></el-col>
                        <el-col :span="9"><div class="grid-content "></div></el-col>
                    </el-row>
                    <el-row type="flex" class="row-bg" justify="center">
                        <el-col :span="4" class="mingcheng"><div class="grid-content " >报名开始时间</div></el-col>
                        <el-col :span="9">
                            <div class="grid-content ">
                                <el-date-picker
                                        v-model="pbItemInfo.applyStartTime"
                                        align="right"
                                        type="date"
                                        value-format="yyyy-MM-dd HH:mm:ss"
                                        placeholder="选择日期"
                                        :picker-options="pbItemInfo.pickerOptions">
                                </el-date-picker>
                            </div>
                        </el-col>
                        <el-col :span="4" class="mingcheng"><div class="grid-content ">报名结束时间</div></el-col>
                        <el-col :span="9">
                            <div class="grid-content ">
                                <el-date-picker
                                        v-model="pbItemInfo.applyEndTime"
                                        align="right"
                                        type="date"
                                        value-format="yyyy-MM-dd HH:mm:ss"
                                        placeholder="选择日期"
                                        :picker-options="pbItemInfo.pickerOptions">
                                </el-date-picker>
                            </div>
                        </el-col>
                    </el-row>
                    <el-row type="flex" class="row-bg" justify="center">
                        <el-col :span="4" class="mingcheng"><div class="grid-content " >代理机构</div></el-col>
                        <el-col :span="22">
                            <div class="grid-content ">
                                <el-input
                                        placeholder="请输入内容"
                                        v-model="pbItemInfo.agentName"
                                        clearable>
                                </el-input>
                            </div>
                        </el-col>
                    </el-row>
                    <el-row type="flex" class="row-bg" justify="center">
                        <el-col :span="4" class="mingcheng"><div class="grid-content " >保证金收取单位</div></el-col>
                        <el-col :span="9">
                            <div class="grid-content ">
                                <el-select v-model="pbItemInfo.depositCharge" placeholder="请选择">
                                    <el-option
                                            v-for="item in pbItemInfo.options"
                                            :key="item.value"
                                            :label="item.label"
                                            :value="item.value">
                                    </el-option>
                                </el-select>
                            </div>
                        </el-col>
                        <el-col :span="4" class="mingcheng"><div class="grid-content ">开户名称</div></el-col>
                        <el-col :span="9">
                            <div class="grid-content ">
                                <el-input
                                        placeholder="请输入内容"
                                        v-model="pbItemInfo.accountName"
                                        clearable>
                                </el-input>
                            </div>
                        </el-col>
                    </el-row>
                </div>
            </div>
            <el-button @click="tijiao">提交</el-button>
        </el-main>
    </template>
</div>
</body>
<script>
    new Vue({
        el: '#fuDiv',
        /*变量*/
        data(){
            return{
                pbItemInfo:{
                    itemName:'',/*项目名称*/
                    itemCode:'',/*项目编号*/
                    itemArea:'',/*所属地区*/
                    tradWay:'',/*交易方式*/
                    transferor:'',/*出让方*/
                    transferorMan:'',/*出让方联系人*/
                    transferorPhone:'',/*出让方联系电话*/
                    transferorAddr:'',/*出让方联系地址*/
                    agentName:'',/*代理机构*/
                    accountName:'',/*开户名称*/
                    options: [
                        {
                            value: '工商银行',
                            label: '工商银行'
                        },
                        {
                            value: '农业银行',
                            label: '农业银行'
                        },
                        {
                            value: '商业银行',
                            label: '商业银行'
                        },
                        {
                            value: '建设银行',
                            label: '建设银行'
                        }
                    ],
                    OptionsValue1: '',/*报名方式*/
                    depositCharge: '',/*保证金收取单位*/
                    depositPayWay: '1',/*保证金缴纳方式*/
                    pickerOptions: {
                        disabledDate(time) {
                            return time.getTime() > Date.now();
                        },
                        shortcuts: [{
                            text: '今天',
                            onClick(picker) {
                                picker.$emit('pick', new Date());
                            }
                        }, {
                            text: '昨天',
                            onClick(picker) {
                                const date = new Date();
                                date.setTime(date.getTime() - 3600 * 1000 * 24);
                                picker.$emit('pick', date);
                            }
                        }, {
                            text: '一周前',
                            onClick(picker) {
                                const date = new Date();
                                date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
                                picker.$emit('pick', date);
                            }
                        }]
                    },
                    depositTime: '',/*保证金缴纳截止时间*/
                    applyStartTime: '',/*报名开始时间*/
                    applyEndTime: '',/*报名截止时间*/
                    dialogVisible: false
                }
            }
        },
        //页面加载之前调用
        created(){
        },
        //页面加载成功时完成
        mounted: function(){
        },
        /*方法函数  事件等*/
        methods: {
            tijiao:function(){
                var pbItemInfo=this.pbItemInfo
                axios
                    .post('/pb-item-info/jianguanban',pbItemInfo)
                    .then(function (res) {
                        alert(res)
                        window.location.reload()
                    })
            }
        }
    })
</script>
</html>
