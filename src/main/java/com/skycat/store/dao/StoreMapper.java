package com.skycat.store.dao;

import java.util.List;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.store.entity.Store;
import com.skycat.store.entity.StorePageCondition;

@MyBatisAnnotation
public interface StoreMapper extends BaseMapper<Store>{
    int deleteByPrimaryKey(Integer storeId);

    int insert(Store record);

    int insertSelective(Store record);
    
    Store selectByPrimaryKey(Integer storeId);

    int updateByPrimaryKeySelective(Store record);

    int updateByPrimaryKey(Store record);
    
    List<Store> selectByCondition(StorePageCondition condition);

}