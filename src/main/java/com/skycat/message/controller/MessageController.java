package com.skycat.message.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skycat.message.entity.Message;
import com.skycat.message.service.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {

	@Resource
	MessageService messageService;

	@RequestMapping("/toSendGoodMsg")
	public String toSendGoodMsg() {
		return "back/send_good_msg";
	}

	@RequestMapping("/toSalesPromotionMsg")
	public String toSalesPromotionMsg() {
		return "back/salesPromotion_msg";
	}

	/**
	 * 发送促销消息的controller
	 * 
	 * @param message
	 * @return
	 */
	@RequestMapping("/sendSalesPromotionMsg")
	public String sendSalesPromotionMsg(Message message,ModelMap model) {
		// 先判断标题是否为空
		if (message.getMessageTitle() != null && "".equals(message.getMessageTitle()) == false) {
			// 判断是否存在标题
			Message message2 = messageService.selectByMessageTitle(message);
			if (message2 != null) {
				model.put("msg", "发送失败，已存在此标题！！");
				return "back/salesPromotion_msg";
			} else {
				int i = messageService.insertSelective(message);
				if (i == 1) {
					model.put("msg", "发送成功！");
					return "back/salesPromotion_msg";
				}
			}
		} 
			model.put("msg", "发送失败，标题不能为空！！");
			return "back/salesPromotion_msg";
	}
	
	
}
