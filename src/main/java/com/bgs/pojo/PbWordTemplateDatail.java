package com.bgs.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 竞价模板详细表
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="PbWordTemplateDatail对象", description="竞价模板详细表")
public class PbWordTemplateDatail implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "seq_id", type = IdType.AUTO)
    private Integer seqId;

    @ApiModelProperty(value = "外键")
    private Integer templateId;

    @ApiModelProperty(value = "MD5")
    private Integer templFileId;

    @ApiModelProperty(value = "模板子类型")
    private String subType;

    @ApiModelProperty(value = "子模板名称")
    private String templateName;


}
