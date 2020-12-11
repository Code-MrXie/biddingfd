package com.bgs.biddingfd.controller;


import com.bgs.biddingfd.service.PbQuoteInfoService;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 竞价历史表 前端控制器
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@RestController
@RequestMapping("/pb-quote-info")
public class PbQuoteInfoController {

    @Autowired
    PbQuoteInfoService pbQuoteInfoService;

    @RequestMapping("/yanshi/{objectId}")
    public Integer yanshi(@PathVariable Integer objectId){
        return pbQuoteInfoService.yanshi(objectId);
    }

    @RequestMapping("/baoJia/{objectId}")
    public Boolean baoJia(@PathVariable Integer objectId){
        return pbQuoteInfoService.baoJia(objectId);
    }


}

