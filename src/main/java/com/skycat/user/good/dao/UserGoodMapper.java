package com.skycat.user.good.dao;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.user.good.entity.UserGood;

@MyBatisAnnotation
public interface UserGoodMapper extends BaseMapper<UserGood>{
    int insert(UserGood record);

    int insertSelective(UserGood record);
}