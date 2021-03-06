<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>竞价大厅</title>
</head>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<!-- 引入样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
<!-- 引入组件库 -->
<script src="${pageContext.request.contextPath }/static/element/index.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>

<body>
<div id="ListingLink" style="margin:0px auto">
    <el-row :gutter="40">
        <el-col :span="10">
            <div class="grid-content bg-purple">
                标段-测试竞价
                <div class="banner">
                    <div class="item">
                        <img :src="dataList[currentIndex]" style="width: 540px;height: 300px">
                    </div>
                    <div class="page" v-if="this.dataList.length > 1">
                        <ul>
                            <li @click="gotoPage(prevIndex)">&lt;</li>
                            <li v-for="(item,index) in dataList" @click="gotoPage(index)" :class="{'current':currentIndex == index}">  {{index+1}}</li>
                            <li @click="gotoPage(nextIndex)">&gt;</li>
                        </ul>
                    </div>
                </div>

            </div>
        </el-col>
        <el-col :span="14">
            <div class="grid-content bg-purple">

                <div class="RU">
                    标的竞价状态：
                        <span v-if="linkShow.bid_status == 1" style="color: red">等待</span>
                        <span v-if="linkShow.bid_status == 2" style="color: red">开始</span>
                    标的竞价模式：
                        <span v-if="linkShow.trad == 1" style="color: red">加价</span>
                        <span v-if="linkShow.trad == 2" style="color: red">减价</span>
                </div>

                <div class="RC">
                   <div style="float: left;margin-left: 80px;">
                       <table>
                           <tr>
                               <td>最高报价：
                                   <span style="color: #D91917;font-size: x-large">{{linkShow.quote_price}}{{linkShow.unit}}</span>
                                   <el-button size="mini">出价人：{{linkShow.mark}}</el-button>
                               </td>
                           </tr>
                           <tr>
                               <td>最新加价：<span style="color: #D91917;font-size: x-large">{{linkShow.newPrice}}{{linkShow.unit}}</span></td>
                           </tr>
                       </table>
                        <span style="font-size: small;color: #82848a">距结束：</span><span style="font-size: 30px;">{{CountDown}}</span>
                        <span style="font-size: small;color: #82848a">{{num}}次延时</span>
                    </div>
                </div>

                <%--<div style="background: #e8e8e8;width: 450px;height: 50px;margin-left: 150px;line-height: 50px">--%>
                    <%--<span style="font-size: 16px;color: #82848a;float: left">出&nbsp;&nbsp;价</span>--%>
                    <%--<div style="width: 20px;height: 40px;border: 1px solid #D3CFCE;float: right;--%>
                    <%--margin-top: 5px;margin-right: 150px;">--%>
                        <%--<a style="line-height: 10px">+</a>--%>
                        <%--<input style="width: 20px;height: 20px" @click="beiShu()" v-model="beiShu">--%>
                        <%--<a style="line-height: 10px">-</a>--%>
                    <%--</div>--%>
                    <%--<div style="width: 200px;height: 30px;border: 1px solid #D3CFCE;float: right;--%>
                    <%--margin-top: 10px">{{chuJia}}</div>--%>
                <%--</div>--%>

                <div class="RCU">
                    <el-button type="primary" @click="baoJia">报价</el-button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <el-button type="primary">优先权</el-button>
                </div>

                <div class="RD">
                    <table>
                        <tr>
                            <td>底价 : {{linkShow.start_price}}</td>
                            <td style="color: #82848a">加价幅度 : {{linkShow.quote_increment}}</td>
                            <td>开始时间 : {{linkShow.bid_start_time}}</td>
                        </tr>
                        <tr>
                            <td style="color: #82848a">保证金 : {{linkShow.money}}</td>
                            <td>自由竞价周期 : {{linkShow.bid_free_len}}秒</td>
                            <td style="color: #82848a">优先购买权人 : 无
                                <span v-if="linkShow.priority_enter_name == ''">无</span>
                            </td>
                        </tr>
                        <tr style="color: #82848a">
                            <td >升值率 ：</td>
                            <td>延时竞价周期 ： {{linkShow.bid_delay_len}}秒</td>
                        </tr>
                        <tr>
                            <td colspan="3" style="color: #82848a">
                                竞价规则：至少一人报名且出价不低于起拍价，方可成交
                                <br>
                                <br>
                                联系咨询方式：台州市公共资源交易中心
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </el-col>
    </el-row>

        <template>
            <el-tabs v-model="activeName" type="card" >
                <el-tab-pane label="基本信息" name="first">
                    <div class="block" style="height:300px;width: 80%">
                        <div style="height:100%;width:100%">
                            <el-row type="flex" class="row-bg" justify="center">
                                <el-col :span="4" class="mingcheng"><div class="grid " >标的编号</div></el-col>
                                <el-col :span="6"><div class="grid ">{{pbObjecetInfo.objectCode}}</div></el-col>
                                <el-col :span="4" class="mingcheng"><div class="grid ">标的名称</div></el-col>
                                <el-col :span="4"><div class="grid ">{{pbObjecetInfo.objectName}}</div></el-col>
                                <el-col :span="4" class="mingcheng"><div class="grid ">竞价方式</div></el-col>
                                <el-col :span="4"><div class="grid ">{{pbObjecetInfo.trad}}</div></el-col>
                            </el-row>
                            <el-row type="flex" class="row-bg" justify="center">
                                <el-col :span="4" class="mingcheng"><div class="grid " >标的位置</div></el-col>
                                <el-col :span="14"><div class="grid ">{{pbObjecetInfo.objectAddress}}</div></el-col>
                                <el-col :span="4" class="mingcheng"><div class="grid ">延时竞价</div></el-col>
                                <el-col :span="4"><div class="grid ">{{pbObjecetInfo.bidDelayTime}}</div></el-col>
                            </el-row>
                            <el-row type="flex" class="row-bg" justify="center">
                                <el-col :span="4" class="mingcheng"><div class="grid " >起始价</div></el-col>
                                <el-col :span="6"><div class="grid ">{{pbObjecetInfo.startPrice}}万元</div></el-col>
                                <el-col :span="4" class="mingcheng"><div class="grid ">评估价</div></el-col>
                                <el-col :span="4"><div class="grid ">{{pbObjecetInfo.evaluatePrice}}万元</div></el-col>
                                <el-col :span="4" class="mingcheng"><div class="grid ">加价幅度</div></el-col>
                                <el-col :span="4"><div class="grid ">{{pbObjecetInfo.quoteIncrement}}万元</div></el-col>
                            </el-row>
                            <el-row type="flex" class="row-bg" justify="center">
                                <el-col :span="4" class="mingcheng"><div class="grid " >保证金</div></el-col>
                                <el-col :span="6"><div class="grid ">{{pbObjecetInfo.cmcostAmount}}万元</div></el-col>
                                <el-col :span="4" class="mingcheng"><div class="grid ">交易服务费</div></el-col>
                                <el-col :span="4"><div class="grid ">{{pbObjecetInfo.charge}}万元</div></el-col>
                                <el-col :span="4" class="mingcheng"><div class="grid ">保留价</div></el-col>
                                <el-col :span="4"><div class="grid ">{{pbObjecetInfo.reservePrice}}万元</div></el-col>
                            </el-row>
                            <el-row type="flex" class="row-bg" justify="center">
                                <el-col :span="4" class="mingcheng"><div class="grid " >保证金缴纳截止时间</div></el-col>
                                <el-col :span="6"><div class="grid">{{pbObjecetInfo.depositPayEndTime}}</div></el-col>
                                <el-col :span="4" class="mingcheng"><div class="grid ">竞价开始时间</div></el-col>
                                <el-col :span="4"><div class="grid"><span style="font-size: small">{{pbObjecetInfo.bidStartTime}}</span></div></el-col>
                                <el-col :span="4" class="mingcheng"><div class="grid ">竞价结束时间</div></el-col>
                                <el-col :span="4"><div class="grid"><span style="font-size: small">{{pbObjecetInfo.bidEndTime}}</span></div></el-col>
                            </el-row>
                            <el-row type="flex" class="row-bg" justify="center">
                                <el-col :span="4" class="mingcheng"><div class="grid " >标的概况</div></el-col>
                                <el-col :span="22"><div class="grid">{{pbObjecetInfo.remark}}</div></el-col>
                            </el-row>
                        </div>
                    </div>


                </el-tab-pane>
                <el-tab-pane label="出让公告" name="second">出让公告</el-tab-pane>
                <el-tab-pane label="补充公告" name="third">补充公告</el-tab-pane>
                <el-tab-pane label="竞价规则" name="fourth">竞价规则</el-tab-pane>
                <el-tab-pane label="竞价历史" name="fifth">竞价历史</el-tab-pane>
            </el-tabs>
        </template>
</div>

</body>
<style>
    .RU{
        background: #F8F8F9;
        height: 30px;
        width: 350px;
        margin-top: 50px;
        margin-left:150px;
        text-align: center;
    }
    .RC{
        height: 150px;
        width: 500px;
        margin-left: 100px;
    }
    .RCU{
        margin: 10px 185px;
    }
    .RD table{
        font-size: small;
        margin-top: 20px;
        margin-left: 100px;
    }
    .RD table tr td{
        width: 200px;
    }
    .grid-content {
        border-radius: 4px;
        min-height: 36px;
        height: 450px;
    }
    .block{
        margin:50px auto;
    }
    .grid{
        height: 50px;
        line-height: 50px;
        border: 1px solid #82848a;
    }
    .mingcheng{
        text-align: center;
        background-color: #e8e8e8;
    }
    ul li {
        list-style: none;
        float: left;
        width: 30px;
        height: 40px;
        line-height: 40px;
        text-align: center;
        cursor: pointer;
        color: rgba(255,255,255,.8);
        font-size: 14px;
    }
    .banner {
        max-width: 1200px;
        margin: 0 auto;
        position: relative;
    }
    .banner img {
        width: 100%;
        display: block;
    }
    .banner .page {
        background: rgba(0,0,0,.5);
        position: absolute;
        right: 0;
        bottom: 0;
        width: 100%;
    }
    .banner .page ul {
        float: right;
    }

</style>

<script>
    new Vue({
        el: '#ListingLink',
        /*变量*/
        data () {
            return {
                activeName: 'first',
                dataList:[],
                currentIndex: 0,   //默认显示图片
                timer: null,//定时器
                linkShow:{},
                CountDown:"",//单倒计时
                pbObjecetInfo:[],
                num:'',
                chuJia:'',
                beiShu:''

            }
        },
        created(){
            var _this = this;
            _this.ShowObject(1)
        },
        //页面加载成功时完成
        mounted: function(){
            var _this = this;
            axios
                .post("/pb-item-info/ListingLinkShow/"+1)
                .then(function (res) {
                    _this.linkShow=res.data;
                    _this.Djs_time(res.data.bid_end_time);
                })

            axios
                .post("/pb-file-img-info/imgInfo/"+1)
                .then(function (res) {
                    _this.dataList=res.data;
                })

            axios
                .post("/pb-quote-info/yanshi/"+1)
                .then(function (res) {
                    _this.num=res.data;
                })

        },
        /*方法函数  事件等*/
        methods: {
            //点击出价
            baoJia(){

            },
            ShowObject:function(id){
                var _this = this;
                var pbItemInfo = new URLSearchParams();
                pbItemInfo.append('objectId',id);
                axios.post('/pb-object-info/ShowObject',pbItemInfo).then(res=>{
                    _this.pbObjecetInfo = res.data
                })
            },
            gotoPage(index) {
                this.currentIndex = index;
            },
            //定时器
            runInv() {
                this.timer = setInterval(() => {
                    this.gotoPage(this.nextIndex)
                }, 10)
            },
            Djs_time: function(row){
                var _this = this;
                setInterval(()=> {
                    var Deadline=new Date(row).getTime();
                    var presentTime=new Date().getTime();
                    var rightTime = Deadline - presentTime;
                    if (rightTime > 0) {
                        var dd = Math.floor(rightTime / 1000 / 60 / 60 / 24);
                        var hh = Math.floor((rightTime / 1000 / 60 / 60) % 24);
                        var mm = Math.floor((rightTime / 1000 / 60) % 60);
                        var ss = Math.floor((rightTime / 1000) % 60);
                        _this.CountDown= dd + "天" + hh + "时" + mm + "分" + ss+"秒"
                    }else{
                        _this.CountDown="已到截止申请时间"
                    }
                }, 1000);
            },

        },
        computed: {
            //上一张
            prevIndex() {
                if(this.currentIndex == 0) {
                    return this.dataList.length - 1;
                }else{
                    return this.currentIndex - 1;
                }
            },
            //下一张
            nextIndex() {
                if(this.currentIndex == this.dataList.length - 1) {
                    return 0;
                }else {
                    return this.currentIndex + 1;
                }
            }
        }

    });

</script>

</html>
