package com.skycat.user.cart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import com.skycat.base.BaseTest;
import com.skycat.user.cart.dao.UserCartMapper;
import com.skycat.user.cart.entity.CartData;
import com.skycat.user.cart.entity.UserCartVo;
import com.skycat.user.cart.service.UserCartService;

public class TestGotopay extends BaseTest {
	@Resource
	UserCartMapper mapper;
	@Resource
	UserCartService userCartService;
	@Test
	public void tests(){
		Map<String,Object> map = new HashMap<String,Object>();
		List<CartData> data = new ArrayList<CartData>();
		
		CartData cart = new CartData();
		List<Integer> goodPropertyIds = new ArrayList<Integer>();
		goodPropertyIds.add(8);
		goodPropertyIds.add(6);
		//data.setStoreId(storeId);
		cart.setGoodPropertyIds(goodPropertyIds);
		data.add(cart);
		CartData cart2 = new CartData();
		List<Integer> goodPropertyIds2 = new ArrayList<Integer>();
		goodPropertyIds2.add(5);
		
		//data.setStoreId(storeId);
		cart2.setGoodPropertyIds(goodPropertyIds2);
		data.add(cart2);
		
		map.put("userId", 27);
		map.put("cartData", data);
		List<UserCartVo> list = mapper.selectByGoodPropertyIds(map);
		for (UserCartVo userCartVo : list) {
			System.out.println(userCartVo.getUc());
		}
		
		
	}
	@Test
	public void cretra(){
		CartData data = new CartData();
		data.setAddressId(16);
		List<Integer> list = new ArrayList<Integer>();
		list.add(8);
		data.setGoodPropertyIds(list);
		data.setRemark("test liu yan 111");
		data.setStoreId(3);
		List<CartData> list2 = new ArrayList<CartData>();
		list2.add(data);
		userCartService.createOrder(list2,27);
	}
}
