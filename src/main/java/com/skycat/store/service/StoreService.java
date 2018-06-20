package com.skycat.store.service;

import com.github.pagehelper.PageInfo;
import com.skycat.base.service.BaseService;
import com.skycat.store.entity.Store;
import com.skycat.store.entity.StorePageCondition;

public interface StoreService extends BaseService<Store>{
	PageInfo<Store> selectPageByCondition(StorePageCondition condition);
}
