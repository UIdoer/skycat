package com.skycat.base.service;

import java.io.Serializable;
import java.util.List;

public interface BaseService<T> {
	   int deleteByPrimaryKey(Serializable fId);

	    int insert(T record);

	    int insertSelective(T record);

	    T selectByPrimaryKey(Serializable fId);

	    int updateByPrimaryKeySelective(T record);

	    int updateByPrimaryKey(T record);
	    
	    List<T> selectAll();
}
