package com.skycat.good;


import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.skycat.base.BaseTest;
import com.skycat.store.entity.Store;
import com.skycat.store.service.StoreService;


public class TestGoodStore extends BaseTest{
	@Autowired
	StoreService storeService;
	
	@Test
	public void testSelectStoreById(){
		Store i = storeService.selectByPrimaryKey(2);
		System.out.println(i);  
	}
	

}
