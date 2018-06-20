package com.skycat.good.property.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.skycat.base.service.AbstractBaseServiceImpl;
import com.skycat.good.property.dao.PropertyMapper;
import com.skycat.good.property.entity.Property;

@Service
public class PropertyServiceImpl extends AbstractBaseServiceImpl<Property> implements PropertyService{

	@Resource
	PropertyMapper propertyMapper;
	
	@Override
	public List<Property> selectPropertysByCategoryId(Integer categoryId) {
		return propertyMapper.selectPropertysByCategoryId(categoryId);
	}

}
