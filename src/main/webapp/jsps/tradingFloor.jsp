
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>台州市公共资源交易网</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user-defined/public.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user-defined/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user-defined/main.css">
    <%--<script type="text/javascript" src="/tzcms/r/cms/www/red/tz4/js/jquery-1.11.3.js"></script>--%>
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user-defined/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user-defined/bannerList.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user-defined/main.js"></script>
</head>
<body>
<!-- 头部导航start -->
<div class="header">
    <div class=" content nav clearfix">
        <span class="fl"><a href="/tzcms" style="color:#fff;" target="_blank"  rel="noopener noreferrer">台州市公共资源交易网</a></span>
        <ul class="fl clearfix">
            <li><a class="hover" href="/tzcms" target="_self"  rel="noopener noreferrer">首页</a></li>
            <li><a href="/jsps/jiaoyidating.jsp" target="_self"  rel="noopener noreferrer">交易信息</a></li>
            <li><a href="/tzcms/fwzn/index.htm" target="_self"  rel="noopener noreferrer">服务指南</a></li>
            <li><a href="/tzcms/sczx/index.htm" target="_self"  rel="noopener noreferrer">市场资信</a></li>
            <li><a href="/tzcms/zwgk/index.htm" target="_self"  rel="noopener noreferrer">政务公开</a></li>
        </ul>
        <div class="search fr">
            <!--<input type="text" id="seachName" name="" value="">-->
            <input type="button" onclick="search()"  name="">
            <span class="img">客户端<img  src="${pageContext.request.contextPath}/static/images/wx.png" alt=""></span>

        </div>
    </div>
</div>
<!-- 头部导航end -->
<!-- banner start -->
<div class="banner">
    <div>
        <img id="img" src="${pageContext.request.contextPath}/static/images/header.png">
        <!--  <a class="login-loact" href="http://taz.zjzwfw.gov.cn/" target="_blank"  rel="noopener noreferrer"><img  src="/tzcms/r/cms/www/red/tz4/img/logo.png"></a>
                        <a class="login1-loact" href="http://www.zjtz.gov.cn/" target="_blank"  rel="noopener noreferrer"><img  src="/tzcms/r/cms/www/red/tz4/img/logo2.png"></a>-->


        <div class="content">
            <div class="time">
                <span id="time"></span><br>
                <span id="day"></span>
            </div>
        </div>
    </div>
</div>
<!-- banner end -->
<!-- 内容 start -->
<div class="content-box content clearfix ">
    <div class="fl bannerList">
        <ul>
            <!-- 图片新闻 begin-->
            <li>
                <a href="/tzcms/tpxw/216794.htm" target="_blank"  rel="noopener noreferrer">
                    <img src="${pageContext.request.contextPath}/static/images/3015305764jx.jpg" alt=""></a>
                <a class="text" href="/tzcms/tpxw/216794.htm" target="_blank"  rel="noopener noreferrer"><span>市委常委、副市长芮宏一行莅临中心调研指导</span></a>
            </li>
            <li>
                <a href="http://www.tzztb.com/tzcms/zxdt/214107.htm" target="_blank"  rel="noopener noreferrer">
                    <img src="${pageContext.request.contextPath}/static/images/20145415xk5g.jpg" alt=""></a>
                <a class="text" href="http://www.tzztb.com/tzcms/zxdt/214107.htm" target="_blank"  rel="noopener noreferrer"><span>2019年全市公共资源交易工作会议昨日召开</span></a>
            </li>
            <li>
                <a href="http://www.tzztb.com/tzcms/zxdt/204887.htm" target="_blank"  rel="noopener noreferrer">
                    <img src="${pageContext.request.contextPath}/static/images/20145542iv5t.jpg" alt=""></a>
                <a class="text" href="http://www.tzztb.com/tzcms/zxdt/204887.htm" target="_blank"  rel="noopener noreferrer"><span>浙江省首个公共资源交易领域大数据应用服务平台通过初步验收</span></a>
            </li>
            <li>
                <a href="http://www.tzztb.com/tzcms/zxdt/200234.htm" target="_blank"  rel="noopener noreferrer">
                    <img src="${pageContext.request.contextPath}/static/images/20145614s8zh.jpg" alt=""></a>
                <a class="text" href="http://www.tzztb.com/tzcms/zxdt/200234.htm" target="_blank"  rel="noopener noreferrer"><span>我市召开公共资源交易政务公开及全流程信息推送两个地方标准培训推进会</span></a>
            </li>
            <!-- 图片新闻 end-->
        </ul>
        <div class="img-btn-list"></div>
    </div>
    <div class="fl content-list">

        <p class="clearfix">
            <span class="show" style="border-radius: 5px 0 0 0 ;">中心动态</span>
            <span>县市信息</span>
            <span>行业快讯</span>
            <a class="show" href="/tzcms/ynzx/index.htm" target="_blank"  rel="noopener noreferrer"></a>
            <a href="/tzcms/ynzx/index.htm" target="_blank"  rel="noopener noreferrer"></a>
            <a href="/tzcms/ynzx/index.htm" target="_blank"  rel="noopener noreferrer"></a>
        </p>
        <ul>
            <li class="show">

                <ul>
                    <li class="clearfix first-list">
                        <h6>减负降本不停步，便企惠企再深化</h6>
                        <p>减负降本不停步，便企惠企再深化</p>
                        <a class="link" href="/tzcms/zxdt/281090.htm" target="_blank"  rel="noopener noreferrer">【详情】</a></li>
                    <li class="clearfix"><a href="/tzcms/zxdt/220467.htm" target="_blank"  rel="noopener noreferrer">台州市本级预算单位政府采购业务培训会顺利举办</a>
                        <span>2019-05-24</span></li>
                    <li class="clearfix"><a href="/tzcms/zxdt/218572.htm" target="_blank"  rel="noopener noreferrer">我市召开招标投标领域违法行为专项治理工作会议</a>
                        <span>2019-04-23</span></li>
                    <li class="clearfix"><a href="/tzcms/zxdt/217268.htm" target="_blank"  rel="noopener noreferrer">我省召开三级视频会议部署招投标领域 违法行为专项治理工作</a>
                        <span>2019-04-15</span></li>
                    <li class="clearfix"><a href="/tzcms/zxdt/216821.htm" target="_blank"  rel="noopener noreferrer">市委常委、副市长芮宏一行莅临中心调研指导</a>
                        <span>2019-03-21</span></li>
                    <li class="clearfix"><a href="/tzcms/zxdt/215654.htm" target="_blank"  rel="noopener noreferrer">台州市以数字化转型打造最优公共资源交易营商环境</a>
                        <span>2019-03-12</span></li>
                    <li class="clearfix"><a href="/tzcms/zxdt/215653.htm" target="_blank"  rel="noopener noreferrer">4月1日起我市实行电子招标文件零收费</a>
                        <span>2019-03-12</span></li>
                    <li class="clearfix"><a href="/tzcms/zxdt/215548.htm" target="_blank"  rel="noopener noreferrer">台州市召开2019年全市公共资源交易管理工作座谈会</a>
                        <span>2019-03-01</span></li>
                    <li class="clearfix"><a href="/tzcms/zxdt/214107.htm" target="_blank"  rel="noopener noreferrer">2019年全市公共资源交易工作会议昨日召开</a>
                        <span>2019-02-22</span></li>
                    <li class="clearfix"><a href="/tzcms/zxdt/214100.htm" target="_blank"  rel="noopener noreferrer">政府采购为企业减负降本送上开年红利</a>
                        <span>2019-02-21</span></li>
                </ul>
            </li>
            <li>

                <ul>
                    <li class="clearfix first-list">
                        <h6>天台县主动减免国有公房承租人3个月租金助力企业共克时艰</h6>
                        <p>天台县主动减免国有公房承租人3个月租金助力企业共克时艰</p>
                        <a class="link" href="/tzcms/xsxx/245676.htm" target="_blank"  rel="noopener noreferrer">【详情】</a></li>
                    <li class="clearfix"><a href="/tzcms/xsxx/245175.htm" target="_blank"  rel="noopener noreferrer">视频直播“云开标” 项目开启“绿色通道”</a>
                        <span>2020-03-04</span></li>
                    <li class="clearfix"><a href="/tzcms/xsxx/248174.htm" target="_blank"  rel="noopener noreferrer">临海“云开标”让公共资源交易“不断档”</a>
                        <span>2020-03-04</span></li>
                    <li class="clearfix"><a href="/tzcms/xsxx/188275.htm" target="_blank"  rel="noopener noreferrer">温岭市工程建设项目全流程电子招投标 平台正式运行</a>
                        <span>2018-04-10</span></li>
                    <li class="clearfix"><a href="/tzcms/xsxx/188276.htm" target="_blank"  rel="noopener noreferrer">仙居落实制度   严字当头 及时勒住评标专家缺席缰绳</a>
                        <span>2018-03-27</span></li>
                    <li class="clearfix"><a href="/tzcms/xsxx/188273.htm" target="_blank"  rel="noopener noreferrer">仙居践行“妈妈式服务”理念 打造优质招投标服务平台</a>
                        <span>2018-03-01</span></li>
                    <li class="clearfix"><a href="/tzcms/xsxx/188272.htm" target="_blank"  rel="noopener noreferrer">临海市公共资源交易中心简化办事流程 助力“最多跑一次”</a>
                        <span>2018-02-20</span></li>
                    <li class="clearfix"><a href="/tzcms/xsxx/188274.htm" target="_blank"  rel="noopener noreferrer">临海市政府采购首次实行电子开评标</a>
                        <span>2018-01-22</span></li>
                    <li class="clearfix"><a href="/tzcms/xsxx/170720.htm" target="_blank"  rel="noopener noreferrer">玉环市首宗国有产权项目成功挂牌 实现产权交易业务“最多跑一次”</a>
                        <span>2017-12-18</span></li>
                    <li class="clearfix"><a href="/tzcms/xsxx/170722.htm" target="_blank"  rel="noopener noreferrer">玉环市网上保证金缴退系统顺利上线</a>
                        <span>2017-12-04</span></li>
                </ul>
            </li>
            <li>

                <ul>
                    <li class="clearfix first-list">
                        <h6>河南公共资源交易数字证书实现全省互认</h6>
                        <p>河南公共资源交易数字证书实现全省互认</p>
                        <a class="link" href="/tzcms/hykx/270631.htm" target="_blank"  rel="noopener noreferrer">【详情】</a></li>
                    <li class="clearfix"><a href="/tzcms/hykx/270632.htm" target="_blank"  rel="noopener noreferrer">河南公共资源交易数字证书实现兼容互认和大幅降费</a>
                        <span>2020-07-09</span></li>
                    <li class="clearfix"><a href="/tzcms/hykx/252569.htm" target="_blank"  rel="noopener noreferrer">合肥公共资源交易试行“见证服务”</a>
                        <span>2020-05-11</span></li>
                    <li class="clearfix"><a href="/tzcms/hykx/252755.htm" target="_blank"  rel="noopener noreferrer">济南市发展改革委等8部门联合印发《济南市公共资源交易重点项目绿色通道实施办法》</a>
                        <span>2020-05-01</span></li>
                    <li class="clearfix"><a href="/tzcms/hykx/252763.htm" target="_blank"  rel="noopener noreferrer">“区块链+交易”首试告捷，广州“易链通”智慧交易平台成功搭建</a>
                        <span>2020-04-25</span></li>
                    <li class="clearfix"><a href="/tzcms/hykx/248236.htm" target="_blank"  rel="noopener noreferrer">汇聚智慧、凝聚共识，加快推进《招标投标法》修订</a>
                        <span>2020-04-06</span></li>
                    <li class="clearfix"><a href="/tzcms/hykx/248239.htm" target="_blank"  rel="noopener noreferrer">合肥出台《公共资源交易管理条例实施细则》</a>
                        <span>2020-04-05</span></li>
                    <li class="clearfix"><a href="/tzcms/hykx/248237.htm" target="_blank"  rel="noopener noreferrer">全国首部！《台州市企业信用促进条例》出台</a>
                        <span>2020-04-04</span></li>
                    <li class="clearfix"><a href="/tzcms/hykx/245142.htm" target="_blank"  rel="noopener noreferrer">郑州：真正实现投标供应商“零次跑”</a>
                        <span>2020-03-04</span></li>
                    <li class="clearfix"><a href="/tzcms/hykx/245174.htm" target="_blank"  rel="noopener noreferrer">南京：加快推进交易大数据可视化平台建设</a>
                        <span>2020-02-26</span></li>
                </ul>
            </li>

        </ul>

    </div>
    <div class="fr content-list">

        <p class="clearfix">
            <span class="show" style="border-radius: 5px 0 0 0;">通知公告</span>
            <a class="show" href="/tzcms/tzgg/index.htm" target="_blank"  rel="noopener noreferrer"></a>
        </p>
        <ul>
            <li class="show">
                <ul>
                    <li class="clearfix first-list">
                        <h6>关于开展对台州市公共资源交易中心网站进行安全加固工作的通知</h6>
                        <p>关于开展对台州市公共资源交易中心网站进行安全加固工作的通知</p>
                        <a class="link" href="/tzcms/tzgg/279656.htm" target="_blank"  rel="noopener noreferrer">【详情】</a></li>
                    <li class="clearfix"><a href="/tzcms/tzgg/279326.htm" target="_blank"  rel="noopener noreferrer">关于开展不见面开评标应用系统测试及使用培训的通知</a>
                        <span>2020-11-18</span></li>
                    <li class="clearfix"><a href="/tzcms/tzgg/278970.htm" target="_blank"  rel="noopener noreferrer">关于继续开展台州市公共资源交易中心网站及交易系统维护的通知</a>
                        <span>2020-11-13</span></li>
                    <li class="clearfix"><a href="/tzcms/tzgg/277725.htm" target="_blank"  rel="noopener noreferrer">关于开展台州市公共资源交易中心网站及交易系统维护的通知</a>
                        <span>2020-11-06</span></li>
                    <li class="clearfix"><a href="/tzcms/tzgg/277720.htm" target="_blank"  rel="noopener noreferrer">关于市公共资源统一交易主体库和CA互认系统正式上线运行的通知</a>
                        <span>2020-11-06</span></li>
                    <li class="clearfix"><a href="/tzcms/tzgg/276688.htm" target="_blank"  rel="noopener noreferrer">关于举办建设工程招标投标管理实务培训班的预备通知</a>
                        <span>2020-11-02</span></li>
                    <li class="clearfix"><a href="/tzcms/tzgg/275394.htm" target="_blank"  rel="noopener noreferrer">关于开展台州市公共资源交易中心网站及交易系统维护的通知</a>
                        <span>2020-10-24</span></li>
                    <li class="clearfix"><a href="/tzcms/tzgg/274474.htm" target="_blank"  rel="noopener noreferrer">关于台州市市本级政采云平台电子卖场价格和商品属性监测违规处理情况(2020年7-9月)的通报</a>
                        <span>2020-10-16</span></li>
                    <li class="clearfix"><a href="/tzcms/tzgg/272645.htm" target="_blank"  rel="noopener noreferrer">台州市公共资源交易中心关于办公时间调整的通知</a>
                        <span>2020-09-30</span></li>
                    <li class="clearfix"><a href="/tzcms/tzgg/262618.htm" target="_blank"  rel="noopener noreferrer">关于台州市市本级政采云平台电子卖场价格和商品属性监测违规处理情况(2020年4-6月)的通报</a>
                        <span>2020-07-22</span></li>

                </ul>
            </li>
        </ul>
    </div>
</div>
<div class="small-banner">
    <ul class="content clearfix">
        <li class="first">今日交易</li>
        <li>
            <a href="/tzcms/ttrading/index.htm">
                <span>受理</span><br>
                <span>
					<b id="data1"></b>件
				</span>
            </a>
        </li>
        <li>
            <a href="/tzcms/ttrading/index.htm">

                <span>公告</span><br>
                <span>
					<b id="data2"></b>件
				</span>
            </a>
        </li>

        <li>
            <a href="/tzcms/ttrading/index.htm">

                <span>开标</span><br>
                <span>
					<b id="data4"></b>件
				</span>
            </a>
        </li>
        <li>
            <a href="/tzcms/ttrading/index.htm">

                <span>竞价</span><br>
                <span>
					<b id="data5"></b>件
				</span>
            </a>
        </li>
        <li>
            <a href="/tzcms/ttrading/index.htm">

                <span>成交</span><br>
                <span>
					<b id="data3"></b>件
				</span>
            </a>
        </li>

        <li>
            <a href="/tzcms/ttrading/index.htm">

                <span>归档</span><br>
                <span>
					<b id="data6"></b>件
				</span>
            </a>
        </li>
    </ul>
</div>
<div class="title-img content">
    <img class="" src="${pageContext.request.contextPath}/static/images/title.png">
    <ul class="clearfix">
        <li class="first">
            <a href="http://www.tzztb.com/enterprise_ty/registerController/index.do" target="_blank"  rel="noopener noreferrer">主体库注册</a>
        </li>
        <li>
            <a  href="/tzcms/szzsrz/index.htm" style="background-position-y:-84px; " target="_blank"  rel="noopener noreferrer">数字证书认证</a>
        </li>
        <li>
            <a href="http://www.tzztb.com/auth/toLogin.do" style="background-position-y:-190px; " target="_blank"  rel="noopener noreferrer">交易平台登录</a>
        </li>
        <li class="theBidOpeningHall">
            <a href="http://kb.tzztb.com/auth/login/login.do" target="_blank"  rel="noopener noreferrer">不见面开标大厅</a>
        </li>
        <li>
            <a href="http://www.tzztb.com/auth/toLogin.do" style="background-position-y:-293px; " target="_blank"  rel="noopener noreferrer">行政监督平台</a>
        </li>
        <li>
            <a href="http://www.tzztb.com:8080/bidhall/page/pageJump.do" style="background-position-y:-398px; " target="_blank"  rel="noopener noreferrer">产权竞价</a>
        </li>
        <li>
            <a href="https://www.zcygov.cn/" target="_blank" style="background-position-y:-540px; " rel="noopener noreferrer">政采商城</a>
        </li>
        <li style="margin-right: 0;">
            <a href="http://land.zjgtjy.cn/GTJY_ZJ/" target="_blank" style="background-position-y:-679px; "  rel="noopener noreferrer">土地交易</a>
        </li>


    </ul>
</div>
<div class="banner-small-banner1 clearfix content mb">
    <a class="fl sh" href="/tzcms/shce/index.htm"></a>
    <a class="fl zj" target="_blank"  href="http://taz.zjzwfw.gov.cn/" style="margin:0 0px 0px 12px;"></a>
    <a class="fr tz" target="_blank" href="http://www.zjtz.gov.cn/"></a>
</div>

<div class="content project clearfix">
    <div class="fl">
        <div class="cover">
            <span class="line"></span>
            <div class=" clearfix">
                <img class="fl mt" src="${pageContext.request.contextPath}/static/images/kou3.png">
                <img class="fr" src="${pageContext.request.contextPath}/static/img/kou.png">
            </div>
            <ul class="clearfix">
                <li class="first">
                    <a href="/tzcms/gcjyzhaobgg/index.htm" target="_blank"  rel="noopener noreferrer">工程建设</a>
                </li>
                <li>
                    <a  href="/tzcms/zfcg/index.htm" style="background-position-y:-84px; " target="_blank"  rel="noopener noreferrer">政府采购</a>
                </li>
                <li>
                    <a href="/tzcms/cqjy/index.htm" style="background-position-y:-288px;" target="_blank"  rel="noopener noreferrer">产权交易</a>
                </li>
                <li>
                    <a href="/tzcms/tzzy/index.htm" style="background-position-y:-397px; " target="_blank"  rel="noopener noreferrer">拓展资源</a>
                </li>
                <li>
                    <a href="/tzcms/tdjy/index.htm" style="background-position-y:-179px; " target="_blank"  rel="noopener noreferrer">土地交易</a>
                </li>
            </ul>
        </div>
        <div class="cover cover1">
            <span class="line"></span>
            <div class=" clearfix">
                <img class="fl mt" src="${pageContext.request.contextPath}/static/images/kou4.png">
                <img class="fr" src="${pageContext.request.contextPath}/static/images/kou1.png">
            </div>
            <div class="step"><a href="/tzcms/xmjd/index.htm" target="_blank"  rel="noopener noreferrer"></a></div>
            <p><a href="/tzcms/xmjd/index.htm" target="_blank"  rel="noopener noreferrer">查询项目进度</a></p>
        </div>
    </div>
    <div class="fr login">
        <div class="bannerList1">
            <ul>
                <!-- 图片新闻 begin-->
                <li>
                    <a href="/tzcms/zxjspictures/218802.htm" target="_blank"  rel="noopener noreferrer">
                        <img src="${pageContext.request.contextPath}/static/images/26204122bvse.jpg" alt=""></a>
                    <a class="text" href="/tzcms/zxjspictures/218802.htm" target="_blank"  rel="noopener noreferrer"><span>休息等待区</span></a>
                </li>
                <li>
                    <a href="/tzcms/zxjspictures/218801.htm" target="_blank"  rel="noopener noreferrer">
                        <img src="${pageContext.request.contextPath}/static/images/26203726plw1.jpg" alt=""></a>
                    <a class="text" href="/tzcms/zxjspictures/218801.htm" target="_blank"  rel="noopener noreferrer"><span>开标现场</span></a>
                </li>
                <!-- 图片新闻 end-->
            </ul>
            <div class="img-btn-list1"></div>
        </div>
        <ul>
            <li>
                <a href="/tzcms/guestbook.jspx" target="_blank"  rel="noopener noreferrer">我要咨询</a>
            </li>
            <li>
                <a href="/tzcms/wyzxjybz/index.htm?q=1" style="background-position-y:-38px; " target="_blank"  rel="noopener noreferrer">我有建议</a>
            </li>
            <li>
                <a href="/tzcms/fwzn/index.htm" style="background-position-y:-75px; "  target="_blank"  rel="noopener noreferrer">我要帮助</a>
            </li>
        </ul>
        <ol class="clearfix">
            <li class="fl">
                <a href="/tzcms/sczx/index.htm" target="_blank"  rel="noopener noreferrer">信用查询</a>
            </li>
            <li class="fr">
                <a href="/tzcms/tzryzz/216421.htm" style="background-position-y: -289px;" target="_blank"  rel="noopener noreferrer">中心职能</a>
            </li>
        </ol>
    </div>
</div>
<!-- 内容end -->
<!-- 底部 start -->
<div class="fotter">
    <p>主办单位：台州市公共资源交易中心&nbsp;&nbsp;<a href="http://beian.miit.gov.cn" style="color:#fff;">备案序号：浙ICP备06052938号</a>&nbsp;&nbsp;邮编：318000</p>
    <p style="position:relative;">地址：浙江省台州市市府大道777号民泰商业银行3-7楼&nbsp;&nbsp;技术支持：杭州擎洲软件有限公司&nbsp;&nbsp;浏览次数：<b><span id="site_selfid"></span></b><a style="position:absolute;top:-28px;" href="http://bszs.conac.cn/sitename?method=show&id=4888D5C3ECEA4A0DE053012819ACABF5" target=_blank><img src="${pageContext.request.contextPath}/static/images/blue.png"></a></p>
    <p class="emblem"><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33100202000161" target=_blank><img src="${pageContext.request.contextPath}/static/images/ico5.png"></a>浙公网安备&nbsp;&nbsp;33100202000161号</p>
</div>
<!-- 底部 end-->
<script src="${pageContext.request.contextPath}/static/user_defined/front.js" type="text/javascript"></script>
<script  type="text/javascript">
    $(function(){
        Cms.siteFlow("/tzcms", location.href, document.referrer,"site_selfid");
    });
</script>


<div class="adText adBlue" id="floatOne" style="position: absolute; left: 240px; top: 66px;display:none;" >
    <div class="adClose" align="right" style="position:absolute; right:10px; top:10px;">
        <a href="javascript:void(0);" style="float: right;color:#fff;"
           onclick="javascript:document.getElementById('floatOne').style.display='block';"
           title="点击关闭漂浮图片">关闭</a>
    </div>

    <!--链接地址-->
    <script type="text/javascript" src="/tzcms/ad.jspx?id=250"></script>
</div>
</body>
<script>
    //window.onload = function(){

    // var img = document.querySelector('#img');
    // var newImg = new Image();
    // var newImg1 = new Image();
    // newImg.src ="/tzcms/r/cms/www/red/tz4/img/header1.gif ";
    //  newImg1.src ="/tzcms/r/cms/www/red/tz4/img/header.png";


    // newImg.onload =function(){ // 图片加载成功后把地址给原来的img
    // img.src=newImg.src ;
    //setTimeout(function(){
    // img.src=newImg1.src ;

    //},10000)

    // }

    //}


    $(function(){
        initData();
    });

    //加载初始化数据
    function initData(){
        $.ajax({
            type:'get',
            url:"/tzprpinter/com/qzhprp/im/enterquery/act/ImEnterpriseAct/getDayTrade.act",
            dataType : "json",//数据类型为jsonp
            // jsonp: "jsonpCallback",//服务端用于接收callback调用的function名的参数

            success:function(data){
//判断是否有，
                if(data.indexOf(",") >= 0 ) {

                    var result=data.split(",");
                    for(var i=0;i<result.length-1;i++){
                        if(i+1 == 4 || i+1 == 5){
                            continue;
                        }
                        document.getElementById("data"+(i+1)).innerHTML = result[i];
                        // 开标手动录入
                        //document.getElementById("data4").innerHTML = '1';
                        if(result[i] == 0){
                            $("#data"+(i+1)).parent('span').parent('a').attr('href','javascript:;').css('cursor','default');
                        }else{
                            var link1= '/tzcms/ttrading/index.htm?type='+i;
                            $("#data"+(i+1)).parent('span').parent('a').attr('href',link1);

                        };

                    };
                    //$("#data4").parent('span').parent('a').attr('href','javascript:;').css('cursor','default');

                } ;
            },
            error:function(){
                alert("获取今日交易数据连接失败");
            }
        });

        $.ajax({
            type:'get',
            url:"/site/SiteExternal/getOpenBidOrBiddingCount.do?type=1",
            dataType : "json",
            success:function(data){
                if(data.success) {
                    var result=data.result;
                    document.getElementById("data4").innerHTML = result;
                    if(result == 0){
                        $("#data4").parent('span').parent('a').attr('href','javascript:;').css('cursor','default');
                    }else{
                        var link1= '/tzcms/ttrading/index.htm?type='+3;
                        $("#data4").parent('span').parent('a').attr('href',link1);
                    };
                } ;
            },
            error:function(){
                alert("获取今日交易数据连接失败");
            }
        });
        $.ajax({
            type:'get',
            url:"/site/SiteExternal/getOpenBidOrBiddingCount.do?type=2",
            dataType : "json",
            success:function(data){
                if(data.success) {
                    var result=data.result;
                    document.getElementById("data5").innerHTML = result;
                    if(result == 0){
                        $("#data5").parent('span').parent('a').attr('href','javascript:;').css('cursor','default');
                    }else{
                        var link1= '/tzcms/ttrading/index.htm?type='+4;
                        $("#data5").parent('span').parent('a').attr('href',link1);
                    };
                } ;
            },
            error:function(){
                alert("获取今日交易数据连接失败");
            }
        });
    }

    function search(){
        window.location.href = "/tzcms/sr.jspx?q=";
    }
    var imgWidth = '';
    var imgWidth1 = '';
    var windowWidth = $(window).width();
    if(windowWidth < 1900){
        imgWidth = 380;
        imgWidth1 = 305;
    }
    if(windowWidth >= 1900){
        imgWidth = 600;
        imgWidth1 = 430;
    }
    bannerListFn(
        $(".bannerList"), //banner最大容器
        $(".img-btn-list"),//banner======>按钮父容器
        6000,//banner滚动时间
        true,  //是否需要自动轮播需要
        imgWidth //图片宽度
    );
    bannerListFn(
        $(".bannerList1"), //banner最大容器
        $(".img-btn-list1"),//banner======>按钮父容器
        6000,//banner滚动时间
        true,  //是否需要自动轮播需要
        imgWidth1 //图片宽度
    );
</script>
<script type="text/javascript">
    var step = 1;
    var delay = 10;
    var x = document.documentElement.clientWidth / 2;
    var y = document.documentElement.clientHeight / 2;
    var xin = true, yin = true;
    var obj = document.getElementById("floatOne");
    function floatImg() {
        var rt = document.documentElement.clientWidth - obj.offsetWidth;
        var bt = document.documentElement.clientHeight - obj.offsetHeight;
        obj.style.left = x + document.documentElement.scrollLeft + 'px';
        obj.style.top = y + document.documentElement.scrollTop + 'px';
        x = x + step * (xin ? 1 : -1);
        if (x < 0) { xin = true; x = 0; }
        if (x > rt) { xin = false; x = rt; }
        y = y + step * (yin ? 1 : -1);
        if (y < 0) { yin = true; y = 0; }
        if (y > bt) { yin = false; y = bt; }
    }
    // var itl = setInterval(floatImg, delay);
    //obj.onmouseover = function() { clearInterval(itl); }
    //obj.onmouseout = function() { itl = setInterval(floatImg, delay); }

    var x2 = 650, y2 = 60;
    var xin2 = true, yin2 = true;
    var obj2 = document.getElementById("floatTwo");
    function floatImg2() {
        var rt = document.documentElement.clientWidth - obj2.offsetWidth;
        var bt = document.documentElement.clientHeight - obj2.offsetHeight;
        obj2.style.left = x2 + document.documentElement.scrollLeft + 'px';
        obj2.style.top = y2 + document.documentElement.scrollTop + 'px';
        x2 = x2 + step * (xin2 ? 1 : -1);
        if (x2 < 0) { xin2 = true; x2 = 0;}
        if (x2 > rt) { xin2 = false; x2 = rt; }
        y2 = y2 + step * (yin2 ? 1 : -1);
        if (y2 < 0) { yin2 = true; y2 = 0; }
        if (y2 > bt) { yin2 = false; y2 = bt; }
    }
    if(obj2 !== null){
// var itl1 = setInterval(floatImg2, delay);
// obj2.onmouseover = function() { clearInterval(itl1); }
// obj2.onmouseout = function() { itl1 = setInterval(floatImg2, delay); }
    }
</script>
</html>

