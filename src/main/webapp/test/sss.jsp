<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<span style="font-size: large">公共资源-竞价-项目登记</span>
<el-container style="height: 650px;border: 1px solid black" >
<el-header style="height: 40px;line-height:40px;background-color: #8cc5ff">项目信息</el-header>
    <el-main>
        <div class="block" style="height:300px;width: 80%">
            <div style="height:100%;width:100%">
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">项目名称</div></el-col>
                    <el-col :span="10"><div class="grid"><el-input style="width: 300px" v-model="itemInfo.itemName"/></div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid">项目编号</div></el-col>
                    <el-col :span="6"><div class="grid "><el-input style="width: 200px" v-model="itemInfo.itemCode"/></div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">所属地区</div></el-col>
                    <el-col :span="10"><div class="grid"><el-input style="width: 300px" v-model="itemInfo.itemArea"/></div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid">交易方式</div></el-col>
                    <el-col :span="6"><div class="grid "><el-input style="width: 200px" v-model="itemInfo.tradWay"/></div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">出让方</div></el-col>
                    <el-col :span="20"><div class="grid "><el-input style="width: 600px" v-model="itemInfo.transferor"/></div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">出让方联系人</div></el-col>
                    <el-col :span="10"><div class="grid"><el-input style="width: 200px" v-model="itemInfo.transferorMan"/></div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid">出让方联系电话</div></el-col>
                    <el-col :span="6"><div class="grid "><el-input style="width: 200px" v-model="itemInfo.transferorPhone"/></div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">出让方联系地址</div></el-col>
                    <el-col :span="20"><div class="grid "><el-input style="width: 600px" v-model="itemInfo.transferorAddr"/></div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">保证金缴纳方式</div></el-col>
                    <el-col :span="10"><div class="grid">
                        <el-radio v-model="itemInfo.depositPayWay" label="1">线下</el-radio>
                        <el-radio v-model="itemInfo.depositPayWay" label="2">线上</el-radio>(目前仅支持线下缴纳)</div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid">资格审查方式</div></el-col>
                    <el-col :span="6"><div class="grid ">
                        <el-select v-model="itemInfo.qualExamWay" placeholder="请选择">
                            <el-option label="资格前审" value="1">资格前审</el-option>
                            <el-option label="资格后审" value="2">资格后审</el-option>
                        </el-select>
                    </div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                <el-col :span="4" class="mingcheng"><div class="grid">保证金缴纳截止时间</div></el-col>
                <el-col :span="10"><div class="grid">

                    <el-date-picker
                            v-model="itemInfo.depositTime"
                            type="date"
                            placeholder="选择日期">
                    </el-date-picker>
                </div></el-col>
                <el-col :span="4" class="mingcheng"><div class="grid"></div></el-col>
                <el-col :span="6"><div class="grid "></div></el-col>
            </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">报名开始时间</div></el-col>
                    <el-col :span="10"><div class="grid">
                        <el-date-picker
                            v-model="itemInfo.applyStartTime"
                            type="date"
                            placeholder="选择日期">
                    </el-date-picker></div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid">报名结束时间</div></el-col>
                    <el-col :span="6"><div class="grid ">
                        <el-date-picker
                                v-model="itemInfo.applyEndTime"
                                type="date"
                                placeholder="选择日期">
                        </el-date-picker>
                    </div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">代理机构</div></el-col>
                    <el-col :span="20"><div class="grid "><el-input style="width: 600px" v-model="itemInfo.agentName"/></div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">保证金收取单位</div></el-col>
                    <el-col :span="10"><div class="grid">
                        <el-select v-model="itemInfo.depositCharge" placeholder="请选择">
                            <el-option label="元" value="1">元</el-option>
                            <el-option label="万元" value="2">万元</el-option>
                        </el-select>
                    </div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid">开户名称</div></el-col>
                    <el-col :span="6"><div class="grid "><el-input style="width: 200px" v-model="itemInfo.accountName"/></div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">开户行</div></el-col>
                    <el-col :span="10"><div class="grid"><el-input style="width: 300px" v-model="itemInfo.bankName"/></div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid">开户账号</div></el-col>
                    <el-col :span="6"><div class="grid "><el-input style="width: 200px" v-model="itemInfo.bankCode"/></div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">联系人</div></el-col>
                    <el-col :span="10"><div class="grid"><el-input style="width: 300px" v-model="itemInfo.linkMan"/></div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid">联系方式</div></el-col>
                    <el-col :span="6"><div class="grid "><el-input style="width: 200px" v-model="itemInfo.linkPhone"/></div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" style="text-align: center;background-color: #e8e8e8;">
                        <div style=" height: 70px;line-height: 70px;border: 1px solid #82848a;">标的物情况</div></el-col>
                    <el-col :span="20"><div class="grid "><el-input
                            type="textarea"
                            :rows="2"
                            placeholder="请输入内容"
                            v-model="itemInfo.objectSituation">
                    </el-input></div></el-col>
                </el-row>
            </div>
        </div>
    </el-main>
</el-container>

<el-container style="height: 480px;border: 1px solid black;margin-top: 10px">
    <el-header style="height: 40px;line-height:40px;background-color: #8cc5ff">竞价信息</el-header>
    <el-main>
        <div class="block" style="height:300px;width: 80%">
            <div style="height:100%;width:100%">
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">竞买人类别</div></el-col>
                    <el-col :span="20"><div class="grid ">
                        <el-select placeholder="请选择">
                            <el-option label="仅限企业" value="1"></el-option>
                    </el-select></div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">竞买人资格要求</div></el-col>
                    <el-col :span="20"><div class="grid "><el-input
                            type="textarea"
                            :rows="1"
                            placeholder="请输入内容"
                            v-model="itemInfo.bidderQual">
                    </el-input></div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">在外网展示时间和地点</div></el-col>
                    <el-col :span="10"><div class="grid"><el-select v-model="itemInfo.isShow" placeholder="请选择">
                        <el-option label="是" value="1"></el-option>
                        <el-option label="否" value="2"></el-option>
                    </el-select></div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid">竞价形式</div></el-col>
                    <el-col :span="6"><div class="grid "><el-select v-model="itemInfo.bidWay" placeholder="请选择">
                        <el-option label="元" value="1">元</el-option>
                    </el-select></div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">报价方式</div></el-col>
                    <el-col :span="10"><div class="grid"><el-select v-model="itemInfo.applyWay" placeholder="请选择">
                        <el-option label="加价" value="1"></el-option>
                        <el-option label="减价" value="2"></el-option>
                    </el-select></div></el-col>
                    <el-col :span="4" class="mingcheng"><div class="grid">成交方式</div></el-col>
                    <el-col :span="6"><div class="grid "><el-select v-model="itemInfo.dealWay" placeholder="请选择">
                        <el-option label="线下" value="1"></el-option>
                        <el-option label="线上" value="2"></el-option>
                    </el-select></div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid"></div></el-col>
                    <el-col :span="20"><div class="grid "></div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">付款方式</div></el-col>
                    <el-col :span="20"><div class="grid "><el-input style="width: 600px" v-model="itemInfo.paymentWay"/></div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">报名须知</div></el-col>
                    <el-col :span="20"><div class="grid "><el-input
                            type="textarea"
                            :rows="1"
                            placeholder="请输入内容"
                            v-model="itemInfo.applyNotice">
                    </el-input></div></el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="4" class="mingcheng"><div class="grid">其他事项</div></el-col>
                    <el-col :span="20"><div class="grid "><el-input
                            type="textarea"
                            :rows="1"
                            placeholder="请输入内容"
                            v-model="itemInfo.otherDeal">
                    </el-input></div></el-col>
                </el-row>
            </div>
        </div>
    </el-main>
</el-container>


<el-container style="border: 1px solid black;margin-top: 10px">
    <el-header style="height: 40px;line-height:40px;background-color: #8cc5ff">标的信息</el-header>
    <el-main>
        <el-row type="flex" class="row-bg" justify="center">
            <el-col :span="2" >标的名称：</el-col>
            <el-col :span="6"><el-input/></el-col>
            <el-col :span="16">
                <el-button size="small">查询</el-button>
                <el-button size="small">新增</el-button>
                <el-button size="small">导入</el-button>
                <el-button size="small">刷新</el-button>
                <el-button size="small">模板下载</el-button>
            </el-col>
        </el-row>

        <el-row><el-col :span="24" >标的列表</el-col></el-row>
        <el-row><el-col :span="24" >

        </el-col></el-row>
    </el-main>
</el-container>


<el-container style="border: 1px solid black;margin-top: 10px">
    <el-header style="height: 40px;line-height:40px;background-color: #8cc5ff">填写信息</el-header>
    <el-main>
        <el-input
                type="textarea"
                :rows="2"
                placeholder="请输入内容">
        </el-input>
    </el-main>
</el-container>


<el-container style="height:300px;border: 1px solid black;margin-top: 10px">
    <el-header style="height: 40px;line-height:40px;background-color: #8cc5ff">公共附件区</el-header>
    <el-main>
        <el-row style="border: 1px solid black;"><el-col :span="24" >
            <el-button>添加</el-button>
        </el-col></el-row>
        <el-row>
            <el-table
                    style="width: 100%;border: 1px solid black">
                <el-table-column
                        label="序号">
                </el-table-column>
                <el-table-column
                        label="名称">
                </el-table-column>
                <el-table-column
                        label="类型">
                </el-table-column>
                <el-table-column
                        label="上传格式">
                </el-table-column>
                <el-table-column
                        label="文件">
                </el-table-column>
                <el-table-column
                        label="大小">
                </el-table-column>
                <el-table-column
                        label="是否发布外网">
                </el-table-column>
                <el-table-column
                        label="操作">
                </el-table-column>
            </el-table>
        </el-row>
    </el-main>
</el-container>


<el-container style="border: 1px solid black;margin-top: 10px">
    <el-header style="height: 40px;line-height:40px;background-color: #8cc5ff">意见区</el-header>
    <el-main>
        <el-row style="height: 30px;"><el-col :span="24">我的意见：</el-col></el-row>
        <el-row>
            <el-input
                    type="textarea"
                    :rows="2"
                    placeholder="请输入内容">
            </el-input>
        </el-row>
    </el-main>
</el-container>

<div style="margin-left: 700px">
    <el-button @click="tiJiao">提交</el-button>
    <el-button @click="baoCun">保存</el-button>
    <el-button >提交并保存</el-button>
    <el-button >返回</el-button>
</div>
