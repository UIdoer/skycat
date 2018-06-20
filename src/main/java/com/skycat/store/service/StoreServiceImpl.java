package com.skycat.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.skycat.base.service.AbstractBaseServiceImpl;
import com.skycat.store.dao.StoreMapper;
import com.skycat.store.entity.Store;
import com.skycat.store.entity.StorePageCondition;

@Service
public class StoreServiceImpl extends AbstractBaseServiceImpl<Store> implements StoreService{

	@Autowired
	StoreMapper storeMapper;
	
	@Override
	public PageInfo<Store> selectPageByCondition(StorePageCondition condition) {
		PageHelper.startPage(condition.getPageNum(),condition.getPageSize());
		List<Store> list = storeMapper.selectByCondition(condition);
		// 导航页显示5页
		return new PageInfo<>(list,5);
	}
	
}
