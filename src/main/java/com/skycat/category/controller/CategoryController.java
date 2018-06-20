package com.skycat.category.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skycat.category.entity.Category;
import com.skycat.category.entity.CategoryLevel;
import com.skycat.category.service.CategoryService;

@Controller
@RequestMapping("category")
public class CategoryController {
	
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping("find")
	@RequiresRoles("systemManager")
	public String findCategories(ModelMap map) {
		List<CategoryLevel> level = categoryService.selectAllCategoryLevel();
		map.put("categories", level);
		return "back/product_category";
	}
	
	@RequestMapping("toModify")
	@RequiresRoles("systemManager")
	public String toModify(String id,ModelMap map) {
		Category category = categoryService.selectByPrimaryKey(Integer.valueOf(id));
		// 查找出一级分类供选择
		List<Category> all = categoryService.selectByParentId(0);
		map.put("all", all);
		map.put("category",category);
		return "back/edit_category";
	}
	
	@RequestMapping("toAdd")
	@RequiresRoles("systemManager")
	public String toAdd(ModelMap map) {
		// 查找出一级分类供选择
		List<Category> all = categoryService.selectByParentId(0);
		map.put("all", all);
		return "back/add_category";
	}
	
	@RequestMapping("doModify")
	@RequiresRoles("systemManager")
	@ResponseBody
	public String doUpdate(Category category) {
		int i = categoryService.updateByPrimaryKeySelective(category);
		if(i>0) {
			return "success";
		}
		return null;
	}
	
	@RequestMapping("doAdd")
	@RequiresRoles("systemManager")
	@ResponseBody
	public String doAdd(Category category) {
		int i = categoryService.insertSelective(category);
		if(i>0) {
			return "success";
		}
		return null;
	}
}
