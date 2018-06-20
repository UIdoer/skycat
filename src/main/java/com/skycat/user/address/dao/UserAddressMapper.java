package com.skycat.user.address.dao;

import java.util.List;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.user.address.entity.UserAddress;

@MyBatisAnnotation
public interface UserAddressMapper extends BaseMapper<UserAddress>{
	//动态查询
	List<UserAddress> selectAddressSelective(UserAddress userAddress);
	//根据用户id和批量修改地址为是不是默认
	int updateAddresIsDefault(UserAddress userAddress);
}