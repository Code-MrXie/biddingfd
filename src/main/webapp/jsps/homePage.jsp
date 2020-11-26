<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Vue测试</title>
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
<div id="abc" >
    <el-container style=" border: 1px solid #eee">
        <el-header style="text-align: right; font-size: 12px;background-color: #545c64; height: 100px">
            <div style="float: left">
                <h1> 台州市产权电子交易平台</h1>
            </div>
            <div style="margin-top: 20px">
                <el-button type="primary" icon="el-icon-s-platform">桌面</el-button>
                <el-button type="primary" icon="el-icon-s-custom">项目负责人</el-button>
                <el-button type="primary" icon="el-icon-document-copy">知识库</el-button>
                <el-button type="primary" icon="el-icon-chat-dot-round">在线支持</el-button>
                <el-button type="primary"  icon="el-icon-switch-button">注销</el-button>
            </div>
        </el-header>

        <el-container>
            <el-aside width="300px" style="background-color: rgb(238, 241, 246)">
                <template>
                    <div>
                        <el-menu
                                default-active="2"
                                class="el-menu-vertical-demo"
                                @open="handleOpen"
                                @close="handleClose"
                                background-color="#545c64"
                                text-color="#fff"
                                active-text-color="#ffd04b">
                            <el-submenu v-if="item.parent_id == '0'"  v-for="(item,index) in qvanxian" :index="index">
                                <template slot="title">
                                    <i class="el-icon-s-platform"></i>
                                    <span>{{item.p_name}}</span>
                                </template>
                                <el-menu-item-group v-if="item.sid.length != '0'"  v-for="(dice,indexs) in item.sid">
                                    <el-menu-item :index="[index+'-'+indexs]" @click="goHome(dice.path)"> {{dice.p_name}} </el-menu-item>
                                </el-menu-item-group>
                            </el-submenu>
                        </el-menu>
                    </div>
                </template>
            </el-aside>
            <el-main style="height: 800px;margin:0; padding:0;">
                <div>
                    <iframe name="rightPage" style="width: 100%;height: 100%;margin:0; padding:0;" :src="url"></iframe>
                </div>
            </el-main>
        </el-container>
    </el-container>


</div>

</body>


<script>
    new Vue({
        el: '#abc',
        data () {
            return {
                url:'${pageContext.request.contextPath}/login/login.jsp',
                qvanxian:[],
            }
        },
        mounted: function() {
            var _this = this;
            axios
                .post('/jurisdiction')
                .then(function (res) {
                    console.log(res.data)
                    _this.qvanxian = res.data
                })
        },
        methods: {
            goHome(path){
                console.log(path)
                this.url = path;
            }
        }
    });

</script>


</html>
