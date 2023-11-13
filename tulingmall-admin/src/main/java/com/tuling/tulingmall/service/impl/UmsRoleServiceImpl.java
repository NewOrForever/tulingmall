package com.tuling.tulingmall.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.tuling.tulingmall.mapper.UmsRoleMapper;
import com.tuling.tulingmall.mapper.UmsRolePermissionRelationMapper;
import com.tuling.tulingmall.model.UmsPermission;
import com.tuling.tulingmall.model.UmsRole;
import com.tuling.tulingmall.model.UmsRolePermissionRelation;
import com.tuling.tulingmall.service.UmsRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 后台角色管理Service实现类
 * Created on 2018/9/30.
 */
@Service
public class UmsRoleServiceImpl implements UmsRoleService {
    @Autowired
    private UmsRoleMapper roleMapper;
    @Autowired
    private UmsRolePermissionRelationMapper rolePermissionRelationMapper;
    @Override
    public int create(UmsRole role) {
        role.setCreateTime(new Date());
        role.setStatus(1);
        role.setAdminCount(0);
        role.setSort(0);
        return roleMapper.insert(role);
    }

    @Override
    public int update(Long id, UmsRole role) {
        role.setId(id);
        return roleMapper.updateById(role);
    }

    @Override
    public int delete(List<Long> ids) {
        return roleMapper.deleteBatchIds(ids);
    }

    @Override
    public List<UmsPermission> getPermissionList(Long roleId) {
        return rolePermissionRelationMapper.getPermissionList(roleId);
    }

    @Override
    public int updatePermission(Long roleId, List<Long> permissionIds) {
        //先删除原有关系
        UpdateWrapper<UmsRolePermissionRelation> wrapper = new UpdateWrapper<>();
        wrapper.eq("role_id",roleId);
        rolePermissionRelationMapper.delete(wrapper);
        //批量插入新关系
        List<UmsRolePermissionRelation> relationList = new ArrayList<>();
        for (Long permissionId : permissionIds) {
            UmsRolePermissionRelation relation = new UmsRolePermissionRelation();
            relation.setRoleId(roleId);
            relation.setPermissionId(permissionId);
            relationList.add(relation);
        }
        return rolePermissionRelationMapper.insertRolePermission(relationList);
    }

    @Override
    public List<UmsRole> list() {
        return roleMapper.selectList(null);
    }
}
