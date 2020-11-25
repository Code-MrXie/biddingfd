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
 * 项目交易申请表
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="PbItemApplyInfo对象", description="项目交易申请表")
public class PbItemApplyInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键ID")
    @TableId(value = "seq_id", type = IdType.AUTO)
    private Integer seqId;

    @ApiModelProperty(value = "项目名称")
    private String itemName;

    @ApiModelProperty(value = "资源类型")
    private String resourceType;

    @ApiModelProperty(value = "项目主管部门")
    private String itemDepName;

    @ApiModelProperty(value = "委托方名称")
    private String delegateName;

    @ApiModelProperty(value = "委托方联系人")
    private String delegateMan;

    @ApiModelProperty(value = "委托方联系电话")
    private String delegatePhone;

    @ApiModelProperty(value = "项目申请人id")
    private Integer applyPersonId;

    @ApiModelProperty(value = "项目负责人id")
    private Integer itemLeaderId;

    @ApiModelProperty(value = "交易项目简要情况")
    private String itemSummary;

    @ApiModelProperty(value = "流程ID")
    private Integer flowId;

    @ApiModelProperty(value = "运行ID")
    private Integer runId;

    @ApiModelProperty(value = "创建用户GUID")
    private Integer createUserId;

    @ApiModelProperty(value = "更新用户GUID")
    private Integer updateUserId;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "更新时间")
    private Date updateTime;

    @ApiModelProperty(value = "是否删除")
    private String isDel;

    @ApiModelProperty(value = "审核状态")
    private String auditState;

    @ApiModelProperty(value = "建管办审批状态")
    private String connectingState;

    @ApiModelProperty(value = "分派人")
    private String assignRole;


}
