package com.bgs.biddingfd.pojo;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * <p>
 * 标的信息表
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="PbObjectInfo对象", description="标的信息表")
public class PbObjectInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    private Integer seqId;

    @ApiModelProperty(value = "标id")
    private Integer objectId;

    @ApiModelProperty(value = "项目id")
    private Integer itemId;

    @ApiModelProperty(value = "标的序号")
    private Integer orderNum;

    @ApiModelProperty(value = "标的编号")
    private String objectCode;

    @ApiModelProperty(value = "标的名称")
    private String objectName;

    @ApiModelProperty(value = "标的位置")
    private String objectAddress;

    @ApiModelProperty(value = "竞价方式")
    private Integer trad;

    @ApiModelProperty(value = "行使优先权方式")
    private Integer priorityWay;

    @ApiModelProperty(value = "优先权使用次数")
    private Integer priorityCount;

    @ApiModelProperty(value = "竞价延时时间")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    private Date bidDelayTime;

    @ApiModelProperty(value = "竞价开始时间")
//    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String bidStartTime;

    @ApiModelProperty(value = "竞价结束时间")
//    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String bidEndTime;

    @ApiModelProperty(value = "优先权竞买人类别")
    private Integer priorityBidType;

    @ApiModelProperty(value = "优先权竞买人id")
    private String priorityApplyId;

    @ApiModelProperty(value = "优先权竞买人名称")
    private String priorityEnterName;

    @ApiModelProperty(value = "优先权确认时长")
    private Integer priorityConfirmLen;

    @ApiModelProperty(value = "竞买人类别(1.企业，2.个人)")
    private Integer bidderType;

    @ApiModelProperty(value = "报价单位")
    private String unit;

    @ApiModelProperty(value = "加价幅度")
    private BigDecimal quoteIncrement;

    @ApiModelProperty(value = "报价小数点设置")
    private Integer splitDecimal;

    @ApiModelProperty(value = "评估价")
    private BigDecimal evaluatePrice;

    @ApiModelProperty(value = "起始价")
    private BigDecimal startPrice;

    @ApiModelProperty(value = "是否设置保留价")
    private String isReservePrice;

    @ApiModelProperty(value = "保留价")
    private BigDecimal reservePrice;

    @ApiModelProperty(value = "保证金")
    private BigDecimal cmcostAmount;

    @ApiModelProperty(value = "手续费类型")
    private Integer chargeState;

    @ApiModelProperty(value = "手续费百分比")
    private BigDecimal scale;

    @ApiModelProperty(value = "手续费金额")
    private BigDecimal charge;

    @ApiModelProperty(value = "成交价")
    private BigDecimal closePrice;

    @ApiModelProperty(value = "竞价状态")
    private Integer bidStatus;

    @ApiModelProperty(value = "中止状态")
    private String isPause;

    @ApiModelProperty(value = "中止时间")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    private Date pauseTime;

    @ApiModelProperty(value = "保证金缴纳截止时间")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    private Date depositPayEndTime;

    @ApiModelProperty(value = "延时次数")
    private Integer delayTimes;

    @ApiModelProperty(value = "出让面积")
    private BigDecimal sellAcreage;

    @ApiModelProperty(value = "面积单位")
    private String acreageUnit;

    @ApiModelProperty(value = "租赁年限")
    private BigDecimal leaseTerm;

    @ApiModelProperty(value = "报名次数")
    private Integer applyNum;

    @ApiModelProperty(value = "备注")
    private String remark;

    @ApiModelProperty(value = "创建时间")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @ApiModelProperty(value = "更新时间")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    @ApiModelProperty(value = "是否删除")
    private String isDel;

    private PbItemInfo pbItemInfo;

}
