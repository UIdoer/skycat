package com.skycat.good;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageInfo;
import com.skycat.base.BaseTest;
import com.skycat.good.good.dao.GoodMapper;
import com.skycat.good.good.entity.Good;
import com.skycat.good.good.entity.Store_Good_List;
import com.skycat.good.good.service.GoodService;

public class TestGood extends BaseTest{
	@Autowired
	GoodMapper goodMapper ;
	@Autowired
	GoodService goodService;
	
	@Test
	public void testSelectbyHotStatus(){
		List<Good> i = goodService.selectByBe_hot(0);
		System.out.println(i.get(0));
	}
	
	@Test
	public void testSelectGoodByID(){
		Good i = goodService.selectByPrimaryKey(1);
		System.out.println(i);
	}
	
	@Test
	public void testSelectGoodByCategory(){
		PageInfo<Good> i = goodService.selectGoodByCategory(8, 1, 5, "price-key", "desc");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("CategoryId", 8);
		map.put("condition", "price-key");
		map.put("sort",  "desc");
		//List<Good> i = goodMapper.selectGoodByCategory(map);
		System.out.println(i);
	}
	@Test
	public void testSelectGoodByParrentCategory(){
		//PageInfo<Good> i = goodService.selectGoodByCategory(8, 1, 5, "price-key", "desc");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("parentCategoryId", 1);
		map.put("condition", "price-key");
		map.put("sort",  "desc");
		List<Good> i = goodMapper.selectGoodByParrentCategoryId(map);
		System.out.println(i);
	}
	
	
	@Test
	public void testSelectGoodByGoodTitle(){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("goodTitle", "手机");
		map.put("condition", "defualt-key");
		map.put("sort", "defualt-sort");
		 PageInfo<Good> i = goodService.selectGoodByGoodTitle("手机", 1, 25, "price-key", "desc");
		System.out.println(i);
	}
	
	@Test
	public void testSelectGoodByStoreId(){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("storeId", "2");
		map.put("condition", "defualt-key");
		map.put("sort", "defualt-sort");
		
		
		 PageInfo<Good> i = goodService.selectGoodByStoreId(2,1, 25, "price-key", "desc");
		System.out.println(i);
	}
	@Test
	public void testSelectStoreGoodByStoreId(){
		List<Good> i = goodService.selectStoreGoodByStoreId(2);
		System.out.println(i);
	}
	
	@Test
	public void testSelectAll(){
		
		List<Good> i = goodMapper.selectAll();
		System.out.println(i);
	}
	
	@Test
	public void testSelectAllGood(){
		Map<String,Object> map = new HashMap<String,Object>();
		//map.put("storeId", "2");
		map.put("condition", "price-key");
		map.put("sort", "desc");
		//List<Good> i = goodMapper.selectAllGood(map);
		PageInfo<Good> i = goodService.selectAllGood(1, 5, "price-key", "desc");
		System.out.println(i);
	}
	
	@Test
	public void testSelectGoodByParrentCategoryId(){
		 PageInfo<Good> i = goodService.selectGoodByParrentCategoryId(1, 1, 5, "price-key", "desc");
		System.out.println(i);
	}
	
	@Test
	public void testSelectGoodByBe_Top(){
		List<Good> i = goodService.selectGoodByBe_Top();
		System.out.println(i);
	}
	
	
	
	@Test
	public void test1(){
		
		HashMap<String, Integer> hashMap = new HashMap<>();
		hashMap.put("StoreId", 2);
		hashMap.put("status", 0);
		 List<Store_Good_List> byStoreId = goodService.selectStore_Good_listByStoreId(hashMap);
		System.out.println(byStoreId);
	}
	
}
