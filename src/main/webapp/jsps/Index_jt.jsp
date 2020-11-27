<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/25
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成交结果录入办理</title>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-tab.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/table/bootstrap-table.css">

    <script src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap-table-zh-CN.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap-tab.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap/table/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
    <!-- 引入组件库 -->
    <script src="${pageContext.request.contextPath }/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>
</head>
<style type="text/css">
    .tab { height:23px;}
    .tab ul { list-style:none; }
    .tab li { border:1px solid #ccc; background:#eee; cursor:pointer; display:block; float:left; text-align:center; text-decoration:none; width:68px; font-size:12px; height:21px; line-height:21px; margin:0 2px; position:relative; top:1px; z-index:9; }
    .tab li:hover { text-decoration:underline; }
    .tab li.curr { background:#fff; border-bottom-color:#fff; cursor:default; font-weight:bold; }
    .cc { border:1px solid #ccc; padding:100px; width:1200px;}
</style>

<body>
<div id="divUserInfo">
    <div class="tab">
        <ul>
            <li id="a1" onclick="setTab('a',1,3)" class="curr">tab_01</li>
            <li id="a2" onclick="setTab('a',2,3)">tab_02</li>
            <li id="a3" onclick="setTab('a',3,3)">tab_03</li>
        </ul>
    </div>
    <div id="con_a_1" class="cc">
        <div style="width: 600px;height: 50px">
            项目名称：<input v-model="itemName">
            项目编号：<input v-model="itemCode">
            <input type="button" value="查询" @click="submit">
        </div>
        <div>
            <table id="testTable"></table>
        </div>
    </div>
    <div id="con_a_2" class="cc" style="display:none;">
        22<br />222<br />222<br />222
    </div>
    <div id="con_a_3" class="cc" style="display:none;">
        33<br />333<br />333<br />333
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $("#testTable").bootstrapTable({
            url : "${pageContext.request.contextPath}/pb-item-info/testTable",
            method : 'post',// 提交方式
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",// 发送到服务器的编码类型
            pageNumber : 1,
            pageSize : 7,
            //search: true,//开启table自带的查询
            sortName : 'id',
            sortOrder : 'asc',
            height: $(window).height()/2,
            pagination : true,// 开启分页
            sidePagination : "client",// 分页方式 'client'为客户端分页
            cache : false,// 是否使用缓存
            columns : [
                {
                    field : 'itemCode',
                    title : '项目编号',
                },
                {
                    field : 'itemName',
                    title : '项目名称',
                },
                {
                    field : 'resourceType',
                    title : '资源类型'
                },
                {
                    field : 'tradWay',
                    title : '出让方式'
                },
                {
                    field : 'applyStartTime',
                    title : '报名开始时间'
                },
                {
                    field : 'applyEndTime',
                    title : '报名结束时间'
                },
                {
                    field : 'otherDeal',
                    title : '办理事项'
                },
                {
                    field : '',
                    title : '状态与流程图'
                },
                {
                    title : '操作'
                }
            ]
        });
    })
    function setTab(name,cursel,n){
        for(i=1;i<=n;i++){
            var menu=document.getElementById(name+i);
            var con=document.getElementById("con_"+name+"_"+i);
            menu.className=i==cursel?"curr":"";
            con.style.display=i==cursel?"block":"none";
        }
    }
    var vm = new Vue({
        el : "#divUserInfo",
        data () {
            return {
                itemName: "",
                itemCode : ""
            }
        },
        methods:{
            submit : function () {
                var itemName=this.itemName;
                var itemCode=this.itemCode;
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/pb-item-info/testTable",
                    data:{
                        itemName:itemName,itemCode:itemCode
                    },
                    dataType:"json",
                    success:function(data){
                        $("#testTable").bootstrapTable('load',data);
                    }
                });
            }
        }
    });
</script>
</html>
