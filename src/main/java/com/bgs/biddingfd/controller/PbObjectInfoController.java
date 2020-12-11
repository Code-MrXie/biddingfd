package com.bgs.biddingfd.controller;


import com.bgs.biddingfd.pojo.PbObjectInfo;
import com.bgs.biddingfd.service.PbObjectInfoService;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 标的信息表 前端控制器
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@RestController
@RequestMapping("/pb-object-info")
public class PbObjectInfoController {
    @Resource
    private PbObjectInfoService pbObjectInfoService;

    @RequestMapping("/ShowObject")
    @ResponseBody
    public PbObjectInfo ShowObject(Integer objectId){
        PbObjectInfo pbObjectInfo=pbObjectInfoService.ShowObject(objectId);
        return pbObjectInfo;
    }

    @RequestMapping("showAllPbObjectInfo")
    @ResponseBody
    public List<PbObjectInfo> showAllPbObjectInfo(){
        List<PbObjectInfo> list=pbObjectInfoService.showAllPbObjectInfo();
        return list;
    }

    //@RequestMapping("/objectInfo")


}

