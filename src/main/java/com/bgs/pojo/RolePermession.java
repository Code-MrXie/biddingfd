package com.bgs.pojo;

import com.baomidou.mybatisplus.annotation.Version;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 角色--权限表
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="RolePermession对象", description="角色--权限表")
public class RolePermession implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer roleId;

    private Integer pId;


}
