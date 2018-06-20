package com.skycat.good.goodproperty.service;

import java.util.List;

import com.skycat.base.service.BaseService;
import com.skycat.good.goodproperty.entity.GoodProperty;

public interface GoodPropertyService extends BaseService<GoodProperty>{

	//根据商品ID去查找
	  List<GoodProperty> selectGoodPropertysByGoodId(Integer goodId);
	  
	  /**根据商品ID去查找颜色属性
     * /
     * @param id
     * @return
     */
    List<String> selectGoodPropertyColorByGoodId(int id);
    
    /**根据商品ID去查找属性
     * 
     * @param id
     * @return
     */
    List<GoodProperty> selectGoodPropertyByGoodId(int id);
}
