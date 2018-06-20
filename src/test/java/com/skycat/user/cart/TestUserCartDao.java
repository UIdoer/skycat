package com.skycat.user.cart;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import com.github.pagehelper.PageInfo;
import com.skycat.base.BaseTest;
import com.skycat.user.cart.dao.UserCartMapper;
import com.skycat.user.cart.entity.UserCart;
import com.skycat.user.cart.entity.UserCartVo;
import com.skycat.user.cart.service.UserCartService;

public class TestUserCartDao extends BaseTest {
	@Resource
	UserCartMapper userCartMapper;
	
	@Resource
	UserCartService userCartService;
	
	@Test
	public void testSelectCartByUserId(){
		UserCart userCart = new UserCart();
		userCart.setUserId(11);
		List<UserCartVo> list = userCartMapper.selectUserCartByUserCart(userCart);
		for(UserCartVo v:list){
			String p1Value = v.getGp().getP1Value();
			System.out.println(v.getGp().getP1Id());
			System.out.println(v.getP().getPropertyName());
			System.out.println(p1Value);
		}
	}
	@Test
	public void testCartServiceSelectCartByUserId(){
		PageInfo<UserCartVo> page = userCartService.selectUserCartByUserId(11,1,5);
		//System.out.println(page.getList());
		for(UserCartVo v:page.getList()){
			Double p1Value = v.getGp().getPrice();
			System.out.println(p1Value);
		}
	}
	@Test
	public void testCartDeleteByGoodPropertyId(){

		UserCart userCart = new UserCart();
		userCart.setUserId(11);
		userCart.setGoodPropertyId(5);
		int i = userCartMapper.deleteByGoodsPropertyId(userCart);
		System.out.println(i);
	}
	//更新购物车数量
	@Test
	public void testUpdateUserCartNum(){
		UserCart condition = new UserCart();
		condition.setUserId(11);
		condition.setGoodPropertyId(8);
		condition.setNumber(10000);
		int i = userCartMapper.updateUserCartNum(condition);
		System.out.println(i);
	}
	
	@Test
	public void testCartSelectUserCartByGoodPropertyId(){
		UserCart userCart = new UserCart();
		userCart.setUserId(11);
		userCart.setGoodPropertyId(8);

		List<UserCartVo> usercart = userCartMapper.selectUserCartByUserCart(userCart);
		System.out.println(usercart.size());
		System.out.println(usercart.get(0).getG());
	}
	
}
