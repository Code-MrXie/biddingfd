
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
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

<body>

<div id="abc">

    <div>
        <el-tabs v-model="activeName" @tab-click="handleClick" type="border-card">
            <el-tab-pane label="表单" name="first" class="tabPan">
                <%@include file="view/transactionView.jsp"%>
            </el-tab-pane>
            <el-tab-pane label="会签" name="second" class="tabPan">
                <%@include file="view/transactionView.jsp"%>
            </el-tab-pane>
            <el-tab-pane label="附件" name="already" class="tabPan">
                <%@include file="view/transactionView.jsp"%>
            </el-tab-pane>
        </el-tabs>
    </div>


</div>

</body>


<script>
    new Vue({
        el: '#abc',

        mounted: function(){
            //获取另个一页面的参数值
            this.getParameters();
            this.selectAs();
        },
        data() {
            return {
                fileL:[],
                id:{},
                activeName: 'first',
                moneyStatus : 1,
                fileList:[],
            };
        },
        methods: {

            selectAs(){
                var _this = this;
                axios
                    .post('/pb-item-info/transaction',{moneyStatus:this.moneyStatus,id:this.id})
                    .then(function (res) {
                        console.log(res.data)
                        _this.fileList = res.data;
                    })
            },

            handleClick(tab, event) {
                if(tab.name == 'second'){
                    this.moneyStatus=2;
                    this.selectAs();
                    alert("办理中");
                }else  if(tab.name == 'already'){
                    this.moneyStatus=3;
                    this.selectAs();
                    alert("已办理");
                }else{
                    this.moneyStatus=1;
                    this.selectAs();
                    alert("待办理");
                }
            },

            getParameters(){
                var _this = this;
                var url = location.search //获取url中"?"符后的字串 ('?modFlag=business&role=1')
                var theRequest = new Object()
                if (url.indexOf('?') != -1) {
                    var str = url.substr(1) //substr()方法返回从参数值开始到结束的字符串；
                    var strs = str.split('&')
                    for (var i = 0; i < strs.length; i++) {
                        theRequest[strs[i].split('=')[0]] = strs[i].split('=')[1]
                    }
                    console.log(theRequest) //此时的theRequest就是我们需要的参数；
                    _this.id = theRequest

                };
            }
        }
    })
</script>



</html>
