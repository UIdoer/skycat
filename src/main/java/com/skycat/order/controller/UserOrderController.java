package com.skycat.order.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.skycat.order.order.entity.OrderVo;
import com.skycat.order.order.entity.UserOrderSearchCondition;
import com.skycat.order.order.service.OrderService;
import com.skycat.user.info.entity.User;
@Controller
@RequestMapping("user/order")
public class UserOrderController {
	@Resource
	OrderService orderService;
	@RequestMapping("list")
	public String list(
			@RequestParam(name="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(name="pageSize",defaultValue="5") Integer pageSize,
			UserOrderSearchCondition condition,
			HttpSession session,
			ModelMap model){
		System.out.println(condition);
		User userInSession = (User)session.getAttribute("user");
		condition.setUserId(userInSession.getUserId());
		PageInfo<OrderVo> page = orderService.selectUserOrderByCondition(condition,pageNum,pageSize);
		model.put("condition", condition);
		model.put("page", page);
		return "front/Member_Order";
	}
	
	@RequestMapping("cancel")
	@ResponseBody
	public Map<String ,Object> cancelOrder(@RequestParam("orderId") Integer orderId,HttpSession session){
		Map<String, Object> map = new HashMap<String,Object>();
		User userInSession = (User) session.getAttribute("user");
		int i = orderService.cancelOrderByUserIdOderId(userInSession.getUserId(),orderId);
		if(i==1){
			map.put("msg", "订单已经取消");
		}else{
			map.put("msg", "操作失败请联系管理员!");
		}
		return map; 
	}
	@RequestMapping("returnOfGood")
	@ResponseBody
	public Map<String,Object> returnOfGood(@RequestParam("orderId") Integer orderId,HttpSession session){
		Map<String, Object> map = new HashMap<String,Object>();
		User userInSession = (User)session.getAttribute("user");
		int i = orderService.returnOfGoodByUserIdOrderId(userInSession.getUserId(), orderId);
		if(i==1){
			map.put("msg", "你的退货申请已经提交!");
		}else{
			map.put("msg", "操作失败请联系管理员!");
		}
		return map;
	}
	@RequestMapping("confirmReceive")
	@ResponseBody
	public Map<String,Object> confirmReceive(@RequestParam("orderId") Integer orderId,HttpSession session){
		Map<String, Object> map = new HashMap<String,Object>();
		User userInSession = (User)session.getAttribute("user");
		int i = orderService.confirmReceive(userInSession.getUserId(), orderId);
		if(i==1){
			map.put("msg", "欧了!完美完成交易！接着你可以评论本次交易哦!");
		}else{
			map.put("msg", "操作失败请联系管理员!");
		}
		return map;
	}
	
	
	
}
