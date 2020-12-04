<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/2
  Time: 8:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>竞价规则</title>
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
<style>
    .img_head{
        width: 50px;
        height: 50px;
        border-radius: 45px;
        border: 1px solid #9d9d9d;
    }
    .block{
        border: 1px solid red;
    }
    .spanjingjia{
        color: #00B8EE;
    }
</style>
<body>
<div id="fuDiv">
    <img class="img_head" src="/static/images/p1.png"/>-------------------------
    <img class="img_head" src="/static/images/pm2.png"/>-------------------------
    <img class="img_head" src="/static/images/p3.png"/>-------------------------
    <img class="img_head" src="/static/images/p4.png"/>
    <div class="block" style="width: 900px">
        <h1 style="text-align: center"><strong>台州市行政事业单位产权交易项目网络竞价实施细则</strong></h1>
        <span class="spanjingjia">1、竞拍流程：</span>
    注册会员—缴纳保证金（1000元人民币以上）→拍卖资格认证→参与竞拍→竞拍成功后收到结账单两日内付款→等待运输→领鸽（须自行至附近机场或车站取鸽）。
        <br>
        <span class="spanjingjia">2、特别提示：</span>
    鸽友想参与竞拍，需先行缴纳拍卖保证金。保证金额度至少1000元人民币（特殊场次除外），1000元人民币可拍合计标的为1000欧元以下的鸽子，2000元人民币可拍合计标的为2000欧元以下的鸽子...10000元人民币可拍合计标的为10000欧元以下的鸽子，以此类推。建议鸽友若想竞拍多羽信鸽，最好提前加足保金额度，以免拍卖过程中由此带来不便，与爱鸽失之交臂！
    结标后，若拍卖成功，保证金可以作为鸽款冲抵使用；若拍卖未成功，您可以申请退保，我们将在两个工作日内为您退回至指定账户；无论拍卖成功与否，会员都可以将保证金继续留在账户内，以保证日后仍可继续参与拍卖。
    大陆国际运费220欧元/羽（欧洲到中国）；大陆国内运费200人民币/羽（北京自提鸽友无此费用）；台湾地区运费默认为132欧元/羽，以上费用已含国际运费+报关费+装笼+隔离等费用，运费由买家支付。
    中国大陆成交拍卖鸽将征收拍卖成交款的21%作为进口关税/增值税，以上费用由竞拍人承担，欧洲信鸽站代为办理缴纳，如中国大陆鸽友参与竞标即视同接受本条款。
    由于欧元在国内不予许流通，EPW将根据结算账单时的中国银行人民币兑换欧元汇率牌价（由于系统默认的四舍五入换算机制，误差将不超过0.1）进行人民币的折算。
    中标鸽友将于两个工作日内收到本站发出的短信账单，或用户直接进入会员中心查看“成功的拍卖”；若未中标您可申请退保，保证金于2个工作日内退还。
    竞拍者支付保证金后，请务必来电确认，并留下真实姓名、联系电话及地址以核实身份，方可通过拍卖资格认证。
    需代理出价的竞拍者缴付保证金后，须一律以EMAIL，电话，QQ，手机短讯方式把拍卖鸽环号及心理价位告知本站。
    鸽友所竞得的拍卖鸽如出现无法作育的情况，请于收鸽之日起2个月内与我们取得联系，逾期将无法做出任何形式的补偿。
        <br>
        <span class="spanjingjia">3、拍卖加价规则：</span>
    <100欧元：每标加价幅度为10欧元；
    100-500欧元：每标加价幅度为25欧元；
    500-1000欧元：每标加价幅度为50欧元；
    >1000欧元：每标加价幅度为100欧元；
    >5000欧元：每标加价幅度为250欧元；
    >10000欧元：每标加价幅度为500欧元。
        <br>
        <span class="spanjingjia">4、拍卖延时规定：</span>
    拍卖期限到期之后的最高出价为成交价格。在拍卖截止时间前8分钟内如有人竞拍，则截止时间按此次竞拍的时间再顺延8分钟，依次类推。
        <br>
        <span class="spanjingjia">5、付 款：</span>
    买家须于收到结账单日期起算2日内付清全款，否则视同弃权，保证金全额没收并在网站黑名单公示。
    可支付当地货币（中国鸽友付人民币，台湾鸽友付台币，香港鸽友付港币）至指定账户。
    欧元汇率以结账日当天银行卖出欧元现汇率计算。
        <br>
        <span class="spanjingjia">6、运 输：</span>
    具体运输日期由国际运输公司统一安排（具体时间等候国家运输通知），无法保证按买家要求安排运输时间，对拍卖鸽到抵日期有特殊要求的鸽友请先行致电本站再行下标。
    国际运费：A运往台湾：默认运费为132欧元/羽（大箱混装）；可选运费为162欧元/羽（1-2羽小箱装/需于得标后洽台湾地区联系人确认），以上费用均含国际运费+报关费+装笼+隔离等费用，须自行至附近机场（或车站）取鸽。B运往中国：国际运费220欧元/羽（含国际运费+报关费+装笼费）；国内运费200人民币/羽（北京自提鸽友无国内运输费用）。
        <br>
        <span class="spanjingjia">7、注意事項</span>
    鸽子为活物， 不适用一般货运保险公司承保范围。
    幼鸽性别仅供参考， 无法100%确定。
    鸽子于国际运输过程中死亡或到达后开笼时已死亡者，需立即提供相关照片，并于24小时内寄回原脚环和正本血统表及脚环卡，EPW将负责与拍卖方鸽舍协调及补偿相同血统/质量相当的鸽子，相关进口关税/增值税及国际/本地运费由拍卖竞标方支付。鸽子抵达时若发现严重生病状况者, 须立即与EPW取得联系，以准备日后可能发生的补偿事宜。
    未及时报备病况或未立即通知死亡状况者， 我们无法做任何补偿保证。
    若因相关因素鸽子抵达死亡或证实不育者，而鸽舍无法补鸽且同意退还鸽款时，已发生之相关税费及国际/本地运费无法退回。
    欧洲源鸽国际运输有其风险，购买者须有此心理准备。无法接受此风险者，建议于国内询鸽购买。
    鸽友所竞得的拍卖鸽如出现无法作育的情况，请于收鸽之日起2个月内与我们取得联系，逾期将无法做出任何形式的补偿。
    中文翻译若有出入，以血统书原文为准。
    如遇特殊情况,欧洲信鸽站网站可酌情延迟拍卖时间或做出适当调整.
    下标即视同接受以上条件，不得异议。
    </div>
    <input type="button" value="上一步" @click="shangyibu()">
    <input type="button" value="下一步" @click="xiayibu()">
</div>
</body>
<script>
    new Vue({
        el: '#fuDiv',
        /*变量*/
        data(){
            return{
                objectId:${param.objectId}
            }
        },
        //页面加载之前调用
        created(){
        },
        /*方法函数  事件等*/
        methods: {
            xiayibu:function () {
                window.location.href=("/jsps/index_jiaona.jsp?objectId="+this.objectId)
            },
            shangyibu:function () {
                window.location.href=("/jsps/index_biao.jsp?objectId="+this.objectId)
            }
        }
    })
</script>
</html>
