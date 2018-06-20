package com.skycat.good.good.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.skycat.category.entity.Category;
import com.skycat.category.service.CategoryService;
import com.skycat.good.comment.entity.GoodComment;
import com.skycat.good.comment.service.GoodCommentService;
import com.skycat.good.good.entity.Good;
import com.skycat.good.good.service.GoodService;
import com.skycat.good.goodproperty.entity.GoodProperty;
import com.skycat.good.goodproperty.service.GoodPropertyService;
import com.skycat.store.entity.Store;
import com.skycat.store.service.StoreService;

@Controller
@RequestMapping("/good")
public class GoodController {
	@Autowired
	GoodService goodService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	GoodPropertyService  goodPropertyService;
	@Autowired
	GoodCommentService goodCommentService;
	@Autowired
	StoreService storeService;
	
	
	/**
	 * 根据商品ID查询商品跳转到商品详情页
	 * @param id
	 * @return
	 */
	@RequestMapping("/findGood")
	public String findGoodByGoodId(int GoodId,ModelMap map){
		//根据商品ID查询商品
		Good good = goodService.selectByPrimaryKey(GoodId);
		
		//根据商品ID查询商品所属店铺
		Store store = storeService.selectByPrimaryKey(good.getStoreId());
		
		//获取所有类目与分类
		List<Category> categorys = categoryService.selectAllCategory();
		
		//根据商品ID获取该商品的商品属性
		List<GoodProperty> goodPropertys = goodPropertyService.selectGoodPropertyByGoodId(GoodId);
		
		//根据商品ID获取该商品的商品颜色属性
		List<String> goodColor = goodPropertyService.selectGoodPropertyColorByGoodId(GoodId);
		
		//根据店铺ID随机查找5个店铺商品，返回商品详情页,用作店铺商品推广，用户还喜欢模块
		List<Good> storeGood = goodService.selectStoreGoodByStoreId(good.getStoreId());
		
		map.put("categorys", categorys);
		map.put("store", store);
		map.put("good", good);
		map.put("goodPropertys", goodPropertys);
		map.put("goodColor", goodColor);
		map.put("storeGood", storeGood);
		return "front/Product";
		
	}
	
	/**
	 * 根据二级类目ID进行商品查找，然后跳转到商品列表
	 * @return
	 */
	@RequestMapping("/findCategoryGood")
	public String findGoodByCategory(@RequestParam(value="CategoryId",required=false)int CategoryId,
			@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="25")Integer pageSize,
			@RequestParam(value="condition",defaultValue="defualt-key")String condition,
			@RequestParam(value="sort",defaultValue="defualt-sort") String sort,
			ModelMap map){
		PageInfo<Good> list = goodService.selectGoodByCategory(CategoryId, pageNum, pageSize, condition, sort);
		//获取所有类目与分类
		List<Category> categorys = categoryService.selectAllCategory();
		//获取直通车商品
		List<Good> be_top = goodService.selectGoodByBe_Top();
		
		map.put("currentPage", list);
		map.put("condition", condition);
		map.put("sort", sort);
		map.put("CategoryId", CategoryId);
		map.put("be_top", be_top);
		map.put("categorys", categorys);
		return "front/Category_List";
	}
	
	/**
	 * 根据顶级父类ID查找所有商品，返回商品列表
	 * @return
	 */
	@RequestMapping("/findGoodByParrentCategoryId")   
	public String findGoodByParrentCategoryId(@RequestParam(value="parentCategoryId",required=false)int parentCategoryId,
			@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="25")Integer pageSize,
			@RequestParam(value="condition",defaultValue="defualt-key")String condition,
			@RequestParam(value="sort",defaultValue="defualt-sort") String sort,
			ModelMap map){
		
		PageInfo<Good> list = goodService.selectGoodByParrentCategoryId(parentCategoryId, pageNum, pageSize, condition, sort);
		//获取所有类目与分类
		List<Category> categorys = categoryService.selectAllCategory();
		//获取直通车商品
		List<Good> be_top = goodService.selectGoodByBe_Top();
		
		map.put("currentPage", list);
		map.put("condition", condition);
		map.put("sort", sort);
		map.put("parentCategoryId", parentCategoryId);
		map.put("be_top", be_top);
		map.put("categorys", categorys);
		return "front/Parrent_Category_List";
	}
	
	
	/**
    * 根据商品名称或者类目名或者店铺名进行模糊查询，返回商品列表给用户
    * @param GoodTitle
    * @return
    */
	@RequestMapping("/toFindGoodByGoodTitle")
	public String selectGoodByGoodTitle(@RequestParam(value="goodTitle",required=false)String goodTitle,@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="25")Integer pageSize,
			@RequestParam(value="condition",defaultValue="defualt-key")String condition,
			@RequestParam(value="sort",defaultValue="defualt-sort") String sort,
			ModelMap map){
	
		if(goodTitle!=null&&!goodTitle.equals("")){
			//根据商品名称或者类目名或者店铺名进行模糊查询
			PageInfo<Good> list = goodService.selectGoodByGoodTitle(goodTitle, pageNum, pageSize, condition, sort);
			//获取所有类目与分类
			List<Category> categorys = categoryService.selectAllCategory();
			
			List<Good> be_top = goodService.selectGoodByBe_Top();
			
			
			map.put("categorys", categorys);
			map.put("currentPage", list);
			
			map.put("be_top", be_top);
			map.put("goodTitle", goodTitle);
			map.put("condition", condition);
			map.put("sort", sort);
			return "front/GoodList";
		}
		return "redirect:/Index";
	}
	
	
	
	/**
	 * 根据店铺ID，查询到该店铺的所有商品,返回商品列表
	 * @param StoreId
	 * @param map
	 * @return
	 */
	@RequestMapping("/findGoodByStoreId")
	public String findGoodByStoreId(@RequestParam(value="storeId",required=false)int storeId,
			@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="25")Integer pageSize,
			@RequestParam(value="condition",defaultValue="defualt-key")String condition,
			@RequestParam(value="sort",defaultValue="defualt-sort") String sort,
			ModelMap map){
		
		PageInfo<Good> list = goodService.selectGoodByStoreId(storeId, pageNum, pageSize, condition, sort);
		//获取所有类目与分类
		List<Category> categorys = categoryService.selectAllCategory();
		//获取直通车商品
		List<Good> be_top = goodService.selectGoodByBe_Top();
		
		map.put("currentPage", list);
		map.put("condition", condition);
		map.put("sort", sort);
		map.put("storeId", storeId);
		map.put("be_top", be_top);
		map.put("categorys", categorys);
		return "front/Store_List";
	}
	
	/**
	 * 查找所有商品
	 * @param map
	 * @return
	 */
	@RequestMapping("/findAllGood")
	public String findAllGood(
			@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="25")Integer pageSize,
			@RequestParam(value="condition",defaultValue="defualt-key")String condition,
			@RequestParam(value="sort",defaultValue="defualt-sort") String sort,ModelMap map){
		
		PageInfo<Good> list = goodService.selectAllGood(pageNum, pageSize, condition, sort);
		//获取所有类目与分类
		List<Category> categorys = categoryService.selectAllCategory();
		//获取直通车商品
		List<Good> be_top = goodService.selectGoodByBe_Top();
		
		map.put("currentPage", list);
		map.put("condition", condition);
		map.put("sort", sort);
		
		map.put("be_top", be_top);
		map.put("categorys", categorys);
		return "front/AllGoodList";
		
	}
	
	
	
	
	@RequestMapping("/Product")
	public String findProduct(ModelMap map){
			//获取所有类目与分类
			List<Category> categorys = categoryService.selectAllCategory();
			map.put("categorys", categorys);
		return "front/Product";
	}
	
	@RequestMapping("/Count")
	public String findProducta(ModelMap map){
		Good good = goodService.selectByPrimaryKey(1);
		map.put("good", good);
		
		return "front/countTest";
	}
	
	
	

}
