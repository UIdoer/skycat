package com.skycat.admin.dao;

import java.util.List;
import java.util.Map;

import com.skycat.admin.entity.Admin;
import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;

@MyBatisAnnotation
public interface AdminMapper extends BaseMapper<Admin>{
    int deleteByPrimaryKey(Integer adminId);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer adminId);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
    
    List<Admin> selectValid();
    
    int insertAdminRole(Map<String,Integer> param);
    
    Admin selectByAdminCode(String code);
    
    Admin loginAdmin(Admin admin);
    
    String selectStoreIdByAdminId(int id);
}