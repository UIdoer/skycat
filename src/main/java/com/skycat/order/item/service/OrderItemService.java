package com.skycat.order.item.service;

import java.util.List;

import com.skycat.base.service.BaseService;
import com.skycat.order.item.entity.OnceOrderItem;
import com.skycat.order.item.entity.OrderItem;

public interface OrderItemService extends BaseService<OrderItem>{

	List<OnceOrderItem> selectOnceOrderItemByOrderId(Integer id);
}
