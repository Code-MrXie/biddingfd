<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-11-26
  Time: 下午 6:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="files.jsp"%>
</head>
<body>

<div id="app">

    <template>


        <el-table :data="pbItemApplyInfoList"  border style="width: 100%">

            <el-table-column prop="itemName" label="项目名称"></el-table-column>

            <el-table-column prop="itemDepName" label="项目主管部门" > </el-table-column>

            <el-table-column prop="delegateName" label="委托方名称"> </el-table-column>

            <el-table-column  prop="delegateMan" label="委托方联系人"> </el-table-column>

            <el-table-column  prop="delegatePhone" label="委托方联系电话"> </el-table-column>

            <el-table-column prop="itemSummary" label="交易项目简要情况"> </el-table-column>

            <el-table-column prop="createTime" label="创建时间"> </el-table-column>

            <el-table-column label="操作">
                <template slot-scope="scope">
                    <el-button
                            size="mini"
                            @click="handleEdit(scope.$index, scope.row)">通过
                    </el-button>

                    <span style="color: red" v-if="scope.row.auditState==='2'">
                            <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">
                                回退
                            </el-button>
                        </span>
                </template>
            </el-table-column>

        </el-table>
    </template>
</div>
</body>
</html>
<script>
    new Vue({
        el:"#app",
        data(){
            return{
                pbItemApplyInfoList:[],
                timer:''

            }
        },
        //页面加载成功时完成
        mounted: function(){
            var _this=this;

            //定时刷新
           setInterval(_this.showAll,10000)

            //调用查询全部的方法
            _this.showAll();
        },
        /*方法函数  事件等*/
        methods: {


            showAll:function(){
                let _this=this;
                axios
                    .post('/PbItemApplyInfoCon/PbItemApplyInfoStatusToOne')
                    .then(function (res) {
                        console.log(res.data.data)
                        _this.pbItemApplyInfoList = res.data.data
                    })
            },

            //回退
            handleDelete(index, row) {
                console.log(row.seqId)
                axios
                    .post('/PbItemApplyInfoCon/PbItemApplyInfoDel',{
                        seqId:row.seqId
                    })
                    .then(function (res) {
                        alert("回退！")
                    })
            },

        }
    })


</script>
