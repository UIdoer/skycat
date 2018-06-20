package com.skycat.order.order.dao;

import java.util.List;
import java.util.Map;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.order.order.entity.Order;
import com.skycat.order.order.entity.OrderVo;
import com.skycat.order.order.entity.StoreOrderList;
import com.skycat.order.order.entity.UserOrderSearchCondition;

@MyBatisAnnotation
public interface OrderMapper extends BaseMapper<Order>{
    
    
    List<StoreOrderList> selectByPrimaryKeyForStoreOrderList(Map<String,Order> map);
    
    StoreOrderList selectStoreOrderByOrderId(Integer id);
    //根据用户id获取所有订单
    List<OrderVo> selectUserOrderByUserId(Integer userId);
    //多条件查询用户订单
    List<OrderVo> selectUserOrderByCondition(UserOrderSearchCondition condition);
    
    //更改订单状态
    int updateOrderStatus(Order order);
   
}