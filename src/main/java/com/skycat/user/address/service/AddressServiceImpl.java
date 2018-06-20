package com.skycat.user.address.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.skycat.base.service.AbstractBaseServiceImpl;
import com.skycat.user.address.dao.UserAddressMapper;
import com.skycat.user.address.entity.UserAddress;
@Service
public class AddressServiceImpl 
extends AbstractBaseServiceImpl<UserAddress>
implements AddressService
{
	@Resource
	UserAddressMapper userAddressMapper;

	@Override
	public List<UserAddress> selectAllAddressByUserId(Integer userId) {
		UserAddress userAddress = new UserAddress();
		userAddress.setUserId(userId);
		return userAddressMapper.selectAddressSelective(userAddress);
	}

	@Override
	public UserAddress selectAddressByAddressId(Integer userId,Integer addressId) {
		UserAddress userAddress = new UserAddress();
		userAddress.setAddressId(addressId);
		userAddress.setUserId(userId);
		return userAddressMapper.selectAddressSelective(userAddress).get(0);
	}

	@Override
	public int updateSetAddressIsDefault(Integer userId, Integer addressId) {
		UserAddress userAddress = new UserAddress();
		userAddress.setUserId(userId);
		userAddress.setAddressId(addressId);
		userAddress.setIsDefault("0");
		userAddressMapper.updateAddresIsDefault(userAddress);
		userAddress.setIsDefault("1");
		int i = userAddressMapper.updateAddresIsDefault(userAddress);
		return i;
	}

	@Override
	public int insertAddress(UserAddress userAddress) {
		if("on".equals(userAddress.getIsDefault())){
			userAddress.setIsDefault("0");
			userAddressMapper.updateAddresIsDefault(userAddress);
			userAddress.setIsDefault("1");
		}else{
			userAddress.setIsDefault("0");
		}
		return userAddressMapper.insert(userAddress);
	}

	@Override
	public int editorAddress(UserAddress userAddress) {
		if("on".equals(userAddress.getIsDefault())){
			userAddress.setIsDefault("0");
			userAddressMapper.updateAddresIsDefault(userAddress);
			userAddress.setIsDefault("1");
		}else{
			userAddress.setIsDefault("0");
		}
		return  userAddressMapper.updateByPrimaryKeySelective(userAddress);
	}

	@Override
	public UserAddress selectDefaultAddress(Integer userId) {
		UserAddress userAddress = new UserAddress();
		userAddress.setUserId(userId);
		userAddress.setIsDefault("1");
		List<UserAddress> list = userAddressMapper.selectAddressSelective(userAddress);
		return list.size()==1?list.get(0):null;
	}

	

	
}
