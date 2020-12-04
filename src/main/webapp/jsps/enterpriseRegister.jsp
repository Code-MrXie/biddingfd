<%--
  Created by IntelliJ IDEA.
  User: m1761
  Date: 2020/11/25
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册资料完善</title>
    <script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
    <!-- 引入组件库 -->
    <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>
</head>
<%--清除空间间隙--%>
<body style="margin:0; padding:0;">

<div id="app" style="border:0;padding:0;">

    <%------------------------------------------企业资料完善---------------------------------------------------------------------%>

    <div id="company" style="display:none;margin:0 auto; background-color: #EAF7FF;padding: 15px 10px 100px 10px;">
        <div style="margin:15px">
            <el-row>
                <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 企业名称 </div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple-light">
                    <el-input v-model="user.businessName" placeholder="请输入内容"></el-input>
                </div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">社会信用（组织机构代码）</div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple-light">
                    <el-input v-model="user.businessName" placeholder="请输入内容"></el-input>
                </div></el-col>
            </el-row>
        </div>
        <div style="margin:15px">
            <el-row>
                <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 企业地址 </div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple-light">
                    <el-input v-model="user.businessAddress" placeholder="请输入内容"></el-input>
                </div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">联系人姓名</div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple-light">
                    <el-input v-model="user.realName" placeholder="请输入内容"></el-input>
                </div></el-col>
            </el-row>
        </div>

        <div style="margin:15px">
            <el-row>
                <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 联系人身份证 </div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple-light">
                    <el-input v-model="user.idCard" placeholder="请输入内容"></el-input>
                </div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">联系人手机号</div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple-light">
                    <el-input v-model="user.mobile" placeholder="请输入内容"></el-input>
                </div></el-col>
            </el-row>
        </div>
        <div style="margin:15px">
            <el-row>
                <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 法人姓名 </div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple-light">
                    <el-input v-model="user.corName" placeholder="请输入内容"></el-input>
                </div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">法人身份证</div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple-light">
                    <el-input v-model="user.corNum" placeholder="请输入内容"></el-input>
                </div></el-col>
            </el-row>
        </div>
        <div style="margin:15px">
            <el-row>
                <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 银行账号 </div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple-light">
                    <el-input v-model="user.card" placeholder="请输入内容"></el-input>
                </div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">账户名</div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple-light">
                    <el-input v-model="user.cardName" placeholder="请输入内容"></el-input>
                </div></el-col>
            </el-row>
        </div>
            <div>
                <span style="font-size: 20px;margin-top: 40px">温馨提示:请提供真实资料，否则所造成—切后果请自行承担!</span>
            </div>
            <div style="float:right">
                <el-button type="primary" @click = "baocun">保存</el-button>
            </div>
    </div>


        <el-dialog
                title="提示"
                :visible.sync="dialogVisible"
                width="1200px"
                :before-close="handleClose">
            <div>
                <template>
                    <el-table
                            :data="accessory"
                            border
                            style="width: 100%">
                        <el-table-column
                                prop="id"
                                label="序号">
                        </el-table-column>
                        <el-table-column
                                prop="accessory_name"
                                label="名称"
                        >
                        </el-table-column>
                        <el-table-column
                                prop="accessory_format"
                                label="上传格式">
                        </el-table-column>
                        <el-table-column
                                prop="accessory_path"
                                label="文件名">
                        </el-table-column>
                        <el-table-column
                                prop="accessory_size"
                                label="大小">
                        </el-table-column>

                        <el-table-column
                                fixed="right"
                                label="操作"
                                width="300"
                                align="center">
                            <template slot-scope="scope" style="align-content: center">
                                <el-upload
                                        class="upload-demo"
                                        action="/filesUpload"
                                        :data="uploadData"
                                        :on-success="handleChange"
                                        :on-error="erroeChange"
                                        :limit="1"
                                        :file-list="fileList">
                                    <el-button size="small" type="primary" @click="dianji(scope.row)">点击上传</el-button>
                                </el-upload>
                            </template>
                        </el-table-column>
                    </el-table>
                </template>

            </div>
            <el-button @click="dialogVisible = false">取 消</el-button>
            <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
            </span>
        </el-dialog>


<%------------------------------------------个人资料完善---------------------------------------------------------------------%>

    <div id="personage" style="display:none;margin:0 auto; background-color: #EAF7FF;padding: 15px 10px 100px 10px;">
        <div style="margin:15px">
            <el-row>
                <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 个人名称 </div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple-light">
                    <el-input v-model="user.userName" placeholder="请输入内容"></el-input>
                </div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">身份证号码</div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple-light">
                    <el-input v-model="user.idCard" placeholder="请输入内容"></el-input>
                </div></el-col>
            </el-row>
        </div>
        <div style="margin:15px">
            <el-row>
                <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 个人地址 </div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple-light">
                    <el-input v-model="user.businessAddress" placeholder="请输入内容"></el-input>
                </div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">银行账号</div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple-light">
                    <el-input v-model="user.card" placeholder="请输入内容"></el-input>
                </div></el-col>
            </el-row>
        </div>

        <div style="margin:15px">
            <el-row>
                <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 账户名 </div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple-light">
                    <el-input v-model="user.cardName" placeholder="请输入内容"></el-input>
                </div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">联系人手机号</div></el-col>
                <el-col :span="6"><div class="grid-content bg-purple-light">
                    <el-input v-model="user.mobile" placeholder="请输入内容"></el-input>
                </div></el-col>
            </el-row>
        </div>
        <div>
            <span style="font-size: 20px;margin-top: 40px">温馨提示:请提供真实资料，否则所造成—切后果请自行承担!</span>
        </div>
        <div style="float:right">
            <el-button type="primary"  @click="personalData">保存</el-button>
        </div>
    </div>

        <el-dialog
                title="提示"
                :visible.sync="dialogVisible1"
                width="1200px"
                :before-close="handleClose">
            <div>
                <template>
                    <el-table
                            :data="accessory"
                            border
                            style="width: 100%">
                        <el-table-column
                                prop="id"
                                label="序号">
                        </el-table-column>
                        <el-table-column
                                prop="accessory_name"
                                label="名称"
                        >
                        </el-table-column>
                        <el-table-column
                                prop="accessory_format"
                                label="上传格式">
                        </el-table-column>
                        <el-table-column
                                prop="accessory_path"
                                label="文件名">
                        </el-table-column>
                        <el-table-column
                                prop="accessory_size"
                                label="大小">
                        </el-table-column>

                        <el-table-column
                                fixed="right"
                                label="操作"
                                width="300"
                                align="center">
                            <template slot-scope="scope" style="align-content: center">
                                <el-upload
                                        class="upload-demo"
                                        action="/filesUpload"
                                        :data="uploadData"
                                        :on-success="handleChange"
                                        :on-error="erroeChange"
                                        :limit="1"
                                        :file-list="fileList">
                                    <el-button size="small" type="primary" @click="dianji(scope.row)">点击上传</el-button>
                                </el-upload>
                            </template>
                        </el-table-column>
                    </el-table>
                </template>

            </div>
            <el-button @click="dialogVisible1 = false">取 消</el-button>
            <el-button type="primary" @click="dialogVisible1 = false">确 定</el-button>
            </span>
        </el-dialog>

        <%------------------------------------------委托人资料完善---------------------------------------------------------------------%>

        <div id="consignor" style="display:none;margin:0 auto; background-color: #EAF7FF;padding: 15px 10px 100px 10px;">
            <div style="margin:15px">
                <el-row>
                    <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 单位名称 </div></el-col>
                    <el-col :span="6"><div class="grid-content bg-purple-light">
                        <el-input v-model="user.businessName" placeholder="请输入内容"></el-input>
                    </div></el-col>
                    <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">社会信用（组织机构代码）</div></el-col>
                    <el-col :span="6"><div class="grid-content bg-purple-light">
                        <el-input v-model="user.businessName" placeholder="请输入内容"></el-input>
                    </div></el-col>
                </el-row>
            </div>
            <div style="margin:15px">
                <el-row>
                    <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 单位地址 </div></el-col>
                    <el-col :span="6"><div class="grid-content bg-purple-light">
                        <el-input v-model="user.businessAddress" placeholder="请输入内容"></el-input>
                    </div></el-col>
                    <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">联系人姓名</div></el-col>
                    <el-col :span="6"><div class="grid-content bg-purple-light">
                        <el-input v-model="user.realName" placeholder="请输入内容"></el-input>
                    </div></el-col>
                </el-row>
            </div>

            <div style="margin:15px">
                <el-row>
                    <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 联系人身份证 </div></el-col>
                    <el-col :span="6"><div class="grid-content bg-purple-light">
                        <el-input v-model="user.idCard" placeholder="请输入内容"></el-input>
                    </div></el-col>
                    <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">联系人手机号</div></el-col>
                    <el-col :span="6"><div class="grid-content bg-purple-light">
                        <el-input v-model="user.mobile" placeholder="请输入内容"></el-input>
                    </div></el-col>
                </el-row>
            </div>
            <div style="margin:15px">
                <el-row>
                    <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 法人姓名 </div></el-col>
                    <el-col :span="6"><div class="grid-content bg-purple-light">
                        <el-input v-model="user.corName" placeholder="请输入内容"></el-input>
                    </div></el-col>
                    <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">法人身份证</div></el-col>
                    <el-col :span="6"><div class="grid-content bg-purple-light">
                        <el-input v-model="user.corNum" placeholder="请输入内容"></el-input>
                    </div></el-col>
                </el-row>
            </div>
            <div style="margin:15px">
                <el-row>
                    <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 银行账号 </div></el-col>
                    <el-col :span="6"><div class="grid-content bg-purple-light">
                        <el-input v-model="user.card" placeholder="请输入内容"></el-input>
                    </div></el-col>
                    <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">账户名</div></el-col>
                    <el-col :span="6"><div class="grid-content bg-purple-light">
                        <el-input v-model="user.cardName" placeholder="请输入内容"></el-input>
                    </div></el-col>
                </el-row>
            </div>
            <div>
                <span style="font-size: 20px;margin-top: 40px">温馨提示:请提供真实资料，否则所造成—切后果请自行承担!</span>
            </div>
            <div style="float:right">
                <el-button type="primary" @click="consignorData">保存</el-button>
            </div>
        </div>



        <el-dialog
                title="委托人完善"
                :visible.sync="dialogVisible2"
                width="1200px"
                :before-close="handleClose">
            <div>
                <template>
                    <el-table
                            :data="accessory"
                            border
                            style="width: 100%">
                        <el-table-column
                                prop="id"
                                label="序号">
                        </el-table-column>
                        <el-table-column
                                prop="accessory_name"
                                label="名称"
                        >
                        </el-table-column>
                        <el-table-column
                                prop="accessory_format"
                                label="上传格式">
                        </el-table-column>
                        <el-table-column
                                prop="accessory_path"
                                label="文件名">
                        </el-table-column>
                        <el-table-column
                                prop="accessory_size"
                                label="大小">
                        </el-table-column>

                        <el-table-column
                                fixed="right"
                                label="操作"
                                width="300"
                                align="center">
                            <template slot-scope="scope" style="align-content: center">
                                <el-upload
                                        class="upload-demo"
                                        action="/filesUpload"
                                        :data="uploadData"
                                        :on-success="handleChange"
                                        :on-error="erroeChange"
                                        :limit="1"
                                        :file-list="fileList">
                                    <el-button size="small" type="primary" @click="dianji(scope.row)">点击上传</el-button>
                                </el-upload>
                            </template>
                        </el-table-column>
                    </el-table>
                </template>

            </div>
            <el-button @click="dialogVisible2 = false">取 消</el-button>
            <el-button type="primary" @click="dialogVisible2 = false">确 定</el-button>
            </span>
        </el-dialog>



</div>

</body>
</html>
<script>
    new Vue({
        el:"#app",
        /*变量*/
        data() {
            return {
                uploadData:{
                    str:'',
                },
                fileList:[],
                input: '',
                user:{},
                dialogVisible: false,
                dialogVisible1: false,
                dialogVisible2:false,
                accessory:[],
            }
        },
        //页面加载成功时完成
        mounted: function(){

            var _this = this;
            // 发送请求axios完成
            axios({
                url:'/perfect',
                methods:'get',
            }).then(function(response){
                console.log(response.data)
                _this.user = response.data;
                if(response.data.userDifferentiate == '2'){
                    $("#company").attr("style","display:block;");//企业展示
                }else if(response.data.userDifferentiate == '1'){
                    $("#personage").attr("style","display:block;");//个人展示
                }else if(response.data.userDifferentiate == '3'){
                    $("#consignor").attr("style","display:block;");//委托人展示
                }

        })


        },
        /*方法函数  事件等*/
        methods: {

            //获取上传文件id
            dianji(row){
                this.uploadData.str = row.id
            },
            //成功失败都会调用
            handleChange(response, file, fileLis) {
                this.fileList = [];
                this.baocun();
            },
            erroeChange(file, fileList){
                this.fileList = [];
                this.baocun();
            },
            //企业模态框
            baocun(){
                var _this = this;
                this.dialogVisible = true
                axios({
                    url:'/baocun',
                    methods:'get',
                }).then(function(response){
                    console.log(response.data)
                    _this.accessory = response.data;

                })

            },
            //个人模态框
            personalData(){
                var _this = this;
                this.dialogVisible1 = true;
                axios({
                    url:'/baocun',
                    methods:'get',
                }).then(function(response){
                    console.log(response.data)
                    _this.accessory = response.data;

                })
            },
            consignorData(){
                var _this = this;
                this.dialogVisible2 = true;
                axios({
                    url:'/baocun',
                    methods:'get',
                }).then(function(response){
                    console.log(response.data)
                    _this.accessory = response.data;

                })
            },

            //模态框 关闭
            handleClose(done) {
                this.$confirm('确认关闭？')
                    .then(function () {
                        done();
                    })
                    .catch(function () {
                    })
            },


        }
    });
</script>
