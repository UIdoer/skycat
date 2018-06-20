package com.skycat.good.good.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.skycat.base.service.BaseService;
import com.skycat.good.good.entity.Good;
import com.skycat.good.good.entity.Store_Good_List;

public interface GoodService  extends BaseService<Good>{
	 /**
     * 查询参加热门活动的商品
     * @param status
     * @return
     */
   List<Good> selectByBe_hot(Integer status);
   
   /**
    * 根据商品的父类ID进行条件查询
    * @param id
    * @return
    */
   PageInfo<Good> selectGoodByCategory(Integer CategoryId,Integer pageNum,Integer pageSize,String condition,String sort);
   
   /**
    * 根据商品名称或类目名进行模糊查询，返回商品列表给用户
    * @param GoodTitle
    * @return
    */
  PageInfo<Good> selectGoodByGoodTitle(String GoodTitle,Integer pageNum,Integer pageSize,String condition,String sort);
   
   /**
    * 根据店铺Id,查找属于该店铺的所有商品
    * @param storeId
    * @return
    */
  PageInfo<Good> selectGoodByStoreId(Integer storeId,Integer pageNum,Integer pageSize,String condition,String sort);
  

   
 //根据商店ID查询商店内所有商品
   List<Store_Good_List> selectStore_Good_listByStoreId(Map hashMap);
   
   /**
	 * 查找所有待审核的商品
	 * @return
	 */
	PageInfo<Good> selectUncheckedGoods(int pageNum,int pageSize);
	
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
	PageInfo<Good> selectGoodByParrentCategoryId(Integer parentCategoryId,Integer pageNum,Integer pageSize,String condition,String sort);
	
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
	PageInfo<Good> selectAllGood(Integer pageNum,Integer pageSize,String condition,String sort);
	
	
}
