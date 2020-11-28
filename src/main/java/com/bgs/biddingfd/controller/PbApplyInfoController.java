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
    @PostMapping("selectApplyInfo/{pageSize}/{currentPage}" )
    /**
     * 查询竞价厅 PaytheDeposit.jsp
     */
    @ApiOperation(value = "查询缴纳保证金",httpMethod = "POST")
    public Map selectApplyInfo(@PathVariable Integer pageSize, @PathVariable Integer currentPage, @RequestBody PbItemObjectInfo itemObjectInfo){
        IPage<PbItemObjectInfo> pbItemInfoPage = new Page<>(currentPage,pageSize,true);
        IPage<PbItemObjectInfo> pbItemInfos =  pbApplyInfoService.selectApplyInfo(pbItemInfoPage,itemObjectInfo.getItemName(),itemObjectInfo.getResourceType());
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
     * 查询竞价厅 PaytheDeposit.jsp
     */
    @ApiOperation(value = "查询缴纳保证金信息",httpMethod = "POST")
    public Result selectPaytheDeposit(@PathVariable Integer applyId){
        if (applyId!=null){
            PbObjectInfo pbObjectInfo = pbApplyInfoService.selectPaytheDeposit(applyId);
            return new Result(true,200,"查询成功",pbObjectInfo);
        }
        return new Result(false,-1,"请求数据异常");
    }

}

