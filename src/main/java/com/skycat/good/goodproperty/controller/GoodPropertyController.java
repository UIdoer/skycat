package com.skycat.good.goodproperty.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skycat.good.goodproperty.entity.GoodProperty;
import com.skycat.good.goodproperty.service.GoodPropertyService;

@Controller
@RequestMapping("/goodProperty")
public class GoodPropertyController {
	
	@Autowired
	GoodPropertyService goodPropertyService;
	
	@RequestMapping("/toFindProperty")
	@ResponseBody
	public Map<String,Object> toFindProperty(Integer goodPropertyId){
		Map<String, Object> map = new HashMap<String,Object>();
		GoodProperty good_Property = goodPropertyService.selectByPrimaryKey(goodPropertyId);
		map.put("good_Property", good_Property);
		return map;
			
	}

}
