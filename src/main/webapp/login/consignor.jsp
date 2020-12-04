
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

<body>
<%--<body  style="background-size:1920px 1080px ;background-image:url(${pageContext.request.contextPath}/static/images/2.jpg);">--%>
<div id="abc">
    <template>
        <div id="login">
            <div class="loginToHome" style="background: rgba(0, 0, 0, 0.1)">

                <div align="center" style="font-size: 20px;">——  委托人企业注册信息填写  ——</div>
                <div align="center" style="margin-top: 30px;font-size: 16px;color:red">报名须知:请如实填写报名信息，以便报名资料审核顺利通过</div>

                <div align="center" style="margin-top: 50px;">
                    <el-form
                            :model="user"
                            status-icon
                            :rules="rules2"
                            ref="user1"
                            class="demo-ruleForm"
                            label-width="200px"
                            style="width: 920px">
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="单位名称" prop="businessName" width="300px">
                                    <el-input style="width: 300px" v-model="user.businessName" auto-complete="off" placeholder="请输入企业名称"></el-input>
                                </el-form-item>
                            </el-col>
                            <el-col :span="12">
                                <el-form-item label="联系人姓名" prop="contactName">
                                    <el-input style="width: 300px" v-model="user.contactName" auto-complete="off" placeholder="请输入联系人姓名"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="社会信用（组织机构)代码证" prop="organizationsCode">
                                    <el-input style="width: 300px" v-model="user.organizationsCode" auto-complete="off" placeholder="请输入社会信用（组织机构)代码证"></el-input>
                                </el-form-item>
                            </el-col>
                            <el-col :span="12">
                                <el-form-item label="联系人手机号" prop="mobile">
                                    <el-input style="width: 300px" v-model="user.mobile" auto-complete="off" placeholder="请输入联系人手机号"></el-input>
                                    <span style="color:red">该号码为您的竞价系统的登录用户名</span>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="登陆密码" prop="password">
                                    <el-input type="password" style="width: 300px" v-model="user.password" auto-complete="off" placeholder="请输入登录密码"></el-input>
                                </el-form-item>
                            </el-col>
                            <el-col :span="12">
                                <el-form-item label="联系人身份证" prop="idCard">
                                    <el-input style="width: 300px" v-model="user.idCard" auto-complete="off" placeholder="请输入联系人身份证"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="请再次输入登陆密码" prop="checkPassword">
                                    <el-input type="password" style="width: 300px" v-model="user.checkPassword" auto-complete="off" placeholder="请再次输入登陆密码"></el-input>
                                </el-form-item>
                            </el-col>
                            <el-col :span="12">
                                <el-form-item label="单位地址" prop="card">
                                    <el-input style="width: 300px" v-model="user.card" auto-complete="off" placeholder="请输入银行账号"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="法人手机号" prop="corporatePhone">
                                    <el-input style="width: 300px" v-model="user.corporatePhone" auto-complete="off" placeholder="请输入企业地址"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="法人姓名" prop="corName">
                                    <el-input style="width: 300px" v-model="user.corName" auto-complete="off" placeholder="请输入法人姓名"></el-input>
                                </el-form-item>
                            </el-col>
                            <el-col :span="7">

                            </el-col>
                            <el-col :span="5">

                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="12">
                                <el-form-item label="法人身份证" prop="corNum">
                                    <el-input style="width: 300px" v-model="user.corNum" auto-complete="off" placeholder="请输入法人身份证"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>

                    </el-form>
                </div>
                <div slot="footer" class="dialog-footer" align="center">
                    <el-button type="primary" @click="submitFormEnterprise('user1')" v-loading.fullscreen.lock="loadingEnterprise">提交</el-button>
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
            // <!--验证手机号是否合法   联系人手机号-->
            let checkTel = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入手机号码'))
                } else if (!this.checkMobile(value)) {
                    callback(new Error('手机号码不合法'))
                } else {
                    callback()
                }
            };

            let checkTels = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入手机号码'))
                } else if (!this.checkMobile(value)) {
                    callback(new Error('手机号码不合法'))
                } else {
                    callback()
                }
            };

            // <!--验证身份证号码是否合法-->
            let vaIdCard = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入身份证号码'))
                } else if (!this.checkIdCard(value)) {
                    callback(new Error('身份证号码不合法'))
                } else if (this.repetition(value)) {
                    console.log("测试---"+this.jincheng)
                    callback(new Error('身份证号码重复！'))
                }else {
                    callback()
                }
            };
            // <!--验证身份证号码是否合法-->
            let vaCorNum = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入身份证号码'))
                } else if (!this.checkIdCard(value)) {
                    callback(new Error('身份证号码不合法'))
                } else {
                    callback()
                }
            };
            //  <!--个人名称-->
            let vaUserName = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入个人名称'))
                } else {
                    callback()
                }
            };
            //  <!--账户名-->
            let vacardName = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入账户名'))
                } else {
                    callback()
                }
            };
            //  <!--账户名-->
            let vacorName = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入法人姓名'))
                } else {
                    callback()
                }
            };
            //  <!--账户名-->
            let vabusinessAddress = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入企业地址'))
                } else {
                    callback()
                }
            };
            //  <!--账户名-->
            let vaorganizationsCode = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入机构代码证'))
                } else {
                    callback()
                }
            };
            // <!--验证密码-->
            let validatePass = (rule, value, callback) => {
                if (value === "") {
                    callback(new Error("请输入密码"))
                } else {
                    if (this.user.checkPassword !== "") {
                        // this.$refs.user.validateField("checkPassword");
                    }
                    callback()
                }
            };

            // <!--二次验证密码-->
            let validatePass2 = (rule, value, callback) => {
                if (value === "") {
                    callback(new Error("请再次输入密码"));
                } else if (value !== this.user.password) {
                    callback(new Error("两次输入密码不一致!"));
                } else {
                    callback();
                }
            };

            let vabusinessName = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入企业名称'))
                } else {
                    callback()
                }
            };

            return {
                user:{},
                jincheng:true,
                rules2: {
                    userName: [{ validator: vaUserName, trigger: 'change' }],
                    idCard: [{ validator: vaIdCard, trigger: 'change' }],
                    corNum: [{ validator: vaCorNum, trigger: 'change' }],
                    password: [{ validator: validatePass, trigger: 'change' }],
                    checkPassword: [{ validator: validatePass2, trigger: 'change' }],
                    mobile: [{ validator: checkTel, trigger: 'change' }],
                    // smscode: [{ validator: checkSmscode, trigger: 'change' }],
                    cardName: [{ validator: vacardName, trigger: 'change' }],
                    corName: [{ validator: vacorName, trigger: 'change' }],
                    businessName: [{ validator: vabusinessName, trigger: 'change' }],
                    corporatePhone: [{ validator: checkTels, trigger: 'change' }],
                    organizationsCode: [{ validator: vaorganizationsCode, trigger: 'change' }],
                },
                loadingEnterprise:false,
            }
        },
        //页面加载成功时完成
        mounted: function(){

        },
        /*方法函数  事件等*/
        methods: {

            //联系人身份证验证是否重复
            repetition(str){
                console.log(str)
                var _this = this;
                axios.post('/repetition',{str:str})
                    .then(function (res) {
                        if(res.data){
                            alert("数据库有");
                            _this.jincheng =true;
                        }else{
                            alert("数据库没有");
                            _this.jincheng =false
                        }
                    })
                return _this.jincheng;
            },

            checkMobile(str) {
                var re = /^1\d{10}$/;
                if (re.test(str)) {
                    return true;
                } else {
                    return false;
                }
            },
            checkIdCard(str) {
                var re = /^[1-9]\d{5}(18|19|20|(3\d))\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
                if (re.test(str)) {
                    return true;
                } else {
                    return false;
                }
            },
            // <!--提交注册-->
            submitFormEnterprise(formName) {
                console.log(this.user);
                var that=this;
                this.$refs[formName].validate(valid => {
                    if (valid) {
                        this.loadingEnterprise=true;
                        that.addEnterprisedUser();
                    } else {
                        console.log("error submit!!");
                return false;
            }
            })
            },

            addEnterprisedUser(){
                var _this=this;
                axios.post('/consignor',_this.user)
                    .then(function (response) {
                        if(response.data){
                            location.href="${pageContext.request.contextPath}/login/login.jsp";
                        }else{
                            location.href="${pageContext.request.contextPath}/login/consignor.jsp";
                            alert("注册失败")
                        }
                    })

            },

        }
    });
    mobile
</script>
<style>
    .loginToHome {
        top: 0;
        margin: auto;
        width: 1111px;
        height: 800px;
        background: #fff;
        border: 1px solid #dcdfe6;
    }
</style>

</html>
