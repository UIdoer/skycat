package com.skycat.store.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.skycat.admin.entity.Admin;
import com.skycat.admin.service.AdminService;
import com.skycat.base.entity.ResultObject;
import com.skycat.store.entity.Store;
import com.skycat.store.entity.StorePageCondition;
import com.skycat.store.service.StoreService;

@Controller
@RequestMapping("store")
public class StoreController {

	@Autowired
	StoreService storeService;
	@Autowired
	AdminService adminService;
	
	/**
	 * 带条件的查询，没有条件默认就是查询所有
	 * 默认第一页，默认每页5条
	 * @param condition
	 * @param map
	 * @return
	 */
	@RequestMapping("find")
	@RequiresRoles("systemManager")
	public String findStore(StorePageCondition condition,ModelMap map) {
		condition.setPageNum(condition.getPageNum()==0?-1:condition.getPageNum());
		condition.setPageSize(condition.getPageSize()==0?5:condition.getPageSize());
		//condition.setStatus(condition.getStatus()==0?-1:condition.getStatus());
		PageInfo<Store> page = storeService.selectPageByCondition(condition);
		map.put("page", page);
		map.put("condition", condition);
		return "back/store_list";
	}
	
	@RequestMapping("toModify")
	@RequiresRoles("systemManager")
	public String toModify(ModelMap map,String id) {
		Store store = storeService.selectByPrimaryKey(Integer.valueOf(id));
		List<Admin> list = adminService.selectValid();
		map.put("admins", list);
		map.put("store", store);
		return "back/edit_store";
	}
	
	@RequestMapping("checkManagerId")
	@ResponseBody
	public String checkManagerId(String id) {
		Admin admin = adminService.selectByPrimaryKey(Integer.valueOf(id));
		if(null!=admin) {
			return "success";
		}
		return null;
	}
	
	/**
	 * 填写的管理员id可能有三种不同的情况
	 * 1. 管理员id不存在
	 * 2. 管理员不是管理店铺的
	 * 3. 管理员已经管理了别的店铺
	 * 所以我们直接在后台把可用的管理员列好给前台选择就可以了，避免麻烦的验证
	 * @param store
	 * @return
	 */
	@RequestMapping("doModify")
	@RequiresRoles("systemManager")
	@ResponseBody
	public ResultObject doModify(Store store) {
		int i = storeService.updateByPrimaryKeySelective(store);
		if(i>0) {
			return new ResultObject(store,"success");
		}
		return new ResultObject(null,"fail");
	}
}
