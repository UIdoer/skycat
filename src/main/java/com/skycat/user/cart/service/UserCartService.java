package com.skycat.user.cart.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.skycat.base.service.BaseService;
import com.skycat.good.good.entity.Good;
import com.skycat.store.entity.Store;
import com.skycat.user.cart.entity.CartData;
import com.skycat.user.cart.entity.UserCart;
import com.skycat.user.cart.entity.UserCartVo;
import com.skycat.user.info.entity.User;

@Service
public interface UserCartService extends BaseService<UserCart>{
	//根据用户id 查询购物车分页
	PageInfo<UserCartVo> selectUserCartByUserId(Integer userid,Integer pageNum,Integer pageSize);
	//根据用户id 查询购物车所有商品
	List<UserCartVo> findUserCartInfoByUserId(Integer userid);
	//根据用户购物车商品集合，得到用户惠顾的商店id
	List<Store> findStoreIdByCartInfo(List<UserCartVo> userCartVo);
	//根据用户id和商品属性id 找到具体记录
	List<UserCartVo> findCartInfoByUserId(Integer userid,Integer goodPropertyId);
	//根据用户id和商品属性id更新 商品数量
	int updateUserCartNum(UserCart userCart);
	//根据用户id和商品属性id删除购物车记录
	int deleteByGoodsPropertyId(Integer userId,Integer goodPropertyId);
	//根据用户id查询购物车总价
	Double caclCartTotalByUserId(Integer userId);
	
	/**
     * 根据用户Id和商品属性Id查询出购物车中的目标记录
     * @param userId
     * @param GoodPropertyId
     * @return
     */
	public UserCart selectUserCartByGoodPropertyIdAndUserId(User user,Integer goodPropertyId);
	
	/**
     * 对存在的购物车商品，进行重新计算数量和总价钱
     * @param userCart
     * @return
     */
    int updateUserCartByAddGood(UserCart userCart);
    
    /**
     * 添加商品到购物车中，调用Mapper层的insert方法
     * @param number
     * @param total
     * @param userId
     * @param goodPropertyId
     * @return
     */
    int insertUserCartByAddGood(Integer number,Double total,Integer userId,Integer goodPropertyId);
	
    List<UserCartVo> selectByGoodPropertyIds(Integer userId,List<CartData> cartData);
    //根据购物车信息创建订单
	int createOrder(List<CartData> cartData,Integer userId);
	 Double calcOrderItemTotal( Integer userId, Integer goodPropertyId);
}
