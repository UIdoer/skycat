package com.skycat.category.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skycat.base.service.AbstractBaseServiceImpl;
import com.skycat.category.dao.CategoryMapper;
import com.skycat.category.entity.BeTop;
import com.skycat.category.entity.Category;
import com.skycat.category.entity.CategoryLevel;
@Service
public class CategoryServiceImpl extends AbstractBaseServiceImpl<Category> implements CategoryService {
	@Autowired
	CategoryMapper categoryMapper;
	
	@Override
	public List<Category> selectAllCategory() {
		// TODO Auto-generated method stub
		return categoryMapper.selectAllCategory();
	}


	@Override
	public List<Category> selectByParentId(Integer parentId) {
		// TODO Auto-generated method stub
		return categoryMapper.selectByParentId(parentId);
	}

	@Override
	public List<Category> selectByParentIdForSoncategory(Integer parentId) {
		// TODO Auto-generated method stub
		return categoryMapper.selectByParentIdForSoncategory(parentId);
	}

//	@Override
//	public List<BeTop> selectAllCategoryByBe_top() {
//		// TODO Auto-generated method stub
//		return categoryMapper.selectAllCategoryByBe_top();
//	}

	@Override
	public List<CategoryLevel> selectAllCategoryLevel() {
		ArrayList<CategoryLevel> list = new ArrayList<CategoryLevel>();
		//HashMap<Integer, List<Category>> map = new HashMap<>();
		//一级分类
		List<Category> firstClass = categoryMapper.selectByParentId(0);
		CategoryLevel first = new CategoryLevel();
		first.setCategories(firstClass);
		first.setLevel(1);
		first.setParentId(0);
		list.add(first);
		//map.put(0,firstClass);
		
		//二级分类
		for (Category fc : firstClass) {
			Integer fcId = fc.getCategoryId();
			List<Category> secondClass = categoryMapper.selectByParentId(fcId);
			CategoryLevel second = new CategoryLevel();
			second.setCategories(secondClass);
			second.setLevel(2);
			second.setParentId(fcId);
			list.add(second);
			//map.put(fcId,secondClass);
			//三级分类
			/*for (Category sc : secondClass) {
				Integer scId = sc.getCategoryId();
				List<Category> thirdClass = categoryMapper.selectByParentId(scId);
				CategoryLevel third = new CategoryLevel();
				third.setCategories(thirdClass);
				third.setLevel(3);
				third.setParentId(scId);
				list.add(third);
				//map.put(scId, thirdClass);
			}*/
		}
		
		return list;
	}

//得到一级和二级
	public List<Category> selectSecondProperty(){
		List<Category> getLastCategorys=new ArrayList();
		List<Category> firstCategorys = categoryMapper.selectByParentId(0);
		
		for(Category category:firstCategorys){
//			List<Category> getOnceSecondCategorys=new ArrayList();
			List<Category> secondCategorys = categoryMapper.selectByParentIdForSoncategory(category.getCategoryId());
			category.setSonCategory(secondCategorys);
			getLastCategorys.add(category);
		}
		return getLastCategorys;
	}


	@Override
	public List<Category> selectBe_topGoodByParrentId(Integer parentId) {
		// TODO Auto-generated method stub
		return categoryMapper.selectBe_topGoodByParrentId(parentId);
	}



}
