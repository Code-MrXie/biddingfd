<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-11-25
  Time: 下午 1:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="files.jsp"%>

</head>
<body>
<div id="abc">


    <h2 style="left: 30px">台州市公共资源拓展项目交易申请书</h2>
    <el-form :inline="true" :model="pbItemApplyInfo" label-width="130px">
        <el-form-item label="项目名称">
            <el-input v-model="pbItemApplyInfo.itemName" placeholder=""></el-input>
        </el-form-item>
    </el-form>

    <el-form :inline="true" :model="pbItemApplyInfo" class="demo-form-inline" label-width="130px">
            <el-form-item label="项目主管部门">
                <el-input v-model="pbItemApplyInfo.itemDepName" placeholder=""></el-input>
            </el-form-item>
            <el-form-item label="委托人名称">
                <el-input v-model="pbItemApplyInfo.delegateName" placeholder=""></el-input>
            </el-form-item>
    </el-form>


    <el-form :inline="true" :model="pbItemApplyInfo" label-width="130px">

        <el-form-item label="委托方联系人">
            <el-input v-model="pbItemApplyInfo.delegateMan" placeholder=""></el-input>
        </el-form-item>
        <el-form-item label="委托方联系电话">
            <el-input v-model="pbItemApplyInfo.delegatePhone" placeholder=""></el-input>
        </el-form-item>

    </el-form>

    <el-form :inline="true" :model="pbItemApplyInfo" label-width="130px">
        <el-form-item label="交易项目简要情况">
            <el-input type="textarea" v-model="pbItemApplyInfo.itemSummary"></el-input>
        </el-form-item>

    </el-form>

    <el-row >
        <el-button type="success" @click="onSubmit" plain>提交</el-button>
        <el-button type=""  plain>重置</el-button>
        <el-button type="info" @click="onReturna" plain>返回</el-button>
    </el-row>

</div>


</body>
</html>
<script>
new Vue({
    el:"#abc",
    data() {
        return {
            pbItemApplyInfo: {
                itemName: '',
                itemDepName: '',
                delegateName:'',
                delegateMan:'',
                delegatePhone:'',
                itemSummary:''
            }
        }
    },
    methods: {
        onSubmit() {
            var _that=this;

            if(_that.pbItemApplyInfo.itemName == ""){
                alert("请输入你的项目名称");
                return false;
            }

            axios
                .post('/PbItemApplyInfoCon/PbItemApplyInfoAdd',_that.pbItemApplyInfo)
                .then(function (res) {
                    console.log(res.data.msg)
                    if(res.data.msg==0){

                        alert("项目申请已提交")
                        location.href="/jsps/XiangMuShenQingShow.jsp";
                    }else {
                        alert("项目名称名称重复，请重新输入！")

                       _that.pbItemApplyInfo.itemName = '';
                    }
                })

        },
        onReturna:function(){
            location.href="/jsps/XiangMuShenQingShow.jsp";
        }
    }
})


</script>