package com.skycat.good.property.dao;

import java.util.List;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.good.property.entity.Property;

@MyBatisAnnotation
public interface PropertyMapper extends BaseMapper<Property>{
    int deleteByPrimaryKey(Integer propertyId);

    int insert(Property record);

    int insertSelective(Property record);

    Property selectByPrimaryKey(Integer propertyId);

    int updateByPrimaryKeySelective(Property record);

    int updateByPrimaryKey(Property record);
    
    List<Property> selectPropertysByCategoryId(Integer categoryId);
    
    String selectPropertyNameById(int id);
}