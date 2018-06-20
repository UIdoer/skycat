package com.skycat.user.store.dao;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.user.store.entity.UserStore;

@MyBatisAnnotation
public interface UserStoreMapper extends BaseMapper<UserStore>{
    int insert(UserStore record);

    int insertSelective(UserStore record);
}