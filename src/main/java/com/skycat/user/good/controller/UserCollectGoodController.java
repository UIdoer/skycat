package com.skycat.user.good.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("user/collect/good")
public class UserCollectGoodController {
	
	@RequestMapping("list")
	public String list(){
		return "front/Member_Collect";
	}
	
}
