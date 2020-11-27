package com.bgs.biddingfd.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bgs.biddingfd.mapper.PbItemInfoMapper;
import com.bgs.biddingfd.pojo.PbItemInfo;
import com.bgs.biddingfd.pojo.PbItemObjectInfo;
import com.bgs.biddingfd.pojo.PbQuoteInfo;
import com.bgs.biddingfd.service.PbItemInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    @Autowired
    private PbItemInfoMapper pbItemInfoMapper;

    @Override
    public IPage<PbItemObjectInfo> selectPbItemInfo(IPage<PbItemObjectInfo> pbItemInfoPage, String itemName, Integer resourceType) {
        return pbItemInfoMapper.selectPbItemInfo(pbItemInfoPage,itemName,resourceType);
    }

    @Override
    public List<PbItemInfo> findPbItemInfo(PbItemInfo pbItemInfo) {
        List<PbItemInfo> list=pbItemInfoMapper.findPbItemInfo(pbItemInfo);
        return list;
    }
    @Override
    public IPage<PbQuoteInfo> selectBiddingHall(IPage<PbQuoteInfo> pbItemInfoPage, Integer itemId) {
        return pbItemInfoMapper.selectBiddingHall(pbItemInfoPage,itemId);
    }

    /*@Override
    public PageInfo<PbItemInfo> selectPbItemInfo(Integer pageSize, Integer currentPage, String itemName, Integer resourceType) {
        PageHelper.startPage(currentPage,pageSize);//分页起始码以及每页页数
        List<PbItemInfo> itemInfos = pbItemInfoMapper.selectPbItemInfo(itemName,resourceType);
        System.out.println(itemInfos);
        PageInfo pageInfo=new PageInfo(itemInfos);
        return pageInfo;
    }*/
}
