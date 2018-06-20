package com.skycat.rollimage.service;

import java.util.List;

import com.skycat.base.service.BaseService;
import com.skycat.rollimage.entity.RollImage;

public interface RollImageService extends BaseService<RollImage>{
	/**
     * 根据活动的商品状态，查询出所有可以显示在banner的商品广告
     * 
     */
    List<RollImage> selectRollImagesByStatus(Integer status);

}
