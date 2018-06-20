package com.skycat.good.good.dao;

import java.util.List;
import java.util.Map;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.good.good.entity.Good;
import com.skycat.good.good.entity.Store_Good_List;
@MyBatisAnnotation
public interface GoodMapper extends BaseMapper<Good> {
	int deleteByPrimaryKey(Integer goodId);

	int insert(Good record);

	int insertSelective(Good record);
	/**
	 * 根据商品ID查询商品
	 */
	Good selectByPrimaryKey(Integer goodId);

	int updateByPrimaryKeySelective(Good record);

	int updateByPrimaryKey(Good record);

	/**
	 * 查询参加热门活动的商品
	 * 
	 * @param status
	 * @return
	 */
	List<Good> selectByBe_hot(Integer status);

	/**
	 * 根据商品的父类ID进行类目条件查询
	 * 
	 * @param id
	 * @return
	 */
	List<Good> selectGoodByCategory(Map<String,Object> map);

	/**
	 * 根据商品名称或者类目名或者店铺名进行模糊查询，返回商品列表给用户
	 * 
	 * @param GoodTitle
	 * @return
	 */
	List<Good> selectGoodByGoodTitle(Map<String,Object> map);

	/**
	 * 根据店铺Id,查找属于该店铺的所有商品
	 * 
	 * @param storeId
	 * @return
	 */
	List<Good> selectGoodByStoreId(Map<String,Object> map);

	// 根据商店ID查询商店内所有商品
	List<Store_Good_List> selectStore_Good_listByStoreId(Map hashMap);

	/**
	 * 查找所有待审核的商品
	 * @return
	 */
	List<Good> selectUncheckedGoods();
	
	/**
	 * 通过goodid找到store的name
	 * @param gid
	 * @return
	 */
	String selectStoreNameByGoodId(int gid);
	
	/**
	 * 改变审核商品的状态，包括通过审核和驳回修改
	 * @param map
	 * @return
	 */
	int updateGoodStatus(Map<String,Integer> map);
	
	/**
	 * 根据店铺ID随机查找5个店铺商品，返回商品详情页
	 * @param storeId
	 * @return
	 */
	List<Good> selectStoreGoodByStoreId(Integer storeId);
	
	/**
	 * 根据顶级父类ID查找所有商品，返回商品列表
	 * @param parentCategoryId
	 * @return
	 */
	List<Good> selectGoodByParrentCategoryId(Map<String,Object> map);
	
	/**
	 * 查找所有参加直通车的商品
	 * @return
	 */
	List<Good> selectGoodByBe_Top();
	
	/**
	 * 返回所有商品
	 * @param map
	 * @return
	 */
	List<Good> selectAllGood(Map<String,Object> map);
	
	
	
	
}