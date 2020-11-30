package com.bgs.biddingfd.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class PbItemObjectInfo {
    private Integer applyId;
    private String companyName;
    private Integer itemId;
    private String itemCode;
    private String category;
    private String itemName;
    private String objectName;
    private Integer resourceType;
    private String trad;
    private String tradWay;
    private Date bidStartTime;
    private Date bidEndTime;
    private String bidderType;
    private String money;
}
