package com.skycat.good.property.service;

import java.util.List;

import com.skycat.base.service.BaseService;
import com.skycat.good.property.entity.Property;

public interface PropertyService extends BaseService<Property>{

	List<Property> selectPropertysByCategoryId(Integer categoryId);
	
}
