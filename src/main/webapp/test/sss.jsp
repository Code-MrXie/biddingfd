<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div>
    <el-row style="margin: 20px 0px 0px 20px">
        <el-col :span="2" style="font-size: 15px">
            标段名称：
        </el-col>
        <el-col :span="6">
            <el-input v-model="input" placeholder="请输入内容"></el-input>
        </el-col>
        <el-col :span="2" style="font-size: 15px">
            项目编号：
        </el-col>
        <el-col :span="6">
          <el-input v-model="input" placeholder="请输入内容"></el-input>
        </el-col>
        <el-col :span="2">
              &nbsp;
        </el-col>
        <el-col :span="6">
            <el-button type="primary" icon="el-icon-search" @click="likeselectuser()">搜索</el-button>
        </el-col>
    </el-row>
</div>

<div>
    <template>
        <el-table
                :data="fileList"
                border
                style="width: 100%">
            <el-table-column
                    prop="item_code"
                    label="项目编号">
            </el-table-column>
            <el-table-column
                    prop="item_name"
                    label="项目名称"
            >
            </el-table-column>
            <el-table-column
                    prop="object_name"
                    label="标段名称">
            </el-table-column>
            <el-table-column
                    prop="resource_type"
                    label="资源类型">
            </el-table-column>
            <el-table-column
                    prop="trad_way"
                    label="出让方式">
            </el-table-column>

            <el-table-column
                    fixed="right"
                    label="操作"
                    width="300"
                    align="center">
                <template slot-scope="scope" style="align-content: center">
                    <el-button type="primary" plain @click="transaction(scope.row.item_id)">办理</el-button>
                </template>
            </el-table-column>
        </el-table>
    </template>
</div>

