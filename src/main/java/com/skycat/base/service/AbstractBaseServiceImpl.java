package com.skycat.base.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.skycat.base.dao.BaseMapper;

public abstract class AbstractBaseServiceImpl<T> implements BaseService<T> {

	@Autowired
	BaseMapper<T> baseMapper;
	
	@Override
	public int deleteByPrimaryKey(Serializable fId) {
		return baseMapper.deleteByPrimaryKey(fId);
	}

	@Override
	public int insert(T record) {
		return baseMapper.insert(record);
	}

	@Override
	public int insertSelective(T record) {
		return baseMapper.insertSelective(record);
	}

	@Override
	public T selectByPrimaryKey(Serializable fId) {
//		System.out.println(baseMapper);
		return baseMapper.selectByPrimaryKey(fId);
	}

	@Override
	public int updateByPrimaryKeySelective(T record) {
		return baseMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(T record) {
		return baseMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<T> selectAll() {
		return baseMapper.selectAll();
	}
	
}
