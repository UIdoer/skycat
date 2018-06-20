package com.skycat.category;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.skycat.base.BaseTest;
import com.skycat.category.dao.CategoryMapper;
import com.skycat.category.entity.Category;
import com.skycat.category.service.CategoryService;

public class TestCategory extends BaseTest {
	@Autowired
	CategoryMapper categoryMapper;
	@Autowired
	CategoryService categoryService;
	@Test
	public void testSelectAllCategory(){
		List<Category> c = categoryService.selectAllCategory();
		System.out.println(c);
	}
	
	@Test
	public void selectBe_topGoodByCategoryId(){
		List<Category> c = categoryMapper.selectBe_topGoodByParrentId(0);
		System.out.println(c);
	}
	
	@Test
	public void testSelectAllCategoryByBe_top(){
		List<Category> c = categoryService.selectBe_topGoodByParrentId(0);
		System.out.println(c.get(0));
	}	
	
	@Test
	public void test1(){
		List<Category> selectSecondProperty = categoryService.selectSecondProperty();
		System.out.println(selectSecondProperty);
	}	
	
	@Test
	public void test2(){
		List<String> str=new ArrayList(5);
		for( int i=0;i<5;i++) {
			str.add(null);
		}
		str.add(1, "asdasd");
		System.out.println(str.get(1));
	}	

}
