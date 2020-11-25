
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电子竞价管理</title>
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

    <template>
        <el-tabs v-model="activeName" type="card">
            <el-tab-pane label="进行中" name="first">
                <template>

                        <el-button type="primary">新增</el-button>

                    <el-form :inline="true" :model="formInline" class="demo-form-inline">
                        <el-form-item label="项目名称:">
                            <el-input v-model="formInline.user"></el-input>
                        </el-form-item>
                        <el-form-item label="项目编号:">
                            <el-input v-model="formInline.user"></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="onSubmit">查询</el-button>
                        </el-form-item>
                    </el-form>

                    <!-- 表格开始 -->
                    <el-table
                            :data="electronicTableData"
                            border
                            style="width: 100%">
                        <el-table-column
                                prop="date"
                                label="项目编号"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="项目名称"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="竞价开始时间">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="竞价结束时间">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="竞价规则">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="启动状态">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="竞价方式">
                        </el-table-column>
                        <el-table-column
                                label="操作">
                            <template slot-scope="scope">
                                <el-button @click="handleClick(scope.row)" type="text" size="small">竞价终止</el-button>
                                <el-button @click="handleClick(scope.row)" type="text" size="small">设置规则</el-button>
                                <el-button @click="handleClick(scope.row)" type="text" size="small">竞价记录单</el-button>
                            </template>
                        </el-table-column>
                    </el-table>
                    <!-- 表格结束 -->
                </template>
            </el-tab-pane>
            <el-tab-pane label="已结束" name="second">已结束</el-tab-pane>
        </el-tabs>
    </template>

    <el-button type="text" @click="bidRules = true">点击打开竞价规则设置</el-button>
    <el-button type="text" @click="info = true">标的信息列表</el-button>
    <el-button type="text" @click="sign = true">标的规则设置</el-button>

    <!-- 竞价规则设置开始 -->
    <el-dialog
            title="竞价规则设置"
            :visible.sync="bidRules"
            width="70%"
            :before-close="handleClose">
        <el-form :inline="true" :label-position="labelPosition" label-width="180px" :model="formInline">
            <el-form-item label="审批人">
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
            <el-form-item label="自由竞价时长（秒）" >
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
            <br>
            <el-form-item label="延时竞价时长（秒）">
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
            <el-form-item label="竞价标的间隔长（秒）">
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
            <el-button @click="bidRules = false">取 消</el-button>
            <el-button type="primary" @click="bidRules = false">确 定</el-button>
        </span>
    </el-dialog>
    <!-- 竞价规则设置结束 -->

    <!-- 标的信息列表开始 -->
    <el-dialog
            title="标的信息列表"
            :visible.sync="info"
            width="70%"
            :before-close="handleClose">
            <el-table
                    :data="electronicTableData"
                    border
                    style="width: 100%">
                <el-table-column
                        prop="date"
                        label="序号">
                </el-table-column>
                <el-table-column
                        prop="date"
                        label="标的名称"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="date"
                        label="保证金(元)"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="date"
                        label="起始价">
                </el-table-column>
                <el-table-column
                        prop="date"
                        label="是否有保留价"
                        width="130">
                </el-table-column>
                <el-table-column
                        prop="date"
                        label="保留价">
                </el-table-column>
                <el-table-column
                        prop="date"
                        label="加价幅度"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="date"
                        label="报价单位"
                        width="100">
                </el-table-column>
                <el-table-column
                        label="操作">
                </el-table-column>
            </el-table>
        <span slot="footer" class="dialog-footer">
            <el-button @click="info = false">取 消</el-button>
            <el-button type="primary" @click="info = false">确 定</el-button>
        </span>
    </el-dialog>
    <!-- 标的信息列表结束 -->


    <!-- 标的规则设置开始 -->
    <el-dialog
            title="标的规则设置"
            :visible.sync="sign"
            width="70%"
            :before-close="handleClose">

        <el-form :inline="true" :label-position="labelPosition" label-width="180px" :model="formInline">
            <el-form-item label="审批人">
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
            <br>
            <el-form-item label="竞价模式">
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
            <el-form-item label="竞价方式">
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
            <br>
            <el-form-item label="优先权使用方式">
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
            <el-form-item label="优先权确认时长（秒）">
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
            <br>
            <el-form-item label="优先权竞买人">
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
            <br>
            <el-form-item label="报价单位">
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
            <el-form-item label="报价小数点设置">
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
            <br>
            <el-form-item label="保留价">
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
            <el-form-item label="手续费">
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
            <br>
            <el-form-item label="起始价">
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
            <el-form-item label="加价幅度">
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
            <br>
            <el-form-item label="竞价开始时间">
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
            <el-form-item label="竞价结束时间">
                <el-input v-model="formInline.user"></el-input>
            </el-form-item>
        </el-form>





        <span slot="footer" class="dialog-footer">
            <el-button @click="sign = false">取 消</el-button>
            <el-button type="primary" @click="sign = false">确 定</el-button>
        </span>
    </el-dialog>
    <!-- 标的规则设置结束 -->



</div>

</body>


<style>
    .el-header {
        background-color: #B3C0D1;
        color: #333;
        text-align: left;
        line-height: 60px;
    }
    .el-footer {
        text-align: center;
    }
</style>
<script>
    new Vue({
        el: '#abc',
        /*变量*/
        data () {

            return {

                activeName: 'first',
                electronicTableData:[],
                formInline: {
                    user: '',
                    region: ''
                },
                labelPosition:"right",
                bidRules:false,
                info:false,
                sign:false,
            }
        },
        //页面加载成功时完成
        mounted: function(){
            var _this = this;
            axios
                .post('/electronic/electronicTable')
                .then(function (res) {
                    _this.electronicTableData = res.data;
                })

        },
        /*方法函数  事件等*/
        methods: {
            onSubmit() {
                console.log('submit!');
            },
            handleClose(){

            }

        }
    });

</script>

</html>
