package com.bgs.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 竞买人报名信息表	
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="PbApplyInfo对象", description="竞买人报名信息表	")
public class PbApplyInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键ID")
    @TableId(value = "seq_id", type = IdType.AUTO)
    private Integer seqId;

    @ApiModelProperty(value = "项目id")
    private Integer itemId;

    @ApiModelProperty(value = "企业信息表主键")
    private Integer enterId;

    @ApiModelProperty(value = "竞买人名称")
    private String bidName;

    @ApiModelProperty(value = "竞买人类别")
    private Integer bidType;

    @ApiModelProperty(value = "产权组织机构代码")
    private String enterOrgCode;

    @ApiModelProperty(value = "身份证或统一社会信用代码")
    private String idcard;

    @ApiModelProperty(value = "联系手机")
    private String moble;

    @ApiModelProperty(value = "牌号")
    private String mark;

    @ApiModelProperty(value = "标的ID")
    private Integer objectId;

    @ApiModelProperty(value = "保证金金额")
    private String money;

    @ApiModelProperty(value = "审核状态")
    private String objectsFlag;

    @ApiModelProperty(value = "创建用户GUID")
    private Integer createUserId;

    @ApiModelProperty(value = "更新用户GUID")
    private Integer updateUserId;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    private Date updateTime;

    private String isDel;


}
