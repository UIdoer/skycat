package com.skycat.order.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.skycat.base.service.AbstractBaseServiceImpl;
import com.skycat.good.property.dao.PropertyMapper;
import com.skycat.order.item.entity.OrderItemVo;
import com.skycat.order.order.dao.OrderMapper;
import com.skycat.order.order.entity.Order;
import com.skycat.order.order.entity.OrderVo;
import com.skycat.order.order.entity.StoreOrderList;
import com.skycat.order.order.entity.UserOrderSearchCondition;

@Service
public class OrderServiceImpl extends AbstractBaseServiceImpl<Order> implements OrderService{

	@Resource
	OrderMapper orderMapper;
	@Autowired
	PropertyMapper propertyMapper;
	
	@Override
	public List<StoreOrderList> selectByPrimaryKeyForStoreOrderList(Map map) {
		return orderMapper.selectByPrimaryKeyForStoreOrderList(map);
	}

	@Override
	public StoreOrderList selectStoreOrderByOrderId(Integer id) {
		return orderMapper.selectStoreOrderByOrderId(id);
	}

	@Override
	public List<OrderVo> selectUserOrderByUserId(Integer userId) {
		List<OrderVo> list = orderMapper.selectUserOrderByUserId(userId);
		for (OrderVo order : list) {
			List<OrderItemVo> items = order.getOrderItem();
			for (OrderItemVo item : items) {
				item.getGp().setP1Name(propertyMapper.selectPropertyNameById(item.getGp().getP1Id()));
				item.getGp().setP2Name(propertyMapper.selectPropertyNameById(item.getGp().getP2Id()));
			}
		}
		return list;
	}

	@Override
	public int cancelOrderByUserIdOderId(Integer userId, Integer orderId) {
		Order order = new Order(); 
		order.setUserId(userId);
		order.setOrderId(orderId);
		order.setStatus(-1);
		return orderMapper.updateOrderStatus(order);
	}

	@Override
	public int returnOfGoodByUserIdOrderId(Integer userId, Integer orderId) {
		Order order = new Order(); 
		order.setUserId(userId);
		order.setOrderId(orderId); 
		order.setStatus(4);
		return orderMapper.updateOrderStatus(order);
	}

	@Override
	public PageInfo<OrderVo> selectUserOrderByCondition(UserOrderSearchCondition condition, Integer pageNum,
			Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<OrderVo> list = orderMapper.selectUserOrderByCondition(condition);
		for (OrderVo order : list) {
			List<OrderItemVo> items = order.getOrderItem();
			for (OrderItemVo item : items) {
				item.getGp().setP1Name(propertyMapper.selectPropertyNameById(item.getGp().getP1Id()));
				item.getGp().setP2Name(propertyMapper.selectPropertyNameById(item.getGp().getP2Id()));
			}
		}
		return new PageInfo<OrderVo>(list);
	}

	@Override
	public int confirmReceive(Integer userId, Integer orderId) {
		Order order = new Order(); 
		order.setUserId(userId);
		order.setOrderId(orderId); 
		order.setStatus(3); 
		return orderMapper.updateOrderStatus(order);
	}

	

	

	
	
	

}
