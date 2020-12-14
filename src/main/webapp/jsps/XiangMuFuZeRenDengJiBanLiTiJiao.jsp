
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Vue测试</title>
</head>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<!-- 引入样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
<!-- 引入组件库 -->
<script src="${pageContext.request.contextPath }/static/element/index.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>

<body>
<div id="abc">
    <span style="font-size: large">公共资源竞价项目登记-转交下一步骤</span style="font-size: large">
    ​<el-row style="height:40px;line-height:40px;border: 1px solid black;background-color: #E8F2FB">
        <el-col :span="24">
            流水号
        </el-col>
    </el-row>
    <el-row style="height:40px;line-height:40px;border: 1px solid;">
        <el-col :span="24" style="background-color: #E8F2FB">
            当前步骤为第7步：项目编辑
        </el-col>
    </el-row>
    <el-row style="height:50px;border: 1px solid black">
        <el-col :span="24">
            <el-button type="primary" plain><span style="color: #ac2925">经理处长审核</span></el-button>
        </el-col>
    </el-row>
    <el-row>
        <el-col :span="4" style="height:130px;line-height:130px;border: 1px solid black;background-color: #E8F2FB">下一步骤</el-col>
        <el-col :span="20" style="height:130px;line-height:40px;border: 1px solid black">
            先接收为主办：<br>
            经办人：<br>
            <el-button size="small">选择人员</el-button>
        </el-col>
    </el-row>
    <el-row style="height:130px;line-height:40px;border: 1px solid black">
        <el-col :span="24">
            短信提醒以下人员<br>
            下一步骤：<i class="el-icon-message"></i><br>
            提醒内容：<el-input style="width: 600px;height: 30px"></el-input>
        </el-col>
    </el-row>
    <el-row style="height:40px;line-height:40px;border: 1px solid black;">
        <el-col :span="24">
            <el-button size="small">确认</el-button>
            <el-button size="small">编辑表单</el-button>
            <el-button size="small">返回列表</el-button>
        </el-col>
    </el-row>
</div>
</body>
<script>
    new Vue({
        el: '#abc',
        data () {
            return {

            }
        },
        //页面加载成功时完成
        mounted: function(){


        },
        /*方法函数  事件等*/
        methods: {


        }
    });

</script>

</html>
