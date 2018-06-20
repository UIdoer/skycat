package com.skycat.good.goodproperty.dao;

import java.util.List;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.good.goodproperty.entity.GoodProperty;

@MyBatisAnnotation
public interface GoodPropertyMapper extends BaseMapper<GoodProperty> {
	int deleteByPrimaryKey(Integer goodPropertyId);

	int insert(GoodProperty record);

	int insertSelective(GoodProperty record);
	/**
	 * 根据商品属性ID查找
	 * @param goodPropertyId
	 * @return
	 */
	GoodProperty selectByPrimaryKey(Integer goodPropertyId);

	int updateByPrimaryKeySelective(GoodProperty record);


	/**
	 * 根据商品ID去查找属性 /
	 * 
	 * @param id
	 * @return
	 */
	List<GoodProperty> selectGoodPropertyByGoodId(int id);

	/**
	 * 根据商品ID去查找颜色属性 /
	 * 
	 * @param id
	 * @return
	 */
	List<String> selectGoodPropertyColorByGoodId(int id);

    int updateByPrimaryKey(GoodProperty record);
    
    //根据商品ID去查找
  List<GoodProperty> selectGoodPropertysByGoodId(Integer goodId);
    
}