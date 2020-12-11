package com.bgs.biddingfd.service.impl;

import com.bgs.biddingfd.pojo.PbQuoteInfo;
import com.bgs.biddingfd.mapper.PbQuoteInfoMapper;
import com.bgs.biddingfd.service.PbQuoteInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * <p>
 * 竞价历史表 服务实现类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Service
public class PbQuoteInfoServiceImpl extends ServiceImpl<PbQuoteInfoMapper, PbQuoteInfo> implements PbQuoteInfoService {

    @Autowired(required = false)
    PbQuoteInfoMapper pbQuoteInfoMapper;

    @Override
    public Integer yanshi(Integer objectId) {
        return pbQuoteInfoMapper.yanshi(objectId);
    }

    @Override
    public Boolean baoJia(Integer objectId) {
        //SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
       // String format = df.format(new Date());
        PbQuoteInfo pbQuoteInfo = new PbQuoteInfo();
        pbQuoteInfo.setQuoteTime(new Date());
        pbQuoteInfo.setObjectId(objectId);

        return null;
    }
}
