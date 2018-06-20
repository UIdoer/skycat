package com.skycat.user.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.user.cart.entity.CartData;
import com.skycat.user.cart.entity.UserCart;
import com.skycat.user.cart.entity.UserCartVo;

@MyBatisAnnotation
public interface UserCartMapper extends BaseMapper<UserCart>{
	//插入数据
	int insert(UserCart record);
    //动态插入数据
    int insertSelective(UserCart record);
    //动态查询购物车
    List<UserCartVo> selectUserCartByUserCart(UserCart userCart);
    // 根据user_id和goods_property_id删除购物车记录
	int deleteByGoodsPropertyId(UserCart condition);
	// 根据用户id 和 商品属性id 和 需要设置的商品数量进行更新记录
	int updateUserCartNum(UserCart condition);
	
    List<UserCartVo> selectUserCartByUserId(Integer userid);
    
    /**
     * 根据用户Id和商品属性Id查询出购物车中的目标记录
     * @param userId
     * @param GoodPropertyId
     * @return
     */
    UserCart selectUserCartByGoodPropertyIdAndUserId(UserCart userCart);
    
    /**
     * 对存在的购物车商品，进行重新计算数量和总价钱
     * @param userCart
     * @return
     */
    int updateUserCartByAddGood(UserCart userCart);
    
    List<UserCartVo> selectByGoodPropertyIds(Map<String,Object> map);
    
    
}