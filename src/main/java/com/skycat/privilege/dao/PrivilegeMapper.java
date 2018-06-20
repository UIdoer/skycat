package com.skycat.privilege.dao;

import java.util.List;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.privilege.entity.Privilege;

@MyBatisAnnotation
public interface PrivilegeMapper extends BaseMapper<Privilege>{
    int deleteByPrimaryKey(Integer privilegeId);

    int insert(Privilege record);

    int insertSelective(Privilege record);

    Privilege selectByPrimaryKey(Integer privilegeId);

    int updateByPrimaryKeySelective(Privilege record);

    int updateByPrimaryKey(Privilege record);
    
    List<Privilege> selectPrivilegesByRoleId(int roleId);
}