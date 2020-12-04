package com.bgs.biddingfd.controller;

import com.bgs.biddingfd.config.BaseResponse;
import com.bgs.biddingfd.config.StatusCode;
import com.bgs.biddingfd.pojo.PbItemApplyInfo;
import com.bgs.biddingfd.pojo.User;
import com.bgs.biddingfd.service.PbItemApplyInfoService;
import io.swagger.models.auth.In;
import org.omg.CORBA.BAD_CONTEXT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 项目交易申请控制层
 */
@RestController
@RequestMapping("PbItemApplyInfoCon")
public class PbItemApplyInfoController {

    @Autowired
    private PbItemApplyInfoService pbItemApplyInfoService;
    //查看当前委托人提交的所有项目申请书
    @RequestMapping("PbItemApplyInfoAll")
    @ResponseBody
    public BaseResponse PbItemApplyInfoAll(Long applyPersonId){

        List<PbItemApplyInfo> pbItemApplyInfoList = pbItemApplyInfoService.PbItemApplyInfoAll(applyPersonId);

        return new BaseResponse(StatusCode.Success,pbItemApplyInfoList);
    }

    //项目申请添加
    @RequestMapping("PbItemApplyInfoAdd")
    public BaseResponse PbItemApplyInfoAdd(@RequestBody PbItemApplyInfo pbItemApplyInfo){

        //添加前查询项目名称是否存在
        PbItemApplyInfo itemName1 = pbItemApplyInfoService.SelectPbItemApplyInfo(pbItemApplyInfo.getItemName());
        if(itemName1!=null){
            //如果存在直接返回
            return new BaseResponse(StatusCode.Fail);
        }else
            pbItemApplyInfoService.AddPbItemApplyInfo(pbItemApplyInfo);
        return new BaseResponse(StatusCode.Success);
    }

    //删除被退回的项目
    @RequestMapping("PbItemApplyInfoDel")
    public BaseResponse PbItemApplyInfoDel(@RequestBody Map<String,Object> map){

        System.out.println(map.get("seqId")+"==删除成功");
        Integer seqId = (Integer)map.get("seqId");
        int i = pbItemApplyInfoService.PbItemApplyInfoDel(seqId);

        return new BaseResponse(StatusCode.Success);
    }

    //处长查询委托人提交的
    @RequestMapping("PbItemApplyInfoStatusToOne")
    public BaseResponse PbItemApplyInfoStatusToOne(){

        System.out.println("定时任务");
        List<PbItemApplyInfo> pbItemApplyInfoList = pbItemApplyInfoService.PbItemApplyInfoStatusToOne();

        if(pbItemApplyInfoList==null){
            return new BaseResponse(StatusCode.Fail,"当前没有人申请！");
        }


        return new BaseResponse(StatusCode.Success,pbItemApplyInfoList);
    }


    //    处长回退 不通过 PbItemApplyInfoUpdaOnThree
    @RequestMapping("PbItemApplyInfoUpdaOnThree")
    public BaseResponse PbItemApplyInfoUpdaOnThree(@RequestBody Map<String,Integer> map){
        Integer seqId = (Integer)map.get("seqId");

        int i = pbItemApplyInfoService.PbItemApplyInfoUpdaOnThree(seqId);
        if(i>0){
            return new BaseResponse(StatusCode.Success);
        }

        return new BaseResponse(StatusCode.Fail);
    }


    //处长通过PbItemApplyInfotongguo
    @RequestMapping("PbItemApplyInfotongguo")
    public BaseResponse PbItemApplyInfotongguo(@RequestBody Map<String,Integer> map){
        System.out.println(map.get("seqId")+"——————————————————————————————————————");
        Integer seqId = (Integer)map.get("seqId");

        int i = pbItemApplyInfoService.PbItemApplyInfotongguo(seqId);
        if(i>0){
            return new BaseResponse(StatusCode.Success);
        }

        return new BaseResponse(StatusCode.Fail);
    }

    //查看具体的单条信息    pbItemApplyInfoSelectOne
    @RequestMapping("pbItemApplyInfoSelectOne")
    public BaseResponse pbItemApplyInfoSelectOne(@RequestBody Map<String,Object> map){

        Integer seqId = (Integer)map.get("seqId");

        System.out.println(seqId);
        PbItemApplyInfo pbItemApplyInfo = pbItemApplyInfoService.pbItemApplyInfoSelectOne(seqId);

        return new BaseResponse(StatusCode.Success,pbItemApplyInfo) ;
    }

    //查询建管办通过的   让处长分配 PbItemApplyInfoStatusToTWO
    @RequestMapping("PbItemApplyInfoStatusToTWO")
    public BaseResponse PbItemApplyInfoStatusToTWO() {

        List<PbItemApplyInfo> pbItemApplyInfoList = pbItemApplyInfoService.PbItemApplyInfoStatusToTWO();

        if (pbItemApplyInfoList == null) {
            return new BaseResponse(StatusCode.Fail, "当前没有人申请！");
        }

        return new BaseResponse(StatusCode.Success,pbItemApplyInfoList);
    }


    //查询所有项目负责人userSelect
    @RequestMapping("userSelect")
    public BaseResponse userSelect(){

        List<User> users = pbItemApplyInfoService.userSelect();

        return new BaseResponse(StatusCode.Success,users);
    }

    //处长具体分配给谁
    @RequestMapping("PbItemApplyInfoSuccessFenPei")
    public BaseResponse PbItemApplyInfoSuccessFenPei(@RequestBody Map<String,Object> map){

        Integer seqId = (Integer)map.get("seqId");
        Integer userId = (Integer)map.get("userId");
        System.out.println(seqId+"^^^^^"+userId);

        int i = pbItemApplyInfoService.PbItemApplyInfoSuccessFenPei(seqId,userId);

        return new BaseResponse(StatusCode.Success);
    }

}
