<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<span style="font-size: 30px">公共资源-竞价-项目登记</span>
-------------------------------------------------------项目信息----------------------------------------------------------

<div style="margin-bottom: 50px; width: 800px;" >
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 项目名称 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessName" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">项目编号</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 所属地区 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessAddress" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">交易方式</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.realName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 出让方 </div></el-col>
            <el-col :span="18"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessAddress" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 出让方联系人 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.idCard" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">出让方联系电话</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.mobile" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 出让方联系地址 </div></el-col>
            <el-col :span="18"><div class="grid-content bg-purple-light">
                <el-input v-model="user.corName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 保证金缴纳方式 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.card" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">资格审查方式</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.cardName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>


    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 保证金缴纳截止时间 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.card" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="12"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"></div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 报名开始时间 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.card" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">报名结束时间</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.cardName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>

    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 代理机构 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.card" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="12"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">选择中介代理</div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 保证金收取单位 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.card" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">开户名称</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.cardName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>

    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 开户行 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.card" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">开户账号</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.cardName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>

    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 联系人 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.card" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">联系方式</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.cardName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>

    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 报名开始时间 </div></el-col>
            <el-col :span="18"><div class="grid-content bg-purple-light">
                <el-input v-model="user.card" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
</div>


-------------------------------------------------------竞价信息----------------------------------------------------------


<div style="margin-bottom: 50px">
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 竞买人类别 </div></el-col>
            <el-col :span="18"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 竞买资格要求 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessAddress" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 在外网展示时间和地点 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.idCard" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">竞价形式</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.mobile" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 报价方式 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.corName" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">成交方式</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.corNum" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 付款方式 </div></el-col>
            <el-col :span="18"><div class="grid-content bg-purple-light">
                <el-input v-model="user.card" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 报名须知 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.corName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 报名须知 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.corName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>

</div>

-------------------------------------------------------标的信息----------------------------------------------------------

<div style="margin-bottom: 50px">
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 单位名称 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessName" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">社会信用（组织机构代码）</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 单位地址 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessAddress" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">联系人姓名</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.realName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>

    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 联系人身份证 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.idCard" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">联系人手机号</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.mobile" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 法人姓名 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.corName" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">法人身份证</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.corNum" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 银行账号 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.card" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">账户名</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.cardName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>

</div>

-------------------------------------------------------填写信息----------------------------------------------------------

<div style="margin-bottom: 50px">
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 单位名称 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessName" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">社会信用（组织机构代码）</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 单位地址 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessAddress" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">联系人姓名</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.realName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>

    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 联系人身份证 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.idCard" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">联系人手机号</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.mobile" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 法人姓名 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.corName" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">法人身份证</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.corNum" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 银行账号 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.card" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">账户名</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.cardName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>

</div>

-------------------------------------------------------公共附件区----------------------------------------------------------

<div style="margin-bottom: 50px">
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 单位名称 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessName" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">社会信用（组织机构代码）</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 单位地址 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessAddress" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">联系人姓名</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.realName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>

    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 联系人身份证 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.idCard" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">联系人手机号</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.mobile" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 法人姓名 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.corName" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">法人身份证</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.corNum" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 银行账号 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.card" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">账户名</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.cardName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>

</div>





-------------------------------------------------------意见区----------------------------------------------------------


<div style="margin-bottom: 50px">
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 单位名称 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessName" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">社会信用（组织机构代码）</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 单位地址 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.businessAddress" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">联系人姓名</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.realName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>

    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 联系人身份证 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.idCard" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">联系人手机号</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.mobile" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 法人姓名 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.corName" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">法人身份证</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.corNum" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="margin:15px">
        <el-row>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px"> 银行账号 </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.card" placeholder=""></el-input>
            </div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple" style="text-align: center;margin-top: 8px">账户名</div></el-col>
            <el-col :span="6"><div class="grid-content bg-purple-light">
                <el-input v-model="user.cardName" placeholder=""></el-input>
            </div></el-col>
        </el-row>
    </div>
    <div style="float:right">
        <el-button type="primary" >保存</el-button>
    </div>
</div>