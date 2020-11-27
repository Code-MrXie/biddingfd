package com.bgs.biddingfd.pojo;

import lombok.Data;

@Data
public class PbItemObjectInfo {
    private Integer itemId;
    private String itemCode;
    private String category;
    private String itemName;
    private String objectName;
    private Integer resourceType;
    private String trad;
    private String tradWay;
    private String bidStartTime;
    private String bidEndTime;
    private String bidderType;
}
