
package com.skycat.good.goodproperty.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.skycat.base.service.AbstractBaseServiceImpl;
import com.skycat.good.goodproperty.dao.GoodPropertyMapper;
import com.skycat.good.goodproperty.entity.GoodProperty;

@Service
public class GoodPropertyServiceImpl extends AbstractBaseServiceImpl<GoodProperty> implements GoodPropertyService{

	@Resource
	GoodPropertyMapper goodPropertyMapper;
	
	@Override
	public List<GoodProperty> selectGoodPropertysByGoodId(Integer goodId) {
		// TODO Auto-generated method stub
		return goodPropertyMapper.selectGoodPropertysByGoodId(goodId);
	}
	
		@Override
	public List<GoodProperty> selectGoodPropertyByGoodId(int id) {
		// TODO Auto-generated method stub
		return goodPropertyMapper.selectGoodPropertyByGoodId(id);
	}

	@Override
	public List<String> selectGoodPropertyColorByGoodId(int id) {
		// TODO Auto-generated method stub
		return goodPropertyMapper.selectGoodPropertyColorByGoodId(id);
	}

}
