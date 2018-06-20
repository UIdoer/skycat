package com.skycat.good.good.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.skycat.base.service.AbstractBaseServiceImpl;
import com.skycat.category.dao.CategoryMapper;
import com.skycat.category.entity.Category;
import com.skycat.good.good.dao.GoodMapper;
import com.skycat.good.good.entity.Good;
import com.skycat.good.good.entity.Store_Good_List;
@Service
public class GoodServiceImpl extends AbstractBaseServiceImpl<Good> implements GoodService{
	@Autowired
	GoodMapper goodMapper;
	
	@Resource
	CategoryMapper categoryMapper;

	@Override
	public List<Good> selectByBe_hot(Integer status) {
		// TODO Auto-generated method stub
		return goodMapper.selectByBe_hot(status);
	}

	@Override
	public PageInfo<Good> selectGoodByCategory(Integer CategoryId,Integer pageNum,Integer pageSize,String condition,String sort) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("CategoryId", CategoryId);
		map.put("condition", condition);
		map.put("sort", sort);
		List<Good> list = goodMapper.selectGoodByCategory(map);
		return new PageInfo<>(list,5);
	}

	@Override
	public List<Store_Good_List> selectStore_Good_listByStoreId(Map hashMap) {
		// TODO Auto-generated method stub
		return goodMapper.selectStore_Good_listByStoreId(hashMap);
	}

	@Override
	public PageInfo<Good> selectGoodByGoodTitle(String GoodTitle,Integer pageNum,Integer pageSize,String condition,String sort) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("goodTitle", GoodTitle);
		map.put("condition", condition);
		map.put("sort", sort);
		List<Good> list = goodMapper.selectGoodByGoodTitle(map);
		return new PageInfo<>(list,5);
	}
	
	

	
	@Override
	public PageInfo<Good> selectGoodByStoreId(Integer storeId,Integer pageNum,Integer pageSize,String condition,String sort) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("storeId", storeId);
		map.put("condition", condition);
		map.put("sort", sort);
		List<Good> list = goodMapper.selectGoodByStoreId(map);
		return new PageInfo<>(list,5);
	}

	@Override
	public PageInfo<Good> selectUncheckedGoods(int pageNum,int pageSize) {
		PageHelper.startPage(pageNum,pageSize);
		// 导航栏显示5个
		return new PageInfo<>(goodMapper.selectUncheckedGoods(),5);
	}

	@Override
	public String selectStoreNameByGoodId(int gid) {
		return goodMapper.selectStoreNameByGoodId(gid);
	}

	@Override
	public int updateGoodStatus(Map<String, Integer> map) {
		return goodMapper.updateGoodStatus(map);
	}

	@Override
	public List<Good> selectStoreGoodByStoreId(Integer storeId) {
		// TODO Auto-generated method stub
		return goodMapper.selectStoreGoodByStoreId(storeId);
	}

	@Override
	public PageInfo<Good> selectGoodByParrentCategoryId(Integer parentCategoryId,Integer pageNum,Integer pageSize,String condition,String sort){
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("parentCategoryId", parentCategoryId);
		map.put("condition", condition);
		map.put("sort", sort);
		List<Good> list = goodMapper.selectGoodByParrentCategoryId(map);
		return new PageInfo<>(list,5);
	}

	@Override
	public List<Good> selectGoodByBe_Top() {
		// TODO Auto-generated method stub
		return goodMapper.selectGoodByBe_Top();
	}

	@Override
	public PageInfo<Good> selectAllGood(Integer pageNum, Integer pageSize, String condition, String sort) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("condition", condition);
		map.put("sort", sort);
		List<Good> list = goodMapper.selectAllGood(map);
		return new PageInfo<>(list,5);
		
	}
}
