package com.bgs.biddingfd.controller;


import com.bgs.biddingfd.service.PbResultInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 成交结果表 前端控制器
 * </p>
 *1;
 * @author xieCode
 * @since 2020-11-25
 */
@RestController
@RequestMapping("/pb-result-info")
public class PbResultInfoController {

    @Autowired
    private PbResultInfoService resultInfoService;

    //resultShow
    //成交结果确认书
    @RequestMapping(value = "/resultShow/{flow}",method = RequestMethod.POST)
    public List<Map<String,Object>> resultShow(@PathVariable Integer flow){
        return resultInfoService.resultShow(flow);
    }

    //subResult
    //提交确认书
    @RequestMapping(value = "/subResult/{row}",method = RequestMethod.POST)
    public Boolean subResult(@PathVariable Integer row){
        return resultInfoService.subResult(row);
    }


    //resultInfo
    //结果公示
    @RequestMapping("/resultInfo")
    public List<Map<String,Object>> resultInfo(){
        return resultInfoService.resultInfo();
    }
}

