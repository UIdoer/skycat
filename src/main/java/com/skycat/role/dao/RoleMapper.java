package com.skycat.role.dao;

import java.util.List;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.role.entity.Role;

@MyBatisAnnotation
public interface RoleMapper extends BaseMapper<Role>{
    int deleteByPrimaryKey(Integer roleId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleId);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    List<Role> selectRolesByAdminId(int adminId);
}