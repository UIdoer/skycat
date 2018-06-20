package com.skycat.base.dao;

import java.io.Serializable;
import java.util.List;

public interface BaseMapper<T> {
    int deleteByPrimaryKey(Serializable fId);

    int insert(T record);

    int insertSelective(T record);

    T selectByPrimaryKey(Serializable fId);

    int updateByPrimaryKeySelective(T record);

    int updateByPrimaryKey(T record);
    
    /**
     * 逆向工程没有在xml中提供实现，需要自己实现
     * @return
     */
    List<T> selectAll();
}
