package com.skycat.category.dao;

import java.util.List;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.category.entity.BeTop;
import com.skycat.category.entity.Category;

@MyBatisAnnotation
public interface CategoryMapper extends BaseMapper<Category>{
    int deleteByPrimaryKey(Integer categoryId);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer categoryId);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
    
    /**
     * 查询所有Category信息
     * @return
     */
    List<Category> selectAllCategory();
    

    List<Category> selectByParentId(Integer parentId);
    
    //根据父级id寻找子列表
    List<Category> selectByParentIdForSoncategory(Integer parentId);

    /**
     * 查询Category类目下所有开通了直通车活动的商品，返回类目信息和商品列表
     * @return
     */
    List<Category> selectBe_topGoodByParrentId(Integer parentId);
    
    
    
    
    
}