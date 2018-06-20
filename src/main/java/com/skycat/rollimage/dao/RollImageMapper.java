package com.skycat.rollimage.dao;

import java.util.List;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.rollimage.entity.RollImage;

@MyBatisAnnotation
public interface RollImageMapper extends BaseMapper<RollImage>{
    int deleteByPrimaryKey(Integer id);

    int insert(RollImage record);

    int insertSelective(RollImage record);

    RollImage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RollImage record);

    int updateByPrimaryKey(RollImage record);
    
    /**
     * 根据活动的商品状态，查询出所有可以显示在banner的商品广告
     * 
     */
    List<RollImage> selectRollImagesByStatus(Integer status);
}