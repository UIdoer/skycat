package com.skycat.order.order.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.skycat.base.service.BaseService;
import com.skycat.order.order.entity.Order;
import com.skycat.order.order.entity.OrderVo;
import com.skycat.order.order.entity.StoreOrderList;
import com.skycat.order.order.entity.UserOrderSearchCondition;

public interface OrderService extends BaseService<Order>{

	
	List<StoreOrderList> selectByPrimaryKeyForStoreOrderList(Map map);
	
	StoreOrderList selectStoreOrderByOrderId(Integer id);
	//用户查看自己的所有订单
	List<OrderVo> selectUserOrderByUserId(Integer userId);
	//取消订单
	int cancelOrderByUserIdOderId(Integer userId, Integer orderId);
	//申请退货
	int returnOfGoodByUserIdOrderId(Integer userId,Integer orderId);
	//确认收货
	int confirmReceive(Integer userId ,Integer orderId);
	//获取订单列表
	PageInfo<OrderVo> selectUserOrderByCondition(UserOrderSearchCondition condition,Integer pageNum,Integer pageSize);
}
