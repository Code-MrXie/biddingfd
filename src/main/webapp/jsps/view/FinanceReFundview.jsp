<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <el-form :model="biddingForm" :rules="rules" ref="biddingForm" label-width="100px" class="demo-biddingForm">
        <el-row type="flex" class="row-bg">
            <el-col :span="7">
                <el-form-item label="项目名称" prop="itemName">
                    <el-input type="text" v-model="biddingForm.itemName"
                              placeholder="项目名称"></el-input>
                </el-form-item>
            </el-col>
            <el-col :span="7">
                <el-form-item label="资源类型" prop="resourceType">
                    <el-select v-model="biddingForm.resourceType" placeholder="资源类型">
                        <el-option
                                v-for="item in options"
                                :key="item.value"
                                :label="item.label"
                                :value="item.value">
                        </el-option>
                    </el-select>
                </el-form-item>
            </el-col>
            <el-row :span="4">
                <el-form-item>
                    <el-button type="primary" style="width: 150px;" @click="selectPbItemInfo()">查询</el-button>
                </el-form-item>
            </el-row>
        </el-row>
    </el-form>
</div>
<div class="tableDiv">
    <el-table
            highlight-current-row
            border
            :data="tableData.data"
            style="width: 100%;height: 78vh;">
        <el-table-column align="left" prop="itemCode" label="项目编号" show-overflow-tooltip></el-table-column>
        <el-table-column align="left" prop="itemName" label="项目名称" width="180px" show-overflow-tooltip></el-table-column>
        <el-table-column align="left" prop="objectName" label="标的名称" show-overflow-tooltip></el-table-column>
        <el-table-column align="left" prop="bidName" label="竞买人"  show-overflow-tooltip></el-table-column>
        <el-table-column align="left" prop="trad" label="出让方式" :formatter="formatterTrad" show-overflow-tooltip></el-table-column>
        <el-table-column align="left" prop="resourceType"  label="资源类型" :formatter="formatter" show-overflow-tooltip></el-table-column>
        <el-table-column align="left" prop="applyStartTime" label="报名开始时间" width="200px" show-overflow-tooltip></el-table-column>
        <el-table-column align="left" prop="depositTime" label="保证金缴纳截止时间" width="200px" show-overflow-tooltip></el-table-column>
        <el-table-column align="left" prop="bidStartTime" label="竞价开始时间" width="200px" show-overflow-tooltip></el-table-column>
        <el-table-column  label="操作" width="150px">
            <template slot-scope="scope">
                <el-button v-if="scope.row.isReturn == 0"
                           @click.native.prevent="returnPayTheDeposit(scope.row,scope.$index)"
                           type="text"
                           size="mini">
                    退保证金
                </el-button>
                <el-button  v-if="scope.row.isReturn == 1"
                        @click.native.prevent="TerminationUpstream(scope.row,scope.$index)"
                        type="text"
                        size="mini">
                    查看详情
                </el-button>
            </template>
        </el-table-column>
    </el-table>
    <el-pagination style="text-align: center"
                   @size-change="handleSizeChange"
                   @current-change="handleCurrentChange"
                   :current-page.sync="currentPage"
                   :page-sizes="pageSizes"
                   :page-size="pageSize"
                   layout="total, sizes, prev, pager, next, jumper"
                   :total="total">
    </el-pagination>

</div>

