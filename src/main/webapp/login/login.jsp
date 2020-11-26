
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

<body style="background-size:1920px 1080px ;background-image:url(${pageContext.request.contextPath}/static/images/1.jpg); ">

<div id="abc">
    <div style="margin-top: 300px">
        <%--<h1 style=" text-align: center;"> 台州市产权电子交易平台</h1>--%>
        <h2 style=" text-align: center;">选择注册类型</h2>
    </div>
        <template>
            <div id="login">
                <div class="loginToHome">
                    <div style=" text-align: center;">
                        <el-button icon="el-icon-user-solid" @click="">登录</el-button>
                        <el-button  icon="el-icon-user" @click="register">注册</el-button>
                    </div>

                    <el-form
                            ref="form"
                            :model="form"
                            :rules="ruleForm"
                            status-icon
                            label-width="80px"
                            class="loginForm"
                    >
                        <el-form-item
                                label="用户名"
                                prop="name">
                            <el-input
                                    type="text"
                                    v-model="form.name"
                                    auto-complete="off"
                                    placeholder="请输入用户名"></el-input>
                        </el-form-item>
                        <el-form-item
                                label="密码"
                                prop="password">
                            <el-input
                                    type="password"
                                    v-model="form.password"
                                    auto-complete="off"
                                    placeholder="请输入密码"
                            ></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button
                                    class="homeBut"
                                    type="primary"
                                    plain
                                    @click="submit"
                                    :loading="logining"
                            >登录</el-button>
                            <el-button
                                    class="loginBut"
                                    type="primary"
                                    plain
                                    @click="resetForm()"
                            >重置</el-button>
                        </el-form-item>
                    </el-form>
                </div>
            </div>
        </template>


</div>

</body>
<style>
    .loginToHome {
        position: absolute;
        left: 0px;
        right: 0;
        top: 0;
        bottom: 0;
        margin: auto;
        width: 400px;
        height: 260px;
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

<script>
    new Vue({
        el: '#abc',
        data() {
            return {
                logining: false,
                form: {
                    name: '',
                    password: ''
                },
                ruleForm: {
                    name: [
                        { required: true, message: '请输入账号', trigger: 'blur' },
                    ],
                    password: [
                        { required: true, message: '请输入密码', trigger: 'blur' },
                    ]
                }
            }
        },
        methods: {
            //注册跳转
            register(){
                location.href="${pageContext.request.contextPath}/login/register.jsp";
            },
            //登录提交方法
            submit(event){
                this.$refs.form.validate((valid) =>{})
                console.log(this.form)
                axios
                    .post('/',{form:this.form})
                    .then(function (res) {
                        if(res.data){
                            location.href="${pageContext.request.contextPath}/jsps/homePage.jsp";
                        }else{
                            alert("账号密码错误")
                        }

                    })
            },
            resetForm(){
                this.$refs.form.resetFields();
            }

        }

        })
</script>



</html>
