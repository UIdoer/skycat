package com.skycat.user.userAddress;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import com.skycat.base.BaseTest;
import com.skycat.user.address.entity.UserAddress;
import com.skycat.user.address.service.AddressService;

public class TestService extends BaseTest{
	
	@Resource
	AddressService addressService; 
	
	@Test
	public void testSelectAllAddressByUserId(){
		List<UserAddress> address = addressService.selectAllAddressByUserId(11);
		System.out.println(address);
	}
}
