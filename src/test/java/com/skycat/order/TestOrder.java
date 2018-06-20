package com.skycat.order;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import com.github.pagehelper.PageInfo;
import com.skycat.base.BaseTest;
import com.skycat.order.item.entity.OrderItemVo;
import com.skycat.order.order.dao.OrderMapper;
import com.skycat.order.order.entity.Order;
import com.skycat.order.order.entity.OrderVo;
import com.skycat.order.order.entity.StoreOrderList;
import com.skycat.order.order.entity.UserOrderSearchCondition;
import com.skycat.order.order.service.OrderService;

public class TestOrder extends BaseTest{

	@Resource
	OrderService orderService;
	@Resource
	OrderMapper orderMapper;
	@Test
	public void test6(){
		UserOrderSearchCondition condition = new UserOrderSearchCondition(); 
		condition.setUserId(27);
	//	condition.setGoodTitle("疯");
		//condition.setOrderId(3);
		condition.setIsCommented(0);
		  PageInfo<OrderVo> info = orderService.selectUserOrderByCondition(condition,1,10); 
		List<OrderVo> list = info.getList();
		for (OrderVo vo : list) {
			System.out.println(vo.getOrderItem());
			List<OrderItemVo> item = vo.getOrderItem(); 
			for (OrderItemVo o : item) {
				System.out.println(o);
			}
		}
	}
	@Test
	public void test5(){
		UserOrderSearchCondition condition = new UserOrderSearchCondition(); 
		condition.setUserId(27);
	//	condition.setGoodTitle("疯");
		//condition.setOrderId(3);
		condition.setIsCommented(0);
		List<OrderVo> list = orderMapper.selectUserOrderByCondition(condition); 
		for (OrderVo vo : list) {
			List<OrderItemVo> item = vo.getOrderItem(); 
			for (OrderItemVo itvo : item) {
				System.out.println(itvo);
			}
		}
	}
	@Test
	public void test2() {
		  StoreOrderList orderList = orderService.selectStoreOrderByOrderId(2);
		System.out.println(orderList);
	}
	
	@Test
	public void test1() {
		  Order selectByPrimaryKey = orderService.selectByPrimaryKey(4);
		System.out.println(selectByPrimaryKey);
	}
	@Test 
	public void test3(){
		List<OrderVo> vo = orderService.selectUserOrderByUserId(27);
		System.out.println(vo.get(0));
	}
	
	@Test
	public void test4(){
		List<OrderVo> list = orderService.selectUserOrderByUserId(27);
		for (OrderVo o : list) {
			System.out.println("orderItem : "+o.getOrderItem());
		}
	}
}
