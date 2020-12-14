
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
            <el-tab-pane label="待办理" name="first" class="tabPan">
                <%@include file="../test/sss.jsp"%>
            </el-tab-pane>
            <el-tab-pane label="办理中" name="second" class="tabPan">
                <%@include file="../test/sss.jsp"%>
            </el-tab-pane>
            <el-tab-pane label="已办理" name="already" class="tabPan">
                <%@include file="../test/sss.jsp"%>
            </el-tab-pane>
        </el-tabs>
    </div>
</div>

</body>
<style>
    .grid{
        height: 40px;
        line-height: 40px;
        border: 1px solid #82848a;
    }
    .mingcheng{
        text-align: center;
        background-color: #e8e8e8;
    }
</style>

<script>
    new Vue({
        el: '#abc',

        mounted: function(){
            var _this = this;
            // _this.selectAs();
        },
        data() {
            return {
                user:{businessName:'asdsa'},
                sss:{businessName:'asdsad'},
                moneyStatus : 1,
                activeName: 'first',
                textarea:'',
                itemInfo:{
                    depositPayWay:'1',
                },
            };
        },
        methods: {
            transaction(id){
                alert(id);
                location.href="${pageContext.request.contextPath}/jsps/transaction.jsp?key="+id;
            },
            // selectAs(){
            //     var _this = this;
            //     axios
            //         .post('/pb-item-info/theContractFor',{moneyStatus:this.moneyStatus})
            //         .then(function (res) {
            //             console.log(res.data)
            //             _this.fileList = res.data;
            //         })
            // },
            baoCun(){
                alert(111)
              var _this = this;
                console.log("=====")
                console.log(_this.itemInfo);
            },
            tiJiao(){
                var _this = this;

                axios
                    .post("/pb-item-info/xiangMuDengJi",_this.itemInfo)
                    .then(function(res){
                        console.log("=====")
                        console.log(_this.itemInfo);
                        location.href="XiangMuFuZeRenDengJiBanLiTiJiao.jsp";
                    })
                    .catch()

            },
            handleClick(tab, event) {
                if(tab.name == 'second'){
                    this.moneyStatus=2;   // 1 办理中
                    this.selectAs();
                    alert("办理中");
                }else  if(tab.name == 'already'){
                    this.moneyStatus=3; // 2 已办理
                    this.selectAs();
                    alert("已办理");
                }else{
                    this.moneyStatus=1; // 0 待办理
                    this.selectAs();
                    alert("待办理");
                }
            }

        }
    })
</script>



</html>
