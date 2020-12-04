<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div>
    <div>
        <el-col :span="4" style="font-size: 15px">
            &nbsp;
        </el-col>
        <el-col :span="19" style="font-size: 15px">
            <span style="font-size: 30px">合同</span>
        </el-col>
    </div>
    <div>
        <el-row style="margin: 20px 0px 0px 20px">
            <el-col :span="4" style="font-size: 15px">
                &nbsp;
            </el-col>
            <el-col :span="2" style="font-size: 15px">
                项目名称：
            </el-col>
            <el-col :span="6" style="width: 200px">
                <el-input v-model="fileList.item_name" placeholder="请输入内容"></el-input>
            </el-col>
            <el-col :span="2" style="font-size: 15px">
                批文名称或编号：
            </el-col>
            <el-col :span="6" style="width: 200px">
                <el-input v-model="fileList.item_code" placeholder="请输入内容"></el-input>
            </el-col>
            <el-col :span="4" style="font-size: 15px">
                &nbsp;
            </el-col>
        </el-row>
        <el-row style="margin: 20px 0px 0px 20px">
            <el-col :span="4" style="font-size: 15px">
                &nbsp;
            </el-col>
            <el-col :span="2" style="font-size: 15px">
                标段类型：
            </el-col>
            <el-col :span="6" style="width: 200px">
                <el-input v-model="fileList.item_name" placeholder="请输入内容"></el-input>
            </el-col>
            <el-col :span="2" style="font-size: 15px">
                资源类型：
            </el-col>
            <el-col :span="6" style="width: 200px">
                <el-input v-model="fileList.resource_type" placeholder="请输入内容"></el-input>
            </el-col>
            <el-col :span="4" style="font-size: 15px">
                &nbsp;
            </el-col>
        </el-row>
        <el-row style="margin: 20px 0px 0px 20px">
            <el-col :span="4" style="font-size: 15px">
                &nbsp;
            </el-col>
            <el-col :span="2" style="font-size: 15px">
                合同上报时间：
            </el-col>
            <el-col :span="6" style="width: 200px">
                <el-input v-model="fileList.apply_start_time" placeholder="请输入内容"></el-input>
            </el-col>
            <el-col :span="2" style="font-size: 15px">
                竞价开始时间：
            </el-col>
            <el-col :span="6" style="width: 200px">
                <el-input v-model="fileList.bid_start_time" placeholder="请输入内容"></el-input>
            </el-col>
            <el-col :span="4" style="font-size: 15px">
                &nbsp;
            </el-col>
        </el-row>
        <el-row style="margin: 20px 0px 0px 20px">
            <el-col :span="4" style="font-size: 15px">
                &nbsp;
            </el-col>
            <el-col :span="2" style="font-size: 15px">
                合同上传：
            </el-col>
            <el-col :span="16" style="width: 200px">
                <el-button @click="examine" type="success" plain >查看合同</el-button>
            </el-col>

            <el-col :span="2" style="width: 200px">

            </el-col>

        </el-row>
    </div>
</div>
