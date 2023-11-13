package com.tuling.tulingmall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tuling.tulingmall.model.UmsRole;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UmsRoleMapper extends BaseMapper<UmsRole> {
    /**
     * 获取用于所有角色
     */
    @Select("select r.*" +
            "        from ums_admin_role_relation ar left join ums_role r on ar.role_id = r.id" +
            "        where ar.admin_id = #{adminId}")
    List<UmsRole> getRoleList(@Param("adminId") Long adminId);
}