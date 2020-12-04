package com.bgs.biddingfd.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bgs.biddingfd.config.Result;
import com.bgs.biddingfd.pojo.PbApplyInfo;
import com.bgs.biddingfd.pojo.PbItemObjectInfo;
import com.bgs.biddingfd.pojo.PbObjectInfo;
import com.bgs.biddingfd.service.PbApplyInfoService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 竞买人报名信息表	 前端控制器
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@RestController
@RequestMapping("/pb-apply-info")
public class PbApplyInfoController {
    @Autowired
    private PbApplyInfoService pbApplyInfoService;
    @PostMapping("selectApplyInfo/{pageSize}/{currentPage}/{moneyStatus}" )
    /**
     * 查询缴纳保证金PaytheDeposit.jsp
     */
    @ApiOperation(value = "查询缴纳保证金",httpMethod = "POST")
    public Map selectApplyInfo(@PathVariable Integer pageSize, @PathVariable Integer currentPage,@PathVariable Integer moneyStatus, @RequestBody PbItemObjectInfo itemObjectInfo){
        IPage<PbItemObjectInfo> pbItemInfoPage = new Page<>(currentPage,pageSize,true);
        IPage<PbItemObjectInfo> pbItemInfos =  pbApplyInfoService.selectApplyInfo(pbItemInfoPage,moneyStatus,itemObjectInfo.getItemName(),itemObjectInfo.getResourceType());
        Map map = new HashMap();
        map.put("pages",pbItemInfos.getPages());
        map.put("data",pbItemInfos.getRecords());
        map.put("size",pbItemInfos.getSize());
        map.put("total",pbItemInfos.getTotal());
        map.put("code",200);
        map.put("msg","查询成功");
        return map;
    }
    @PostMapping("selectApplyDetailInfo/{pageSize}/{currentPage}/{depositBack}" )
    /**
     * 查询缴纳保证金PaytheDeposit.jsp
     */
    @ApiOperation(value = "查询缴纳保证金",httpMethod = "POST")
    public Map selectApplyDetailInfo(@PathVariable Integer pageSize, @PathVariable Integer currentPage,@PathVariable Integer depositBack, @RequestBody PbItemObjectInfo itemObjectInfo){
        IPage<PbItemObjectInfo> pbItemInfoPage = new Page<>(currentPage,pageSize,true);
        IPage<PbItemObjectInfo> pbItemInfos =  pbApplyInfoService.selectApplyDetailInfo(pbItemInfoPage,depositBack,itemObjectInfo.getItemName(),itemObjectInfo.getResourceType());
        Map map = new HashMap();
        map.put("pages",pbItemInfos.getPages());
        map.put("data",pbItemInfos.getRecords());
        map.put("size",pbItemInfos.getSize());
        map.put("total",pbItemInfos.getTotal());
        map.put("code",200);
        map.put("msg","查询成功");
        return map;
    }
    @PostMapping("caiwuselectApplyDetailInfo/{pageSize}/{currentPage}/{isReturn}" )
    /**
     * 查询缴纳保证金 FinanceDepositRefund.jsp
     */
    @ApiOperation(value = "查询缴纳保证金",httpMethod = "POST")
    public Map caiwuselectApplyDetailInfo(@PathVariable Integer pageSize, @PathVariable Integer currentPage,@PathVariable Integer isReturn, @RequestBody PbItemObjectInfo itemObjectInfo){
        IPage<PbItemObjectInfo> pbItemInfoPage = new Page<>(currentPage,pageSize,true);
        IPage<PbItemObjectInfo> pbItemInfos =  pbApplyInfoService.caiwuselectApplyDetailInfo(pbItemInfoPage,isReturn,itemObjectInfo.getItemName(),itemObjectInfo.getResourceType());
        Map map = new HashMap();
        map.put("pages",pbItemInfos.getPages());
        map.put("data",pbItemInfos.getRecords());
        map.put("size",pbItemInfos.getSize());
        map.put("total",pbItemInfos.getTotal());
        map.put("code",200);
        map.put("msg","查询成功");
        return map;
    }
    @PostMapping("selectPaytheDeposit/{applyId}" )
    /**
     * 查询投标缴纳保证金订单 PaytheDeposit.jsp
     */
    @ApiOperation(value = "查询投标缴纳保证金订单",httpMethod = "POST")
    public Result selectPaytheDeposit(@PathVariable Integer applyId){
        if (applyId!=null){
            PbItemObjectInfo pbObjectInfo = pbApplyInfoService.selectPaytheDeposit(applyId);
            return new Result(true,200,"查询成功",pbObjectInfo);
        }
        return new Result(false,-1,"请求数据异常");
    }
    @GetMapping("updateApplyInfoMoney/{money}/{applyId}")
    /**
     * 修改缴纳保证金信息 PaytheDeposit.jsp
     */
    @ApiOperation(value = "修改缴纳保证金信息",httpMethod = "GET")
    public Result updateApplyInfoMoney(@PathVariable Integer money,@PathVariable Integer applyId){
        int i = pbApplyInfoService.updateApplyInfoMoney(money,applyId);
        if (i==1){
            return new Result(true,200,"缴纳成功");
        }
        return new Result(false,-1,"缴纳失败");
    }
    @GetMapping("selectObjectInfo/{itemId}")
    /**
     * 查询缴纳保证金的标的详细信息 PaytheDeposit.jsp
     */
    @ApiOperation(value = "查询缴纳保证金的标的详细信息",httpMethod = "GET")
    public Result selectObjectInfo(@PathVariable Integer itemId){
        PbItemObjectInfo info = pbApplyInfoService.selectObjectInfo(itemId);
        return new Result(true,200,"查询成功",info);
    }
    @GetMapping("updateApplyInfoMoneyStatus/{applyId}/{depositBack}")
    /**
     * 申请缴退保证金 DepositRefund.jsp
     */
    @ApiOperation(value = "申请缴退保证金",httpMethod = "GET")
    public Result updateApplyInfoMoneyStatus(@PathVariable Integer applyId,@PathVariable Integer depositBack){
        System.out.println(depositBack);
        int  i = pbApplyInfoService.updateApplyInfoMoneyStatus(applyId,depositBack);
        if (i==1){
            return new Result(true,200,"缴纳成功");
        }
        return new Result(false,-1,"缴纳失败");
    }
    @GetMapping("updateApplyInfoIsReturnStatus/{applyId}/{isReturn}")
    /**
     * 财务缴退保证金 FinanceDepositRefund.jsp
     */
    @ApiOperation(value = "申请缴退保证金",httpMethod = "GET")
    public Result updateApplyInfoIsReturnStatus(@PathVariable Integer applyId,@PathVariable Integer isReturn){
        int  i = pbApplyInfoService.updateApplyInfoIsReturnStatus(applyId,isReturn);
        if (i==1){
            return new Result(true,200,"缴纳成功");
        }
        return new Result(false,-1,"缴纳失败");
    }
    @PostMapping("selectNormalMargin/{pageSize}/{currentPage}" )
    /**
     * 查询正常保证金 normalMargin.jsp
     */
    @ApiOperation(value = "查询正常保证金",httpMethod = "POST")
    public Map selectNormalMargin(@PathVariable Integer pageSize, @PathVariable Integer currentPage, @RequestBody PbItemObjectInfo itemObjectInfo){
        IPage<PbItemObjectInfo> pbItemInfoPage = new Page<>(currentPage,pageSize,true);
        IPage<PbItemObjectInfo> pbItemInfos =  pbApplyInfoService.selectNormalMargin(pbItemInfoPage,itemObjectInfo.getMoneyStatus(),itemObjectInfo.getItemName(),itemObjectInfo.getIsReturn());
        Map map = new HashMap();
        map.put("pages",pbItemInfos.getPages());
        map.put("data",pbItemInfos.getRecords());
        map.put("size",pbItemInfos.getSize());
        map.put("total",pbItemInfos.getTotal());
        map.put("code",200);
        map.put("msg","查询成功");
        return map;
    }
    @PostMapping("selectAbNormalMargin/{pageSize}/{currentPage}" )
    /**
     * 查询异常保证金 abnormalMargin.jsp
     */
    @ApiOperation(value = "查询异常保证金",httpMethod = "POST")
    public Map selectAbNormalMargin(@PathVariable Integer pageSize, @PathVariable Integer currentPage, @RequestBody PbItemObjectInfo itemObjectInfo){
        IPage<PbItemObjectInfo> pbItemInfoPage = new Page<>(currentPage,pageSize,true);
        IPage<PbItemObjectInfo> pbItemInfos =  pbApplyInfoService.selectAbNormalMargin(pbItemInfoPage,itemObjectInfo.getMoneyStatus(),itemObjectInfo.getItemName(),itemObjectInfo.getIsReturn());
        Map map = new HashMap();
        map.put("pages",pbItemInfos.getPages());
        map.put("data",pbItemInfos.getRecords());
        map.put("size",pbItemInfos.getSize());
        map.put("total",pbItemInfos.getTotal());
        map.put("code",200);
        map.put("msg","查询成功");
        return map;
    }

}

