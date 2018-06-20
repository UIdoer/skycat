package com.skycat.base.controller;

import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/base")
public class BaseController {

	@RequestMapping("/toIndex")
	@RequiresUser
	public String toIndex() {
		return "back/index";
	}
	
	@RequestMapping("/toMain")
	public String toMain() {
		return "back/main";
	}
	
	@RequestMapping("/toMenu")
	public String toMenu() {
		return "back/menu";
	}
	
	@RequestMapping("/toBar")
	public String toBar() {
		return "back/bar";
	}
	
	@RequestMapping("/toTop")
	public String toTop() {
		return "back/top";
	}
}
