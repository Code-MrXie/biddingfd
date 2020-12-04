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


        <el-table :data="pbItemApplyInfoList" label-width="80px"  border style="width: 100%">

            <el-table-column prop="itemName" label="项目名称"></el-table-column>

            <el-table-column prop="itemDepName" label="项目主管部门" > </el-table-column>

            <el-table-column prop="delegateName" label="委托方名称"> </el-table-column>

            <el-table-column  prop="delegateMan" label="委托方联系人"> </el-table-column>

            <el-table-column  prop="delegatePhone" label="委托方联系电话"> </el-table-column>

            <el-table-column prop="itemSummary" label="交易项目简要情况"> </el-table-column>

            <el-table-column prop="createTime" label="创建时间"> </el-table-column>

            <el-table-column label="操作">
                <template slot-scope="scope">

                      <span style="color: seagreen" v-if="scope.row.itemLeaderId=='0'">
                        <el-button size="mini" type="success" @click="handleFenPei(scope.$index, scope.row)">
                            分配
                        </el-button>
                      </span>
                    <span style="color: seagreen" v-else="">
                        <el-button size="mini" type="success" @click="ChaKan(scope.$index, scope.row)">
                            已分配
                        </el-button>
                      </span>
                </template>
            </el-table-column>

        </el-table>

    </template>


    <el-dialog title="分配" :visible.sync="dialogFormVisible" width="300px" >

            <el-select v-model="one"  >

                <el-option v-for="xia in XiaLaform" :label="xia.userName" :value="xia.id"></el-option>

            </el-select>


        <div slot="footer" class="dialog-footer">

            <el-button @click="dialogFormVisible = false">取 消</el-button>

            <el-button type="primary" @click="SuccessFenPei()">确定</el-button>

        </div>

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
                timer:'',
                dialogFormVisible: false,
                XiaLaform:{},
                one:'',
                Rowid:''
            }
        },
        //页面加载成功时完成
        mounted: function(){
            var _this=this;
            //setTimeout("alert('三十秒钟到！')",30000)
            //定时刷新  30秒一次
            setInterval(_this.showAll,30000)

            //调用查询全部的方法
            _this.showAll();
        },
        /*方法函数  事件等*/
        methods: {


            showAll:function(){
                let _this=this;
                axios
                    .post('/PbItemApplyInfoCon/PbItemApplyInfoStatusToTWO')
                    .then(function (res) {
                        console.log(res.data.data)
                        _this.pbItemApplyInfoList = res.data.data
                    })
            },


            //分配
            handleFenPei (index,row) {
                 var _this = this
                _this.Rowid=row.seqId;
                // console.log(row.seqId)
                this.dialogFormVisible= true
                axios
                    .post('/PbItemApplyInfoCon/userSelect',{
                        seqId:row.seqId
                    })
                    .then(function (res) {
                    console.log(res.data.data)
                    _this.XiaLaform = res.data.data
                })
            },

            SuccessFenPei(){
                var _htat =  this;

                //项目申请id
                console.log()
                //分配负责人ID
                console.log()
                axios
                    .post('/PbItemApplyInfoCon/PbItemApplyInfoSuccessFenPei',{
                        seqId:_htat.Rowid,
                        userId:_htat.one
                    })
                    .then(function (res) {
                        location.reload();
                    })
            }
        }
    })


</script>
