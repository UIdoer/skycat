package com.skycat.good;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.skycat.base.BaseTest;
import com.skycat.good.goodproperty.dao.GoodPropertyMapper;
import com.skycat.good.goodproperty.entity.GoodProperty;
import com.skycat.good.goodproperty.service.GoodPropertyService;
import com.skycat.good.property.dao.PropertyMapper;
import com.skycat.good.property.entity.Property;
import com.skycat.good.property.service.PropertyService;

public class TestGoodProperty extends BaseTest {
	
	@Autowired
	GoodPropertyMapper  goodPropertyMapper;
	@Resource
	GoodPropertyService goodPropertyService;
	
	@Resource
	PropertyService propertyService;
	
	@Test
	public void testGoodProperty(){
		List<GoodProperty> i = goodPropertyService.selectGoodPropertyByGoodId(1);
		System.out.println(i);
	}
	
	@Test
	public void testGoodPropertyColor(){
		List<String> i = goodPropertyService.selectGoodPropertyColorByGoodId(1);
		System.out.println(i);
	}
	
	@Test
	public void testGoodPropertyById(){
		  GoodProperty i = goodPropertyService.selectByPrimaryKey(1);
		System.out.println(i);
	}
	
	@Test
	public void test1(){
		List<GoodProperty> selectGoodPropertysByGoodId = goodPropertyService.selectGoodPropertysByGoodId(1);
		System.out.println(selectGoodPropertysByGoodId);
	}
	
	@Test
	public void test2(){
		String[] str= {"trt","qwe","asd",null,null};
		for(String s:str) {
			System.out.println(s);
		}
		
	}
	
	@Test
	public void test3(){
		List<Property> byCategoryId = propertyService.selectPropertysByCategoryId(8);
		System.out.println(byCategoryId);
		
	}

}
