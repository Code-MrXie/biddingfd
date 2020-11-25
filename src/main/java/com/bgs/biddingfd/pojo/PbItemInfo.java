package com.bgs.biddingfd.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 项目信息表
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="PbItemInfo对象", description="项目信息表")
public class PbItemInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键ID")
    @TableId(value = "seq_id", type = IdType.AUTO)
    private Integer seqId;

    @ApiModelProperty(value = "项目交易申请id")
    private Integer applyId;

    @ApiModelProperty(value = "项目名称")
    private String itemName;

    @ApiModelProperty(value = "项目编号")
    private String itemCode;

    @ApiModelProperty(value = "所属地区")
    private String itemArea;

    @ApiModelProperty(value = "所属地区ID")
    private Integer itemAreaId;

    @ApiModelProperty(value = "交易方式")
    private String tradWay;

    @ApiModelProperty(value = "资源类型(交易类型)")
    private Integer resourceType;

    @ApiModelProperty(value = "出让方")
    private String transferor;

    @ApiModelProperty(value = "保证金缴纳方式")
    private Integer depositPayWay;

    @ApiModelProperty(value = "保证金缴纳截止时间")
    private Date depositTime;

    @ApiModelProperty(value = "资格审查方式")
    private Integer qualExamWay;

    @ApiModelProperty(value = "出让方联系人")
    private String transferorMan;

    @ApiModelProperty(value = "出让方联系地址")
    private String transferorAddr;

    @ApiModelProperty(value = "出让方联系电话")
    private String transferorPhone;

    @ApiModelProperty(value = "报名开始时间")
    private Date applyStartTime;

    @ApiModelProperty(value = "报名截止时间")
    private Date applyEndTime;

    @ApiModelProperty(value = "代理机构")
    private String agentName;

    @ApiModelProperty(value = "代理机构ID")
    private Integer agentId;

    @ApiModelProperty(value = "保证金收取单位")
    private String depositCharge;

    @ApiModelProperty(value = "开户名称")
    private String accountName;

    @ApiModelProperty(value = "开户行")
    private String bankName;

    @ApiModelProperty(value = "开户账号")
    private String bankCode;

    @ApiModelProperty(value = "联系人")
    private String linkMan;

    @ApiModelProperty(value = "联系方式")
    private String linkPhone;

    @ApiModelProperty(value = "标的物情况")
    private String objectSituation;

    @ApiModelProperty(value = "竞买资格要求")
    private String bidderQual;

    @ApiModelProperty(value = "是否在外网展示时间和地点")
    private String isShow;

    @ApiModelProperty(value = "竞价形式")
    private Integer bidWay;

    @ApiModelProperty(value = "竞价模式")
    private Integer bidState;

    @ApiModelProperty(value = "成交方式")
    private Integer dealWay;

    @ApiModelProperty(value = "报价方式")
    private Integer applyWay;

    @ApiModelProperty(value = "付款方式")
    private String paymentWay;

    @ApiModelProperty(value = "报名须知")
    private String applyNotice;

    @ApiModelProperty(value = "其他事项")
    private String otherDeal;

    @ApiModelProperty(value = "项目阶段")
    private Integer phase;

    @ApiModelProperty(value = "自由竞价时长")
    private Integer freeBidLen;

    @ApiModelProperty(value = "延时竞价时长")
    private Integer delayBidLen;

    @ApiModelProperty(value = "加价最大倍数")
    private Integer maxMultiple;

    @ApiModelProperty(value = "交易机构联系人")
    private String tradAgencyMan;

    @ApiModelProperty(value = "交易机构联系地址")
    private String tradAgencyAddr;

    @ApiModelProperty(value = "交易机构联系电话")
    private String tradAgencyPhone;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "更新时间")
    private Date updateTime;

    @ApiModelProperty(value = "是否删除")
    private String isDel;


}
