package com.skycat.order.order.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.skycat.admin.entity.Admin;
import com.skycat.good.good.entity.Store_Good_List;
import com.skycat.message.entity.Message;
import com.skycat.message.service.MessageService;
import com.skycat.order.item.entity.OnceOrderItem;
import com.skycat.order.item.service.OrderItemService;
import com.skycat.order.order.entity.Order;
import com.skycat.order.order.entity.StoreOrderList;
import com.skycat.order.order.service.OrderService;

@Controller
@RequestMapping("/store/order")
public class StoreOrderController {

	@Resource
	OrderService orderService;
	@Resource
	OrderItemService orderItemService;
	
	@Resource
	MessageService messageService;
	
	
	//跳转到后台店铺订单列表
		@RequestMapping("/toStoreOrderList")
		public String toStoreList(@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
									@RequestParam(value="pageSize",defaultValue="10")Integer pageSize,
									@RequestParam(value="status",defaultValue="5")Integer status,
									String orderId,Integer storeId,ModelMap model){
			
			HashMap<String,Object> map=new HashMap();
			map.put("status", status);
			if("".equals(orderId)) {
				map.put("orderId", null);
			}else {
				map.put("orderId", orderId);
			}
			map.put("storeId", storeId);
			
			PageHelper.startPage(pageNum, pageSize);
			List<StoreOrderList> list = orderService.selectByPrimaryKeyForStoreOrderList(map);
			model.put("list", list);
			PageInfo<StoreOrderList> pageInfo = new PageInfo<StoreOrderList>(list);
			model.put("pageInfo", pageInfo);
			model.put("status", status);
			return "back/order_list";
			
		}
		
	//跳转到详细订单
		@RequestMapping("/toDetailMsg")
		public String toDetailMsg(Integer orderId,ModelMap model){
			try {
				List<OnceOrderItem> onceOrderItem = orderItemService.selectOnceOrderItemByOrderId(orderId);
				Order order2 = orderService.selectByPrimaryKey(orderId);
				model.put("item", onceOrderItem);
				StoreOrderList order = orderService.selectStoreOrderByOrderId(orderId);
				System.out.println(order);
				model.put("order", order);
				model.put("order2", order2);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}return "back/order_detail";
		}
		
	
		
	//发货处理
		@RequestMapping("/sendGood")
		public String sendGood(Integer orderId,Integer userId,HttpSession session,ModelMap map)  {
			Admin admin = (Admin)session.getAttribute("currAdmin");
			int StoreId=Integer.parseInt(admin.getStoreId());
			Message message = new Message();
			message.setMessageTitle("发货消息");
			message.setMessageInfo("您购买的商品已经在路上~~~~~~");
			message.setMessagerId(StoreId);
			message.setReceiverId(userId);
			message.setMessageType(0);
			
			int i = messageService.insertSelective(message);
			Order order = orderService.selectByPrimaryKey(orderId);
			order.setStatus(2);
			int j = orderService.updateByPrimaryKeySelective(order);
			if(i==1 && j==1) {
				map.put("msg", "发货成功");
			}
			return "redirect:/store/order/toStoreOrderList?storeId="+StoreId;
		}
		
		//请退款处理refund
		@RequestMapping("/refund")
		public String refund(Integer orderId,Integer userId,HttpSession session,ModelMap map){
			Admin admin = (Admin)session.getAttribute("currAdmin");
			int StoreId=Integer.parseInt(admin.getStoreId());
			Order order = orderService.selectByPrimaryKey(orderId);
			Integer status = order.getStatus();
			if(status==4) {
				order.setStatus(-1);
				int j = orderService.updateByPrimaryKeySelective(order);
				Message message = new Message();
				message.setMessageTitle("退款消息");
				message.setMessageInfo("您申请的退款已经完成~~~~~~");
				message.setMessagerId(StoreId);
				message.setReceiverId(userId);
				message.setMessageType(0);
				return "redirect:/store/order/toStoreOrderList?StoreId="+StoreId;
			}
			order.setStatus(-1);
			int j = orderService.updateByPrimaryKeySelective(order);
			Message message = new Message();
			message.setMessageTitle("订单消息");
			message.setMessageInfo("您的订单已经取消~~~~~~");
			message.setMessagerId(StoreId);
			message.setReceiverId(userId);
			message.setMessageType(0);
			return "redirect:/store/order/toStoreOrderList?storeId="+StoreId;
		}
}
