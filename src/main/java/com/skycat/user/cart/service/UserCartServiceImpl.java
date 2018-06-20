package com.skycat.user.cart.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.skycat.base.service.AbstractBaseServiceImpl;
import com.skycat.order.item.dao.OrderItemMapper;
import com.skycat.order.item.entity.OrderItem;
import com.skycat.order.order.dao.OrderMapper;
import com.skycat.order.order.entity.Order;
import com.skycat.store.dao.StoreMapper;
import com.skycat.store.entity.Store;
import com.skycat.user.cart.dao.UserCartMapper;
import com.skycat.user.cart.entity.CartData;
import com.skycat.user.cart.entity.UserCart;
import com.skycat.user.cart.entity.UserCartVo;
import com.skycat.user.info.entity.User;
@Service
public class UserCartServiceImpl 
extends AbstractBaseServiceImpl<UserCart>
implements UserCartService
{

	@Resource
	UserCartMapper userCartMapper;
	@Resource
	StoreMapper storeMapper;
	@Resource
	OrderMapper orderMapper;
	@Resource
	OrderItemMapper orderItemMapper;
	@Override
	public PageInfo<UserCartVo> selectUserCartByUserId(Integer userid,Integer pageNum,Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		UserCart userCart = new UserCart();
		userCart.setUserId(userid);
		List<UserCartVo> list = userCartMapper.selectUserCartByUserCart(userCart);
		return new PageInfo<UserCartVo>(list);
	}

	@Override
	public List<UserCartVo> findUserCartInfoByUserId(Integer userId) {
		UserCart usercart = new UserCart();
		usercart.setUserId(userId);
		return  userCartMapper.selectUserCartByUserCart(usercart);
	}

	@Override
	public List<Store> findStoreIdByCartInfo(List<UserCartVo> userCartVo) {
		Set<Integer> sids = new HashSet<Integer>();
		for (UserCartVo v : userCartVo) {
			sids.add(v.getS().getStoreId());
		}
		List<Store> stores = new ArrayList<Store>();
		for (Integer sid : sids) {
			stores.add(storeMapper.selectByPrimaryKey(sid));
		}
		return stores;
	}

	@Override
	public List<UserCartVo> findCartInfoByUserId(Integer userId, Integer goodPropertyId) {
		UserCart userCart = new UserCart();
		userCart.setGoodPropertyId(goodPropertyId);
		userCart.setUserId(userId);
		return userCartMapper.selectUserCartByUserCart(userCart);
	}

	@Override
	public int updateUserCartNum(UserCart userCart) {
		return userCartMapper.updateUserCartNum(userCart);
	}

	@Override
	public int deleteByGoodsPropertyId(Integer userId, Integer goodPropertyId) {
		UserCart userCart = new UserCart();
		userCart.setGoodPropertyId(goodPropertyId);
		userCart.setUserId(userId);
		return userCartMapper.deleteByGoodsPropertyId(userCart);
	}

	@Override
	public Double caclCartTotalByUserId(Integer userId) {
		UserCart userCart = new UserCart();
		userCart.setUserId(userId);
		List<UserCartVo> cart = userCartMapper.selectUserCartByUserCart(userCart);
		Double cartTotal = 0d;
		for (UserCartVo v : cart) {
			cartTotal += v.getGp().getPrice() * v.getUc().getNumber();
		}
		return cartTotal;
	}

	@Override
	public UserCart selectUserCartByGoodPropertyIdAndUserId(User user,Integer goodPropertyId) {
		UserCart userCart = new UserCart();
		userCart.setGoodPropertyId(goodPropertyId);
		userCart.setUserId(user.getUserId());
		return userCartMapper.selectUserCartByGoodPropertyIdAndUserId(userCart);
	}

	@Override
	public int updateUserCartByAddGood(UserCart userCart) {
		// TODO Auto-generated method stub
		return userCartMapper.updateUserCartByAddGood(userCart);
	}

	@Override
	public int insertUserCartByAddGood(Integer number, Double total, Integer userId, Integer goodPropertyId) {
		// TODO Auto-generated method stub
		UserCart cart = new UserCart();
		cart.setNumber(number);
		cart.setTotal(total);
		cart.setUserId(userId);
		cart.setGoodPropertyId(goodPropertyId);
		return userCartMapper.insert(cart);
	}

	@Override
	public List<UserCartVo> selectByGoodPropertyIds(Integer userId, List<CartData> cartData) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("cartData", cartData);
		return userCartMapper.selectByGoodPropertyIds(map);
	}
	
	@Override
	public Double calcOrderItemTotal( Integer userId, Integer goodPropertyId){
		List<UserCartVo> userCartVo = findCartInfoByUserId(userId,goodPropertyId);
		UserCartVo vo = userCartVo.get(0);
		Double price = vo.getGp().getPrice();
		Integer number = vo.getUc().getNumber();
		return price * number;
	}
	@Override
	public int createOrder(List<CartData> cartData,Integer userId) {
		//商品属性id
		for (CartData cart : cartData) {
			Order order = new Order();
			
			order.setRemark(cart.getRemark());
			order.setStoreId(cart.getStoreId());
			order.setUserId(userId);
			order.setAddId(cart.getAddressId());
			
			List<Integer> goodPropertyIds = cart.getGoodPropertyIds();
			Double orderTotal = 0d;
			for (Integer goodPropertyId : goodPropertyIds) {
				orderTotal += calcOrderItemTotal(userId,goodPropertyId);
			}
			order.setStatus(0);//生成订单,未付款状态
			order.setTotal(orderTotal);
			 orderMapper.insertSelective(order);
			int orderId = order.getOrderId();
			for (Integer goodPropertyId : goodPropertyIds) {
				OrderItem orderItem = new OrderItem();
				orderItem.setGoodPropertyId(goodPropertyId);
				orderItem.setOrderId(orderId);
				orderItem.setTotal(calcOrderItemTotal(userId,goodPropertyId));
				Integer number = findCartInfoByUserId(userId,goodPropertyId).get(0).getUc().getNumber();
				orderItem.setItemCount(number);
				orderItemMapper.insertSelective(orderItem);
				deleteByGoodsPropertyId(userId,goodPropertyId);
			}
		}
		
		return cartData.size();
	}

	
	
	

}
