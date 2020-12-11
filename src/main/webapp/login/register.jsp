
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册选择</title>
</head>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<!-- 引入样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
<!-- 引入组件库 -->
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/static/element/index.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>

<body  style="background-size:1920px 1080px ;background-image:url(${pageContext.request.contextPath}/static/images/2.jpg);">
<%--<body  style="background-size:1920px 1080px ;background-color: #599DCA">--%>
<div id="abc">
    <template>
        <div id="login">
            <div class="loginToHome" style="background: rgba(0, 0, 0, 0.1)">
                <span style="text-align: center;font-size: 30px;color:#00B8EE;">------选择注册类型------</span>
                <div style="margin-top: 50px">
                    <div @click="BiddersRegister"  @mouseenter="enters" @mouseleave="leaves" style="margin-left: 300px ;
                    width: 240px;height: 185px;opacity: 1;background-color: #FFFFFF ;float:left" :style="colors">
                        <div style="text-align: center;margin-top: 50px">
                            <span style="font-size: 20px;color:#00B8EE;">竞买人注册</span>
                        </div>
                    </div>
                    <div  @click="consignorRegister"  @mouseenter="enter" @mouseleave="leave" style="margin-left: 30px ;
                    width: 240px;height: 185px ;opacity: 1;background-color: #FFFFFF  ;float:left" :style="colord">
                        <div style="text-align: center;margin-top: 50px">
                            <span style="font-size: 20px;color:#00B8EE;">委托人注册</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </template>
</div>

</body>


<script>
    new Vue({
        el: '#abc',
        /*变量*/
        data () {
            return {
                name:'hello word',
                colord:'background-color:#FFFFFF',
                colors:'background-color:#FFFFFF'
            }
        },
        //页面加载成功时完成
        mounted: function(){


        },
        /*方法函数  事件等*/
        methods: {
            consignorRegister(){
                location.href="consignor.jsp";
            },
            BiddersRegister(){
                location.href="bidder.jsp";
            },
                enter(){
                    this.colord = 'background-color:#2B2B2B';
                },
                leave(){
                    this.colord ='background-color:#FFFFFF';
                },

                enters(){
                    this.colors = 'background-color:#2B2B2B';
                },
                leaves(){
                    this.colors ='background-color:#FFFFFF';
                }
        }
    });

</script>
<style>
    .loginToHome {
        position: absolute;
        left: 0px;
        right: 0;
        top: 0;
        bottom: 0;
        margin: auto;
        width: 1111px;
        height: 444px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        background: #fff;
        border: 1px solid #dcdfe6;
    }
    .loginForm {
        text-align: center;
        padding-top: 15px;
        padding-right: 30px;
        top: 10px;
    }
    .homeBut {
        position: absolute;
        left: 0px;
    }
    .loginBut {
        position: absolute;
        right: 0px;
    }
</style>

</html>
