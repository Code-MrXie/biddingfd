
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>结果公示</title>
</head>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<!-- 引入样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
<!-- 引入组件库 -->
<script src="${pageContext.request.contextPath }/static/element/index.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>
<body>
<div id="resultShow">
    <el-container>
        <el-header style="height: 40px">竞得人信息</el-header>
        <el-main>
            <p v-for="(user,i) in resultInfo">
            <el-container>
                <el-header style="height: 40px">标的<a href="#">{{user.object_name}}</a>成交信息</el-header>
                <el-main>
                    <el-form :inline="true" label-width="180px">
                        <el-form-item label="组织机构代码或身份证号">
                            <el-input v-model="user.idcard"></el-input>
                        </el-form-item>
                        <el-form-item label="竞得人名称" >
                            <el-input v-model="user.user_name"></el-input>
                        </el-form-item>
                        <br>
                        <el-form-item label="标的名称">
                            <el-input v-model="user.object_name" style="width: 620px"></el-input>
                        </el-form-item>
                        <br>
                        <el-form-item label="成交价">
                            <el-input v-model="user.close_price"></el-input>
                        </el-form-item>
                        <el-form-item label="成交价大写">
                            <el-input v-model="user.num"></el-input>
                        </el-form-item>
                    </el-form>
                </el-main>
            </el-container>
            </p>
        </el-main>
    </el-container>
</div>

</body>
<style>

    .el-header {
        background-color: #C8E5F8;
        color: #333;
        text-align: left;
        line-height: 40px;
    }

    .el-main {
        background-color: #FFFFFF;
        text-align: center;
    }

</style>

<script>
    new Vue({
        el: '#resultShow',
        /*变量*/
        data () {
            return {
                resultInfo:[
                    {
                        idcard:'',
                        user_name:'',
                        object_name:'',
                        close_price:'',
                        num:''
                    }
                ],
                labelPosition:"right",

            }
        },
        //页面加载成功时完成
        mounted: function(){
            var _this = this;
            axios
                .post("/pb-result-info/resultInfo")
                .then(function (res) {
                    console.log(res.data)
                    _this.resultInfo=res.data

                })
                .catch()

        },
        /*方法函数  事件等*/
        methods: {


        }
    });

</script>

</html>
