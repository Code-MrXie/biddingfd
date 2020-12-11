package com.bgs.biddingfd.controller;


import com.bgs.biddingfd.pojo.PbFileImgInfo;
import com.bgs.biddingfd.service.PbFileInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 标的图片信息表 前端控制器
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@RestController
@RequestMapping("/pb-file-img-info")
public class PbFileImgInfoController {

    @Autowired
    PbFileInfoService pbFileInfoService;

    @RequestMapping("/imgInfo/{objectId}")
    public List<String> imgInfo(@PathVariable Integer objectId){
        return pbFileInfoService.imgInfo(objectId);
    }

}

