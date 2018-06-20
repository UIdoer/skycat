package com.skycat.good.good.controller;

import java.util.HashMap;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.skycat.good.good.entity.Good;
import com.skycat.good.good.service.GoodService;

/**
 * 专门用于后台管理员审核商品用的controller
 * @author Administrator
 *
 */
@Controller
@RequestMapping("checkGood")
public class CheckGoodController {

	@Autowired
	GoodService goodService;
	
	@RequestMapping("find")
	@RequiresRoles("systemManager")
	public String find(@RequestParam(name="pageNum",defaultValue="1")String pageNum,@RequestParam(name="pageSize",defaultValue="10")String pageSize,ModelMap map) {
		PageInfo<Good> page = goodService.selectUncheckedGoods(Integer.valueOf(pageNum),Integer.valueOf(pageSize));
		List<Good> goods = page.getList();
		HashMap<Integer, String> names = new HashMap<Integer,String>();
		for (Good good : goods) {
			String storeName = goodService.selectStoreNameByGoodId(good.getGoodId());
			names.put(good.getGoodId(), storeName);
		}
		map.put("page", page);
		map.put("storeNames", names);
		return "back/check_product_list";
	}
	
	@RequestMapping("updateGoodStatus/{id}/{oper}")
	@RequiresRoles("systemManager")
	@ResponseBody
	public String approve(@PathVariable("id")int id,@PathVariable("oper")int oper,String goodId) {
		HashMap<String, Integer> param = new HashMap<String,Integer>();
		param.put("oper", oper);
		param.put("goodId", id);
		int res = goodService.updateGoodStatus(param);
		if(res>0) {
			return "success";
		}
		return null;
	}
	
}
