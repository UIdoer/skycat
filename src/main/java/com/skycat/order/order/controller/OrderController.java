package com.skycat.order.order.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skycat.order.order.entity.OrderVo;
import com.skycat.order.order.service.OrderService;
import com.skycat.user.info.entity.User;

@Controller
@RequestMapping("order")
public class OrderController {
	@Resource
	OrderService orderService;
	@RequestMapping("list")
	public String list(HttpSession session,ModelMap model){
		User userInSession = (User)session.getAttribute("user");
		List<OrderVo> orders = orderService.selectUserOrderByUserId(userInSession.getUserId());
		model.put("orders", orders);
		return "front/Member_Order";
	}
}
