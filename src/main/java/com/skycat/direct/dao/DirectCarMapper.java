package com.skycat.direct.dao;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.direct.entity.DirectCar;

@MyBatisAnnotation
public interface DirectCarMapper extends BaseMapper<DirectCarMapper>{
    int insert(DirectCar record);

    int insertSelective(DirectCar record);
}