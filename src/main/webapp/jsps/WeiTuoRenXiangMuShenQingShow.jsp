<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-11-26
  Time: 上午 9:27
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
    <el-button type="primary" @click="OnApplyFor">项目交易申请</el-button>
    <div style="height: 20px"></div>
    <template>

        <el-table :data="pbItemApplyInfoList"  border style="width: 100%">

            <el-table-column prop="itemName" label="项目名称"></el-table-column>

            <el-table-column prop="itemDepName" label="项目主管部门" > </el-table-column>

            <el-table-column prop="delegateName" label="委托方名称"> </el-table-column>

            <el-table-column  prop="delegateMan" label="委托方联系人"> </el-table-column>

            <el-table-column  prop="delegatePhone" label="委托方联系电话"> </el-table-column>

            <el-table-column prop="itemSummary" label="交易项目简要情况"> </el-table-column>

            <el-table-column prop="createTime" label="创建时间"> </el-table-column>

            <el-table-column  label="状态">

                <template slot-scope="scope">

                    <span style="color: chocolate" v-if="scope.row.auditState==='0'">
                      正在审核中……
                    </span>


                   <span style="color: red" v-else-if="scope.row.auditState==='3'">
                           <el-button type="text" @click="IcolpAs(scope.$index, scope.row)" >被回退（点击展示意见）</el-button>
                   </span>

                    <span style="color: chocolate" v-else="">
                      不要着急哦🤭
                   </span>


                </template>

            </el-table-column>

            <el-table-column label="操作">
                <template slot-scope="scope">

                        <el-button size="mini" type="danger" @click="handleEditOne(scope.$index, scope.row)">
                            查看
                        </el-button>

                    <span style="color: red" v-if="scope.row.auditState==='3'">
                        <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">
                            删除
                        </el-button>
                   </span>



                </template>
            </el-table-column>

        </el-table>
    </template>


    <el-dialog title="查看详情" :visible.sync="dialogFormVisible">

        <el-form :inline="true" :model="pbItemApplyInfo" label-width="130px">
            <el-form-item label="项目名称">
                <el-input v-model="pbItemApplyInfo.itemName" readOnly placeholder=""></el-input>
            </el-form-item>
        </el-form>

        <el-form :inline="true" :model="pbItemApplyInfo" class="demo-form-inline" label-width="130px">
            <el-form-item label="项目主管部门">
                <el-input v-model="pbItemApplyInfo.itemDepName" readOnly placeholder=""></el-input>
            </el-form-item>
            <el-form-item label="委托人名称">
                <el-input v-model="pbItemApplyInfo.delegateName" readOnly placeholder=""></el-input>
            </el-form-item>
        </el-form>


        <el-form :inline="true" :model="pbItemApplyInfo"  label-width="130px">

            <el-form-item label="委托方联系人">
                <el-input v-model="pbItemApplyInfo.delegateMan" readOnly placeholder=""></el-input>
            </el-form-item>
            <el-form-item label="委托方联系电话">
                <el-input v-model="pbItemApplyInfo.delegatePhone" readOnly placeholder=""></el-input>
            </el-form-item>

        </el-form>

        <el-form :inline="true" :model="pbItemApplyInfo" label-width="130px">
            <el-form-item label="交易项目简要情况">
                <el-input type="textarea" readOnly  v-model="pbItemApplyInfo.itemSummary"></el-input>
            </el-form-item>

        </el-form>

    </el-dialog>


</div>
</body>
</html>
<script>
    new Vue({
        el:"#app",
        data(){
            return{
                pbItemApplyInfoList:[],
                dialogFormVisible: false,
                pbItemApplyInfo: {
                },
                formLabelWidth: '120px'
            };

        },
        //页面加载成功时完成
        mounted: function(){
            var _this=this;
            axios
                .post('/PbItemApplyInfoCon/PbItemApplyInfoAll',)
                .then(function (res) {
                        console.log(res.data.data)
                    _this.pbItemApplyInfoList = res.data.data
                })

        },
        /*方法函数  事件等*/
        methods: {
            //查询单条记录
            handleEditOne(index,row) {
                var _this=this;
                this.dialogFormVisible= true
                axios
                    .post('/PbItemApplyInfoCon/pbItemApplyInfoSelectOne',{
                        seqId:row.seqId
                    })
                    .then(function (res) {
                        console.log(res.data.data)
                        _this.pbItemApplyInfo = res.data.data
                    })

            },

            //删除
            handleDelete(index, row) {
                axios
                    .post('/PbItemApplyInfoCon/PbItemApplyInfoDel',{
                        seqId:row.seqId
                    })
                this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
                }).then(() => {
                    this.$message({
                        type: 'success',
                        message: '删除成功'

                    }),5000,location.reload();
                }).catch(() => {
                    this.$message({
                        type: 'info',
                        message: '已取消删除'
                    });
                });
            },

            //弹出意见
            IcolpAs(index,row){
                    this.$alert('项目不合格请重新申请', '处长意见', {
                        confirmButtonText: '确定',
                        callback: action => {
                            this.$message({
                                type: 'info',
                                message: '请重新申请'
                            });
                        }
                    });
            },
            OnApplyFor:function () {
                location.href="/jsps/XiangMuShenQing.jsp";
            }
        }
    })


</script>