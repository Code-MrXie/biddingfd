package com.bgs.biddingfd.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bgs.biddingfd.config.Result;
import com.bgs.biddingfd.pojo.*;
import com.bgs.biddingfd.pojo.*;
import com.bgs.biddingfd.service.PbItemInfoService;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

/**
 * <p>
 * 项目信息表 前端控制器
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@RestController
@RequestMapping("/pb-item-info")
public class PbItemInfoController {

    @Resource
    PbItemInfoService pbItemInfoService;
    @PostMapping("selectPbItemInfo/{pageSize}/{currentPage}" )
    /**
     * 查询竞价厅 BiddingHall.jsp
     */
    @ApiOperation(value = "查询竞价厅",httpMethod = "POST")
    public Map selectPbItemInfo(@PathVariable Integer pageSize, @PathVariable Integer currentPage, @RequestBody PbItemObjectInfo itemObjectInfo){
        IPage<PbItemObjectInfo> pbItemInfoPage = new Page<>(currentPage,pageSize);
        IPage<PbItemObjectInfo> pbItemInfos =  pbItemInfoService.selectPbItemInfo(pbItemInfoPage,itemObjectInfo.getItemName(),itemObjectInfo.getResourceType());
        /*PageInfo<PbItemInfo> pbItemInfos = itemInfoService.selectPbItemInfo(pageSize,currentPage,pbItemInfo.getItemName(),pbItemInfo.getResourceType());
        System.out.println(pbItemInfos.getList());
        List<PbItemInfo> itemInfos = pbItemInfoMapper.selectPbItemInfo(null, null);
        System.out.println(itemInfos);*/
        Map map = new HashMap();
        map.put("current",pbItemInfos.getCurrent());
        map.put("pages",pbItemInfos.getPages());
        map.put("data",pbItemInfos.getRecords());
        map.put("size",pbItemInfos.getSize());
        map.put("total",pbItemInfos.getTotal());
        map.put("code",200);
        map.put("msg","查询成功");
        return map;
    }
    @GetMapping("selectBiddingHall/{pageSize2}/{currentPage2}/{itemId}" )
    /**
     * 查询竞价厅 BiddingHall.jsp
     */
    @ApiOperation(value = "查询竞价记录",httpMethod = "GET")
    public Map selectBiddingHall(@PathVariable Integer pageSize2, @PathVariable Integer currentPage2,@PathVariable Integer itemId){
        IPage<PbQuoteInfo> pbItemInfoPage = new Page<>(currentPage2,pageSize2);
        IPage<PbQuoteInfo> pbItemInfos =  pbItemInfoService.selectBiddingHall(pbItemInfoPage,itemId);
        /*PageInfo<PbItemInfo> pbItemInfos = itemInfoService.selectPbItemInfo(pageSize,currentPage,pbItemInfo.getItemName(),pbItemInfo.getResourceType());
        System.out.println(pbItemInfos.getList());
        List<PbItemInfo> itemInfos = pbItemInfoMapper.selectPbItemInfo(null, null);
        System.out.println(itemInfos);*/
        Map map = new HashMap();
        map.put("current",pbItemInfos.getCurrent());
        map.put("pages",pbItemInfos.getPages());
        map.put("data",pbItemInfos.getRecords());
        map.put("size",pbItemInfos.getSize());
        map.put("total",pbItemInfos.getTotal());
        map.put("code",200);
        map.put("msg","查询成功");
        return map;
//        return new Result(true,200,"查询成功",pbQuoteInfos);
    }

    //查询电子竞价规则
    @RequestMapping(value = "/electronicTable",method = RequestMethod.POST)
    public List<Map<String,Object>> electronicTable(){

        List<Map<String,Object>> list = pbItemInfoService.electronicTable();
        return list;
    }

    @RequestMapping("/likeElectronic")
    public List<Map<String,Object>> likeElectronic(@RequestBody Map<String,String> map){
        String name = map.get("name");
        String code = map.get("code");
        List<Map<String,Object>> list = pbItemInfoService.likeElectronic(name,code);
        return list;
    }

    //中止竞价
    @RequestMapping("/stopBid/{id}")
    public Boolean stopBid(@PathVariable Integer id){
        return pbItemInfoService.stopBid(id);
    }


    //bidRuleDetail
    @RequestMapping("/bidRuleDetail/{itemId}")
    public PbBiddingRules bidRuleDetail(@PathVariable Integer itemId){
        System.out.println(itemId);
        return pbItemInfoService.bidRuleDetail(itemId);
    }


    //设置竞价规则
    @RequestMapping("/subBidRule/{id}")
    public Boolean subBidRule(@PathVariable Integer id,@RequestBody PbBiddingRules  setBidRule){
        return pbItemInfoService.subBidRule(id,setBidRule);
    }

    //signInfo
    @RequestMapping("/signInfo/{id}")
    public List<PbObjectInfo> signInfo(@PathVariable Integer id){
        System.out.println(pbItemInfoService.signInfo(id));
        return pbItemInfoService.signInfo(id);
    }

    //signRuleInfo
    @RequestMapping("/signRuleInfo/{code}")
    public PbObjectInfo signRuleInfo(@PathVariable Integer code){
        return pbItemInfoService.signRuleInfo(code);
    }

    @RequestMapping("/subSetSignRule/{objectId}")
    public Boolean subSetSignRule(@PathVariable Integer objectId,@RequestBody PbObjectInfo signRule){
        System.out.println(objectId);
        signRule.setObjectId(objectId);
        System.out.println(signRule);
        return pbItemInfoService.subSetSignRule(signRule);
    }

    //成交结果录入办理--展示--index-jt
    @RequestMapping("/findPbItemInfo")
    @ResponseBody
    public List<PbItemInfo> findPbItemInfo(PbItemInfo pbItemInfo){
        List<PbItemInfo> list=pbItemInfoService.findPbItemInfo(pbItemInfo);
        return list;
    }

    //成交结果录入办理--删除--index-jt
    @RequestMapping("/deteleThis")
    @ResponseBody
    public Boolean deteleThis(Integer itemId){
        boolean b=pbItemInfoService.deteleThis(itemId);
        return b;
    }


}

