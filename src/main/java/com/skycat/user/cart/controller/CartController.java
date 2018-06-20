package com.skycat.user.cart.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skycat.store.dao.StoreMapper;
import com.skycat.store.entity.Store;
import com.skycat.user.address.entity.UserAddress;
import com.skycat.user.address.service.AddressService;
import com.skycat.user.cart.dao.UserCartMapper;
import com.skycat.user.cart.entity.CartData;
import com.skycat.user.cart.entity.UserCart;
import com.skycat.user.cart.entity.UserCartVo;
import com.skycat.user.cart.service.UserCartService;
import com.skycat.user.info.entity.User;

@RequestMapping("user/cart")
@Controller
public class CartController {
	
	@Resource
	UserCartService userCartService;
	
	@Resource
	StoreMapper storeMapper;
	
	@Resource 
	UserCartMapper userCartMapper;
	
	@Resource
	AddressService addressService;
	
	@RequestMapping("list")
	public String list(
			HttpSession session,
			ModelMap model){
		User userInSession = (User) session.getAttribute("user");
		
		//在购物车找到购物车信息
		List<UserCartVo> carts = userCartService.findUserCartInfoByUserId(userInSession.getUserId());
		model.put("carts", carts);
		model.put("userCartSize", carts.size());
		//商品属于哪几间店铺
		List<Store> stores = userCartService.findStoreIdByCartInfo(carts);
		model.put("stores", stores);
		
		//购物车商品数量
		model.put("goodsNum", carts.size());
		return "front/BuyCar";
	}
	@RequestMapping("delete")
	@ResponseBody
	public Map<String,Object> delete(@RequestParam("gpId")Integer goodPropertyId,HttpSession session){
		Map<String, Object> map = new HashMap<String,Object>();
		
		User userInSession = (User) session.getAttribute("user");
		
		if(goodPropertyId==null){
			map.put("msg", "操作错误");
			return map;
		}
		
		//根据用户id和商品属性id删除购物车记录
		int i = userCartService.deleteByGoodsPropertyId(userInSession.getUserId(),goodPropertyId);
		if(i==1){
			map.put("flag", true);
			map.put("msg", "删除成功!");
		}else{
			map.put("flag", false);
			map.put("msg", "删除失败!");
		}
		
		//购物车商品数量
		List<UserCartVo> carts = userCartService.findCartInfoByUserId(userInSession.getUserId(), goodPropertyId);
		map.put("goodsNum", carts.size());
		
		return map;
	}
	@RequestMapping("update")
	@ResponseBody
	public Map<String,Object> update(UserCart userCart,HttpSession session){
		Map<String, Object> map = new HashMap<String,Object>();
		
		if(userCart.getGoodPropertyId() == null){
			map.put("msg", "请选择你要更改的商品！");
			return map;
		}
		
		if(userCart.getNumber() == null){
			map.put("msg", "商品数量能更改为空！");
			return map;
		}
		
		User userInSession = (User) session.getAttribute("user");
		//根据商品属性id找到具体的购物车记录
		List<UserCartVo> cart = userCartService.findCartInfoByUserId(userInSession.getUserId(), userCart.getGoodPropertyId());
		if(cart.size() == 0){
			map.put("msg", "你的购物车没有该商品!");
			return map;
		}
		
		if(cart.size() == 1){
			map.put("msg", "你的购物车没有该商品!");
			
			//得到商品的单价，计算出商品总价
			Double price = cart.get(0).getGp().getPrice();
			userCart.setTotal( price * userCart.getNumber());
			
			//设置商品总价
			userCart.setUserId(userInSession.getUserId());
			int i = userCartService.updateUserCartNum(userCart);
			if(i==1){
				map.put("msg", "你的商品:"+cart.get(0).getG().getGoodTitle()+"数量已经改为:"+userCart.getNumber());
			}else{
				map.put("msg", "商品数量修改失败!");
			}
			
		}else{
			map.put("msg", "未知错误!");
		}
		return map;
	}
	
	/**
	 * 根据详情页添加的商品进行插入到UserCart表中，根据用户id和商品属性id查找userCart表是否有这条记录
	 * 有：进行数据表的更新操作
	 * 没有：进行数据插入操作
	 * @param number
	 * @param price
	 * @param goodPropertyId
	 * @param session
	 * @return
	 */
	@RequestMapping("/addGoodToCart")
	@ResponseBody
	public Map<String,Object> addGoodtoCart(Integer number,Double price,Integer goodPropertyId,HttpSession session){
		Map<String,Object> map = new HashMap<String,Object>();
		Double total = 0.0;
		
		//用户登录后信息存在session中
		User userInSession = (User) session.getAttribute("user");
		if(userInSession!=null){
			//找到购物车中的单条记录
			UserCart cart = userCartService.selectUserCartByGoodPropertyIdAndUserId(userInSession,goodPropertyId);
			if(cart!=null){
				//从数据库读取出来的值进行更新
				number+=cart.getNumber();
				total = number*price;
				cart.setNumber(number);
				cart.setTotal(total);
				int i = userCartService.updateUserCartByAddGood(cart);
				if(i>0){
					map.put("number", number);
					map.put("total", total);
					map.put("msg", i);
					return map;
				}
				
			}else{
				
				total = number*price;
				//购物车中没有该商品则添加到数据库
				int i = userCartService.insertUserCartByAddGood(number, total, userInSession.getUserId(), goodPropertyId);
				if(i>0){
					map.put("number", number);
					map.put("total", total);
					map.put("msg", i);
					return map;
				}
				
			}		
		}	
		map.put("msg",0);
		return map;
	}
	
	@RequestMapping("gotopay")
	@ResponseBody
	public Map<String,Object> gotopay(@RequestBody List<CartData> data,HttpSession session){
		Map<String, Object> map = new HashMap<String,Object>();
		System.out.println("========"+data);
		if(data.size() == 0){
			map.put("url", "/user/cart/list");
			return map;
		}
		session.setAttribute("cartData", data);
		map.put("url", "/user/cart/topay");
		return map;
	}
	@RequestMapping("topay")
	public String topay(HttpSession session,ModelMap model){
		List<CartData> data = (List<CartData>) session.getAttribute("cartData");
		//System.out.println("======="+data);
		if(data==null){
			return "front/BuyCar";
		}
		User userInSession = (User) session.getAttribute("user");
		List<UserCartVo> carts = userCartService.selectByGoodPropertyIds(userInSession.getUserId(), data);
		model.put("carts", carts);
		model.put("userCartSize", carts.size());
		
		List<Store> stores = userCartService.findStoreIdByCartInfo(carts);
		model.put("stores", stores);
		
		UserAddress defaultAddress = addressService.selectDefaultAddress(userInSession.getUserId());
		model.put("defaultAddress", defaultAddress);
		
		List<UserAddress> addresss = addressService.selectAllAddressByUserId(userInSession.getUserId());
		model.put("address", addresss);
		
		Double cartTotal = userCartService.caclCartTotalByUserId(userInSession.getUserId());
		model.put("cartTotal", cartTotal);
		
		return "front/BuyCar_Two";
	}
	@RequestMapping("createOrder")
	@ResponseBody
	public Map<String,Object> createOrder(@RequestBody List<CartData> cartData,HttpSession session,ModelMap model){
		System.out.println(cartData);
		User userInSession = (User)session.getAttribute("user");
		userCartService.createOrder(cartData,userInSession.getUserId());
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("url", "/user/order/list");
		return map;
	}
	
	
	
}
