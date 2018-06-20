package com.skycat.order;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import com.skycat.base.BaseTest;
import com.skycat.order.item.entity.OnceOrderItem;
import com.skycat.order.item.entity.OrderItem;
import com.skycat.order.item.service.OrderItemService;

public class TestOrderItem extends BaseTest{

	@Resource
	OrderItemService orderItemService;
	
	@Test
	public void test1() {
		OrderItem item = orderItemService.selectByPrimaryKey(1);
		System.out.println(item);
	}
	
	@Test
	public void test2() {
		List<OnceOrderItem> selectOnceOrderItemByOrderId = orderItemService.selectOnceOrderItemByOrderId(2);
		System.out.println(selectOnceOrderItemByOrderId);
	}
}
