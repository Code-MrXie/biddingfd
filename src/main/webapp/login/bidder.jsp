<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2020/11/24
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
    <!-- 引入组件库 -->
    <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>

</head>
<body style="background-size:1920px 1080px ;background-image:url(${pageContext.request.contextPath}/static/images/2.jpg); ">
    <div id="app">
        <div style="box-shadow:inset 0 2px 12px 500px rgba(248,248,255, 0.4);width: 556px;height: 317px;position: absolute;top: 30%;left: 35%;">
            <div align="center" style="margin-top: 50px">
                <el-button @click="addBidderPersonageD()" type="warning" icon="el-icon-user" style="width: 400px;height: 80px;font-size: 30px" round>个人注册</el-button>
            </div>
            <div align="center" style="margin-top: 50px;">
                <el-button type="warning" @click="addBidderEnterpriseD()"  icon="el-icon-user-solid" style="width: 400px;height: 80px;font-size: 30px" round>企业注册</el-button>
            </div>
        </div>

        <el-dialog customClass="customWidth"  width="60%" :visible.sync="addBidderPersonage" :close-on-press-escape="false"  :close-on-click-modal="false" >

            <div align="center" style="font-size: 20px;">——  个人注册信息填写  ——</div>
            <div align="center" style="margin-top: 30px;font-size: 16px;color:red">报名须知:请如实填写报名信息，以便报名资料审核顺利通过</div>

            <div align="center" style="margin-top: 50px;">
                <el-form
                        :model="user"
                        status-icon
                        :rules="rules2"
                        ref="user"
                        class="demo-ruleForm"
                        label-width="110px"
                        style="width: 410px"
                >
                    <el-form-item label="个人名称" prop="userName">
                        <el-input style="width: 300px" v-model="user.userName" auto-complete="off" placeholder="请输入个人名称"></el-input>
                    </el-form-item>

                    <el-form-item label="身份证号码" prop="idCard">
                        <el-input style="width: 300px" v-model="user.idCard" auto-complete="off" placeholder="请输入身份证号码"></el-input>
                        <span style="color:red">该号码为您的竞价系统的登录用户名</span>
                    </el-form-item>

                    <el-form-item label="登录密码" prop="password">
                        <el-input type="password" style="width: 300px" v-model="user.password" auto-complete="off" placeholder="请输入登录密码"></el-input>
                    </el-form-item>

                    <el-form-item label="确认登录密码" prop="checkPassword">
                        <el-input type="password" v-model="user.checkPassword" auto-complete="off" placeholder="确认登录密码"></el-input>
                    </el-form-item>

                    <el-form-item label="联系号码" prop="mobile">
                        <el-input style="width: 300px" v-model="user.mobile" auto-complete="off" placeholder="请输入联系号码"></el-input>
                    </el-form-item>

                    <el-row>
                        <el-col :span="12">
                        </el-col>

                        <el-col :span="12">
                        </el-col>
                    </el-row>
                    <el-form-item label="银行账号" prop="card">
                        <el-input v-model="user.card" auto-complete="off" placeholder="请输入银行账号"></el-input>
                    </el-form-item>

                    <el-form-item label="账户名" prop="cardName">
                        <el-input v-model="user.cardName" auto-complete="off" placeholder="请输入账户名"></el-input>
                        <span style="color:red">该银行账号将用于您的保证金缴纳，缴纳保证金时请确保银行账号—致</span>
                    </el-form-item>

                </el-form>
            </div>
            <div slot="footer" class="dialog-footer" align="center">
                <el-button type="primary" @click="submitForm('user')"  v-loading.fullscreen.lock="loadingPersonage">提交</el-button>
                <el-button @click="addBidderPersonage=false">关闭</el-button>
            </div>
        </el-dialog>



        <el-dialog customClass="customWidth"  width="60%" :visible.sync="addBidderEnterprise" :close-on-press-escape="false"  :close-on-click-modal="false" >

            <div align="center" style="font-size: 20px;">——  企业注册信息填写  ——</div>
            <div align="center" style="margin-top: 30px;font-size: 16px;color:red">报名须知:请如实填写报名信息，以便报名资料审核顺利通过</div>

            <div align="center" style="margin-top: 50px;">
                <el-form
                        :model="user"
                        status-icon
                        :rules="rules2"
                        ref="user1"
                        class="demo-ruleForm"
                        label-width="200px"
                        style="width: 920px"
                >
                    <el-row>
                        <el-col :span="12">
                            <el-form-item label="企业名称" prop="businessName" width="300px">
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
                            <el-form-item label="银行账号" prop="card">
                                <el-input style="width: 300px" v-model="user.card" auto-complete="off" placeholder="请输入银行账号"></el-input>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="12">
                            <el-form-item label="企业地址" prop="businessAddress">
                                <el-input style="width: 300px" v-model="user.businessAddress" auto-complete="off" placeholder="请输入企业地址"></el-input>
                            </el-form-item>
                        </el-col>
                        <el-col :span="12">
                            <el-form-item label="账户名" prop="cardName">
                                <el-input style="width: 300px" v-model="user.cardName" auto-complete="off" placeholder="请输入账户名"></el-input>
                                <span style="color:red">该银行账号将用于您的保证金缴纳，缴纳保证金时请确保银行账号—致</span>
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
                <el-button @click="addBidderEnterprise=false">关闭</el-button>
            </div>
        </el-dialog>
    </div>
</body>
<script type="text/javascript">
    new Vue({
        el: "#app",
        data(){
            // <!--验证手机号是否合法-->
            let checkTel = (rule, value, callback) => {
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
                }else if (!this.repetition(value)) {
                    callback(new Error('身份证号码已经使用'))
                } else {
                    callback()
                }
            };
            // <!--验证身份证号码是否合法-->
            let vaCorNum = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入身份证号码'))
                } else if (!this.checkCorNum(value)) {
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
            return{
                jincheng:false,
                user: {
                    userName: "",
                    roleId: "",
                    password: "",
                    checkPassword: "",
                    contactName: "",
                    idCard: "",
                    organizationsCode: "",
                    mobile: "",
                    card: "",
                    cardName: "",
                    realName: "",
                    corNum: "",
                    corName: "",
                    businessName: "",
                    smscode: "",
                    businessAddress: "",
                    verifyCode: null
                },
                rules2: {
                    userName: [{ validator: vaUserName, trigger: 'change' }],
                    idCard: [{ validator: vaIdCard, trigger: 'change' }],
                    corNum: [{ validator: vaCorNum, trigger: 'change' }],
                    password: [{ validator: validatePass, trigger: 'change' }],
                    checkPassword: [{ validator: validatePass2, trigger: 'change' }],
                    mobile: [{ validator: checkTel, trigger: 'change' }],
                    cardName: [{ validator: vacardName, trigger: 'change' }],

                    corName: [{ validator: vacorName, trigger: 'change' }],
                    businessAddress: [{ validator: vabusinessAddress, trigger: 'change' }],
                    organizationsCode: [{ validator: vaorganizationsCode, trigger: 'change' }],
                },
                addBidderPersonage:false,
                addBidderEnterprise:false,
                loadingEnterprise:false,
                checkSmscode:"",
                loadingPersonage:false,
                autoImage: "",
                flag: true
            }
        },
        methods:{
            addBidderPersonageD(){
                this.user = [];
                this.addBidderPersonage=true;
                // this.smscodeImg();
                this.$refs['user'].resetFields();
            },
            addBidderEnterpriseD(){
                this.user = [];
                this.addBidderEnterprise=true;
                // this.smscodeImg();
                this.$refs['user1'].resetFields();
            },

            // <!--提交注册-->
            submitForm(formName) {
                console.log(this.user);
                var that=this;
                this.$refs[formName].validate(valid => {
                    if (valid) {
                        this.loadingPersonage=true;
                        that.addUser();
                    } else {
                        console.log("error submit!!");
                        return false;
                    }
                })
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

            addUser(){
                var _this=this;
                this.user.roleId=1;
                axios.post('/register/addUser',_this.user)
                    .then(function (response) {
                        // location.reload();
                        if(response.data){
                            location.href="${pageContext.request.contextPath}/login/login.jsp";
                        }else{
                            alert("注册失败")
                            _this.addBidderPersonage=false;
                            _this.loadingPersonage=false;
                            _this.$refs['user'].resetFields();
                        }
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },


            addEnterprisedUser(){
                var _this=this;
                this.user.roleId=2;
                axios.post('/register/addUser',_this.user)
                    .then(function (response) {
                        // location.reload();
                        if(response.data){
                            location.href="${pageContext.request.contextPath}/login/login.jsp";
                        }else{
                            alert("注册失败")
                            _this.loadingEnterprise=false;
                            _this.addBidderEnterprise=false;
                            _this.$refs['user'].resetFields();
                        }
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },

            // <!--发送验证码-->
            // sendCode () {
            //     let tel = this.user.mobile;
            //     if (this.checkMobile(tel)) {
            //         console.log(tel);
            //         let time = 60;
            //         this.buttonText = '已发送';
            //         this.isDisabled = true;
            //         if (this.flag) {
            //             this.flag = false;
            //             let timer = setInterval(() => {
            //                 time--;
            //                 this.buttonText = time + ' 秒';
            //                 if (time === 0) {
            //                     clearInterval(timer);
            //                     this.buttonText = '重新获取';
            //                     this.isDisabled = false;
            //                     this.flag = true;
            //                 }
            //             }, 1000)
            //         }
            //     }
            // },


            // 验证手机号
            checkMobile(str) {
                var re = /^1\d{10}$/;
                if (re.test(str)) {
                    return true;
                } else {
                    return false;
                }
            },

            // 验证身份证号
            checkIdCard(str) {
                var re = /^[1-9]\d{5}(18|19|20|(3\d))\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
                if (re.test(str)) {
                    return true;
                } else {
                    return false;
                }
            },

            // 验证身份证号
            checkCorNum(str) {
                var re = /^[1-9]\d{5}(18|19|20|(3\d))\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
                if (re.test(str)) {
                    return true;
                } else {
                    return false;
                }
            },
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
                return this.jincheng;
            }


        },
        mounted() {
        },
    });


</script>
<style>
    .el-form-item__label:after {
        content: '*';
        color: #F56C6C;
        margin-right: 4px;
    }
    label[for ="card"]:after{
            content: '';
    }
    label[for ="contactName"]:after{
            content: '';
    }
    body{
        background-image:url(${pageContext.request.contextPath}/images/bg.jpg);
        background-position:center;
        background-size: cover;
        background-repeat:no-repeat;
        background-attachment: fixed;
    }
</style>
</html>
