package com.bgs.biddingfd.service.impl;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.GetObjectRequest;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.bgs.biddingfd.pojo.*;
import com.bgs.biddingfd.mapper.PbItemInfoMapper;
import com.bgs.biddingfd.service.PbItemInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bgs.biddingfd.utility.AliOSSUtilS;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 项目信息表 服务实现类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Service
public class PbItemInfoServiceImpl extends ServiceImpl<PbItemInfoMapper, PbItemInfo> implements PbItemInfoService {

    @Resource
    PbItemInfoMapper pbItemInfoMapper;


    @Override
    public List<Map<String, Object>> likeElectronic(Map<String,String> map) {
        return pbItemInfoMapper.likeElectronic(map);
    }

    @Override
    public Boolean stopBid(Integer id) {
        return pbItemInfoMapper.stopBid(id);
    }

    @Override
    public Boolean subBidRule(Integer id, PbBiddingRules setBidRule) {
       boolean b= pbItemInfoMapper.bidRule(setBidRule);
        //返回主键自增
        System.out.println(setBidRule.getRuleId());
        Boolean aBoolean = pbItemInfoMapper.setBidRule(id, setBidRule.getRuleId());
        return aBoolean;
    }

    @Override
    public List<PbObjectInfo> signInfo(Integer id) {
        return pbItemInfoMapper.signInfo(id);
    }

    @Override
    public PbObjectInfo signRuleInfo(Integer code) {
        return pbItemInfoMapper.signRuleInfo(code);
    }

    @Override
    public Boolean subSetSignRule( PbObjectInfo signRule) {

        return pbItemInfoMapper.subSetSignRule(signRule);
    }


    @Override
    public PbBiddingRules bidRuleDetail(Integer itemId) {
        return pbItemInfoMapper.bidRuleDetail(itemId);
    }

    @Override
    public IPage<PbItemObjectInfo> selectPbItemInfo(IPage<PbItemObjectInfo> pbItemInfoPage, String itemName, Integer resourceType) {
        return pbItemInfoMapper.selectPbItemInfo(pbItemInfoPage,itemName,resourceType);
    }

    @Override
    public IPage<PbQuoteInfo> selectBiddingHall(IPage<PbQuoteInfo> pbItemInfoPage, Integer itemId) {
        return pbItemInfoMapper.selectBiddingHall(pbItemInfoPage,itemId);
    }

    @Override
    public List<PbItemInfo> findPbItemInfo(PbItemInfo pbItemInfo) {
        return pbItemInfoMapper.findPbItemInfo(pbItemInfo);
    }

    @Override
    public boolean deteleThis(Integer itemId) {
        return pbItemInfoMapper.deteleThis(itemId);
    }

    @Override
    public Map<String, Object> ListingLinkShow(Integer objectId) {
        return pbItemInfoMapper.ListingLinkShow(objectId);
    }

    @Override
    public List<Map<String, Object>> theContractFor(Map<String,Object> map) {
        return pbItemInfoMapper.theContractFor(map);
    }

    @Override
    public Map<String, Object> transaction(Map<String, Object> map1) {
        return pbItemInfoMapper.transaction(map1);
    }

    @Override
    public boolean filesUpload(String[] split, String key) {
        return pbItemInfoMapper.filesUpload(split[0],split[0]+split[1],key);
    }

    @Override
    public Map<String, Object> examine(Map<String,Object> id, HttpServletResponse response) {
        Map<String, Object> examine = pbItemInfoMapper.examine(id);
//        AliOSSUtilS.downloadFileToLoacal(String.valueOf(examine.get("contract_md5")),"E:\\壁纸");

        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build("oss-cn-beijing.aliyuncs.com", "LTAI4GHTDawAHspqGLQP8pCL", "XhDj1exhK4HUsgpDym7c3kaxSDOvvE");

        // 下载OSS文件到本地文件。如果指定的本地文件存在会覆盖，不存在则新建。
        ossClient.getObject(new GetObjectRequest("yuxinshi", String.valueOf(examine.get("contract_md5"))), new File("E:\\壁纸\\01.jpg"));
        // 关闭OSSClient。
        ossClient.shutdown();

        return  examine;
    }


    @Override
    public boolean tupianupdate(String s, String upload) {
        return pbItemInfoMapper.tupianupdate(s,upload);
    }

    @Override
    public List<PbItemInfo> showAllPbItemInfo() {
        List<PbItemInfo> list=pbItemInfoMapper.showAllPbItemInfo();
        for(PbItemInfo test1:list){
            for (PbObjectInfo test2:test1.getPbObjectInfoList()){
                for(PbApplyInfo test3:test2.getPbApplyInfo2()){
                    Integer a=test2.getPbApplyInfo2().size();
                    test3.setLength(a);
                }
            }
        }
        return list;
    }
}
