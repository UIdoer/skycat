package com.skycat.category.service;

import java.util.List;
import java.util.Map;

import com.skycat.base.service.BaseService;
import com.skycat.category.entity.BeTop;
import com.skycat.category.entity.Category;
import com.skycat.category.entity.CategoryLevel;
/**
 * 类目接口
 * @author Administrator
 *
 */
public interface CategoryService extends BaseService<Category> {
	/**
     * 查询所有Category信息
     * @return
     */
    List<Category> selectAllCategory();
    
    //根据父级ID来查询
    List<Category> selectByParentId(Integer parentId);
    
    //根据父级id寻找子列表
    List<Category> selectByParentIdForSoncategory(Integer parentId);
    /**
     * 查询Category类目下所有开通了直通车活动的商品，返回类目信息和商品列表
     * @return
     */
   // List<BeTop> selectAllCategoryByBe_top();
    
    /**
     * 使用父类目的id查询所有的子类目
     * 分级封装
     * @param id
     * @return
     */
    List<CategoryLevel> selectAllCategoryLevel();
    
  //得到一级和二级
    public List<Category> selectSecondProperty();
    
    /**
     * 查询Category类目下所有开通了直通车活动的商品，返回类目信息和商品列表
     * @return
     */
    List<Category> selectBe_topGoodByParrentId(Integer parentId);
    
}
