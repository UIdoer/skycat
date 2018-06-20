package com.skycat.order.item.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.skycat.base.service.AbstractBaseServiceImpl;
import com.skycat.order.item.dao.OrderItemMapper;
import com.skycat.order.item.entity.OnceOrderItem;
import com.skycat.order.item.entity.OrderItem;

@Service
public class OrderItemServiceImpl extends AbstractBaseServiceImpl<OrderItem> implements OrderItemService{

	@Resource
	OrderItemMapper orderItemMapper;
	
	@Override
	public List<OnceOrderItem> selectOnceOrderItemByOrderId(Integer id) {
		return orderItemMapper.selectOnceOrderItemByOrderId(id);
	}

}
