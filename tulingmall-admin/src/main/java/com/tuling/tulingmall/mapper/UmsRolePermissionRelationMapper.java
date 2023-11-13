package com.tuling.tulingmall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tuling.tulingmall.model.UmsPermission;
import com.tuling.tulingmall.model.UmsRolePermissionRelation;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UmsRolePermissionRelationMapper extends BaseMapper<UmsRolePermissionRelation> {

    /**
     * 批量插入角色和权限关系
     */
    @Insert("<script>" +
            "   INSERT INTO ums_role_permission_relation (role_id, permission_id) VALUES" +
            "        <foreach collection=\"list\" separator=\",\" item=\"item\" index=\"index\">" +
            "            (#{item.roleId,jdbcType=BIGINT}," +
            "            #{item.permissionId,jdbcType=BIGINT})" +
            "        </foreach>" +
            "</script>")
    int insertRolePermission(@Param("list") List<UmsRolePermissionRelation> list);

    /**
     * 根据角色获取权限
     */
    @Select("SELECT" +
            "            p.*" +
            "        FROM" +
            "            ums_role_permission_relation r" +
            "            LEFT JOIN ums_permission p ON r.permission_id = p.id" +
            "        WHERE" +
            "            r.role_id = #{roleId};")
    List<UmsPermission> getPermissionList(@Param("roleId") Long roleId);
}