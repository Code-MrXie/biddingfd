package com.bgs.biddingfd.controller;


import com.bgs.biddingfd.pojo.PbBiddingRules;
import com.bgs.biddingfd.pojo.PbObjectInfo;
import com.bgs.biddingfd.service.PbItemInfoService;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
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
}

