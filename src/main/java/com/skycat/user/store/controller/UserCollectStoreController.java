package com.skycat.user.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("user/collect/store")
public class UserCollectStoreController {
	
	@RequestMapping("list")
	public String list(){
		return "front/Member_Collect";
	}
	
}
