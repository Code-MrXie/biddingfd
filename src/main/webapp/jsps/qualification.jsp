
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
<div id="qualification">

    <template>
        <el-tabs v-model="activeName" type="card">
            <el-tab-pane label="未办理" name="first">
                <el-table
                        :data="qualilficationTableData"
                        border
                        style="width: 100%">
                    <el-table-column
                            prop="item_code"
                            label="项目编号">
                    </el-table-column>
                    <el-table-column
                            prop="item_code"
                            label="项目名称">
                    </el-table-column>
                    <el-table-column
                            prop="item_code"
                            label="标的名称">
                    </el-table-column>
                    <el-table-column
                            prop="item_code"
                            label="资源类型">
                    </el-table-column>
                    <el-table-column
                            prop="item_code"
                            label="出让方式">
                    </el-table-column>
                    <el-table-column
                            prop="item_code"
                            label="竞价开始时间">
                    </el-table-column>
                    <el-table-column
                            prop="item_code"
                            label="竞价结束时间">
                    </el-table-column>
                    <el-table-column
                            prop="item_code"
                            label="操作">
                    </el-table-column>
                </el-table>
            </el-tab-pane>
            <el-tab-pane label="已办理" name="second">
            </el-tab-pane>
        </el-tabs>
    </template>
</div>
</body>


<script>
    new Vue({
        el: '#qualification',
        /*变量*/
        data () {
            return {
                activeName: 'first',
                qualilficationTableData:[],

            }
        },
        //页面加载成功时完成
        mounted: function(){
            var _this = this;
            axios
                .post('/pb-item-info/electronicTable')
                .then(function (res) {
                    _this.qualilficationTableData = res.data;
                })

        },
        /*方法函数  事件等*/
        methods: {


        }
    });

</script>

</html>
