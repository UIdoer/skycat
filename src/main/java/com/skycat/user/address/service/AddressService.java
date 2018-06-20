package com.skycat.user.address.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skycat.base.service.BaseService;
import com.skycat.user.address.entity.UserAddress;
@Service
public interface AddressService extends BaseService<UserAddress>{
	//根据用户id 查询用户所有 地址
	List<UserAddress> selectAllAddressByUserId(Integer userId);
	//根据用户id和地址id 查询 一个地址
	UserAddress selectAddressByAddressId(Integer userId,Integer addressId);
	//根据用户id和地址id 将地址设置为默认
	int updateSetAddressIsDefault(Integer userId,Integer addressId);
	//插入收货地址
	int insertAddress(UserAddress userAddress);
	//编辑收货地址
	int editorAddress(UserAddress userAddress);
	//查询用户的默认地址
	UserAddress selectDefaultAddress(Integer userId);
}
