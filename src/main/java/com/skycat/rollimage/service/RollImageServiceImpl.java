package com.skycat.rollimage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skycat.base.service.AbstractBaseServiceImpl;
import com.skycat.rollimage.dao.RollImageMapper;
import com.skycat.rollimage.entity.RollImage;

@Service
public class RollImageServiceImpl extends AbstractBaseServiceImpl<RollImage> implements RollImageService{
	@Autowired
	RollImageMapper rollImageMapper;

	@Override
	public List<RollImage> selectRollImagesByStatus(Integer status) {
		// TODO Auto-generated method stub
		return rollImageMapper.selectRollImagesByStatus(status);
	}

}
