package com.skycat.category.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skycat.category.entity.Category;
import com.skycat.category.service.CategoryService;
import com.skycat.good.good.entity.Good;
import com.skycat.good.good.service.GoodService;
import com.skycat.rollimage.entity.RollImage;
import com.skycat.rollimage.service.RollImageService;
import com.skycat.store.entity.Store;
import com.skycat.user.cart.entity.UserCartVo;
import com.skycat.user.cart.service.UserCartService;
import com.skycat.user.info.entity.User;

@Controller
@RequestMapping
public class IndexController {
	
	@Autowired
	CategoryService categoryService;
	@Autowired
	GoodService goodService;
	@Autowired
	RollImageService rollImageService;
	
	@Resource
	UserCartService userCartService;  
	
	
	//跳转到首页
	@RequestMapping("/Index")
	public String toIndex(ModelMap map,HttpSession session){
		//获取所有类目与分类
		List<Category> categorys = categoryService.selectAllCategory();
		//获取参加热卖活动的商品
		List<Good> be_Hot = goodService.selectByBe_hot(0);
		//获取banner图广告，点击图片后进入广告商品列表
		List<RollImage> rollImages = rollImageService.selectRollImagesByStatus(0);
		//获取直通车活动的商品信息，和类目信息，返回列表
		//List<BeTop> be_Top = categoryService.selectAllCategoryByBe_top();
		List<Category> categoryLevle = categoryService.selectBe_topGoodByParrentId(0);
		System.out.println(categoryLevle.get(0));
		System.out.println(categoryLevle.get(1));
		System.out.println(categoryLevle);
		User userInSession = (User) session.getAttribute("user");
		
		
		List<UserCartVo> userCart = new ArrayList<UserCartVo>();
		Double cartTotal = 0d;
		int userCartSize = 0;
		if(userInSession!=null){
			userCartSize = userCart.size();
			userCart = userCartService.findUserCartInfoByUserId(userInSession.getUserId());
			cartTotal = userCartService.caclCartTotalByUserId(userInSession.getUserId());
		}
		//获取购物车信息
		// userCart.get(0).getUc().getNumber();
		//获取购物车总价
		map.put("categorys", categorys);
		map.put("Be_Hot", be_Hot);
		map.put("rollImages", rollImages);
		map.put("userCart", userCart);
		map.put("userCartSize", userCartSize);
		map.put("cartTotal", cartTotal);
		map.put("categoryLevle", categoryLevle);
		//map.put("be_Top", be_Top);
		return "front/Index";
	}
	
	
	
	

}
