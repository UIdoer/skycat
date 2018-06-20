package com.skycat.order.item.dao;

import java.util.List;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.order.item.entity.OnceOrderItem;
import com.skycat.order.item.entity.OrderItem;

@MyBatisAnnotation
public interface OrderItemMapper extends BaseMapper<OrderItem>{
	
	List<OnceOrderItem> selectOnceOrderItemByOrderId(Integer id);
}