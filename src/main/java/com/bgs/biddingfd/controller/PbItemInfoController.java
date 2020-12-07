package com.bgs.biddingfd.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bgs.biddingfd.config.Result;
import com.bgs.biddingfd.pojo.*;
import com.bgs.biddingfd.pojo.*;
import com.bgs.biddingfd.service.PbItemInfoService;
import com.bgs.biddingfd.utility.AliyunOSSUtil;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.io.FileUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;
import java.io.IOException;
import java.util.*;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
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


    //查询电子竞价管理表
    @RequestMapping("/likeElectronic")
    public List<Map<String,Object>> likeElectronic(@RequestBody Map<String,String> map){
        String name = map.get("name");
        String code = map.get("code");
        List<Map<String,Object>> list = pbItemInfoService.likeElectronic(map);
        return list;
    }

    //中止竞价
    @RequestMapping("/stopBid/{id}")
    public Boolean stopBid(@PathVariable Integer id){
        return pbItemInfoService.stopBid(id);
    }


    //竞价规则详情
    @RequestMapping("/bidRuleDetail/{itemId}")
    public PbBiddingRules bidRuleDetail(@PathVariable Integer itemId){
        return pbItemInfoService.bidRuleDetail(itemId);
    }


    //设置竞价规则
    @RequestMapping("/subBidRule/{id}")
    public Boolean subBidRule(@PathVariable Integer id,@RequestBody PbBiddingRules  setBidRule){
        return pbItemInfoService.subBidRule(id,setBidRule);
    }

    //竞价记录单
    @RequestMapping("/signInfo/{id}")
    public List<PbObjectInfo> signInfo(@PathVariable Integer id){
        return pbItemInfoService.signInfo(id);
    }

    //标的规则详情
    @RequestMapping("/signRuleInfo/{code}")
    public PbObjectInfo signRuleInfo(@PathVariable Integer code){
        return pbItemInfoService.signRuleInfo(code);
    }


    //修改标的规则
    @RequestMapping("/subSetSignRule/{objectId}")
    public Boolean subSetSignRule(@PathVariable Integer objectId,@RequestBody PbObjectInfo signRule){

        String str = signRule.getBidEndTime();
        String str1 = signRule.getBidStartTime();
        signRule.setBidEndTime( str.substring(0,10));
        signRule.setBidStartTime(str1.substring(0,10));

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

    //合同办理
    @RequestMapping(value = "/theContractFor",method = RequestMethod.POST)
    @ResponseBody
    public List<Map<String,Object>> theContractFor(@RequestBody Map<String,Object> map){
        System.out.println("------"+map);
       List<Map<String,Object>> list =pbItemInfoService.theContractFor(map);
        System.out.println(list);
        return list;
    }
    //合同办理
    @RequestMapping(value = "/transaction",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> transaction(@RequestBody Map<String,Object> map){
        Map<String,Object> map1 = (Map<String, Object>) map.get("id");
        map1.put("moneyStatus", map.get("moneyStatus"));
        System.out.println("------"+map1);
        Map<String,Object> list =pbItemInfoService.transaction(map1);
        System.out.println(list);
        return list;
    }



    //ListingLinkShow
    //相关标的挂牌链接
    //ListingLink.jsp
    @RequestMapping("/ListingLinkShow")
    public Map<String,Object> ListingLinkShow(){
        return pbItemInfoService.ListingLinkShow();
    }



    //合同上传
    @RequestMapping(value = "/filesUpload",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> filesUpload(@RequestParam("file") MultipartFile picture ,@RequestParam("key") String key) throws IOException {

        if (picture!=null) {
            String filename = picture.getOriginalFilename();
            File file  = new File(filename);
            FileUtils.copyInputStreamToFile(picture.getInputStream(), file);
            System.out.println(picture.getInputStream().toString()+"====");
            //调用阿里云工具类 返回文件地址
            String upload = AliyunOSSUtil.upload(file);
            System.out.println(upload);
            boolean b = pbItemInfoService.tupianupdate(upload,key);
        }
        return null;
    }

//
//    //合同上传
//    @RequestMapping(value = "/filesUpload",method = RequestMethod.POST)
//    @ResponseBody
//    public Map<String,Object> filesUpload(@RequestParam("file") MultipartFile picture ,@RequestParam("key") String key){
//        System.out.println(key);
//        if(picture!=null){
//            String fileName = picture.getOriginalFilename();
//            String[] split = fileName.split("\\.");
//            System.out.println(split);
//            if(split[1] != null){
//                boolean b = pbItemInfoService.filesUpload(split,key);
//            }
//
//        }
//        return null;
//    }

    //合同展示
    @RequestMapping(value = "/examine",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> examine(@RequestBody Map<String,Object> id, HttpServletResponse response){
        System.out.println(id);
        Map<String,Object> map =  pbItemInfoService.examine(id,response);
        System.out.println(map);
        return map;
    }

}
