package com.skycat.good.good.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ser.std.UUIDSerializer;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.skycat.admin.entity.Admin;
import com.skycat.category.entity.Category;
import com.skycat.category.entity.CategoryLevel;
import com.skycat.category.service.CategoryService;
import com.skycat.good.good.entity.Good;
import com.skycat.good.good.entity.Store_Good_List;
import com.skycat.good.good.service.GoodService;
import com.skycat.good.good.service.GoodServiceImpl;
import com.skycat.good.goodproperty.entity.GoodProperty;
import com.skycat.good.goodproperty.service.GoodPropertyService;
import com.skycat.good.property.entity.Property;
import com.skycat.good.property.service.PropertyService;
import com.skycat.utils.FileUploadUtil;

@Controller
@RequestMapping("/storeGood")
public class StoreGoodController {
	
	@Resource
	GoodService goodService;
	
	@Resource
	GoodPropertyService goodPropertyService;
	
	@Resource
	CategoryService categoryService;
	
	@Resource
	PropertyService propertyService;
	
	
/*	//跳转到店铺的商品列表
	@RequestMapping("/toGoodList")
	public String toGoodList(ModelMap model,HttpSession session) {
		Admin admin = (Admin)session.getAttribute("currAdmin");
		if(admin!=null) {
			HashMap<String, Integer> hashMap = new HashMap<>();
			int StoreId=Integer.parseInt(admin.getStoreId());
			hashMap.put("StoreId", StoreId);
			hashMap.put("status", null);
			List<Store_Good_List> list = goodService.selectStore_Good_listByStoreId(hashMap);
	 		model.put("goodList", list);
			return "back/product_list";
		}
		return "redirect:admin/toLogin";
	}*/
	
	//跳转到商品各类规格页面
	@RequestMapping("/toStoreProductDetail")
	public String toStoreProductDetail(Integer goodId,String goodName,ModelMap model) {
		List<GoodProperty> goodList = goodPropertyService.selectGoodPropertysByGoodId(goodId);
		model.put("goodName", goodName);
 		model.put("goodList", goodList);
 		model.put("goodId", goodId);
		return "back/store_product_detail";
	}
	
	//跳转到商品添加页面
	@RequestMapping("/toAddProduct")
	public String toAddProduct(ModelMap model,HttpServletRequest request) {
		Admin admin =(Admin) request.getSession().getAttribute("currAdmin");
		if(admin==null) {
			return "redirect:admin/toLogin";
		}
		List<Category> SecondCategory = categoryService.selectSecondProperty();
		model.put("categoryList", SecondCategory);
		return "back/edit_product";
	}
	
	//跳转到店铺的商品列表，按照status来分类
	@RequestMapping("/accordingStatusFindProduct")
	public String accordingStatusFindProduct(@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="10")Integer pageSize,
			@RequestParam(value="status",defaultValue="5")Integer status,ModelMap model,HttpSession session) {
		Admin admin = (Admin)session.getAttribute("currAdmin");
		if(admin!=null) {
			HashMap<String, Integer> hashMap = new HashMap<>();
			int StoreId=Integer.parseInt(admin.getStoreId());
			hashMap.put("StoreId", StoreId);
			
			hashMap.put("status", status);
			
			PageHelper.startPage(pageNum, pageSize);
			List<Store_Good_List> list = goodService.selectStore_Good_listByStoreId(hashMap);
	 		model.put("goodList", list);
	 		System.out.println(list);
	 		PageInfo<Store_Good_List> pageInfo = new PageInfo<Store_Good_List>(list);
	 		model.put("pageInfo", pageInfo);
	 		model.put("status", status);
			return "back/product_list";
		}
		return "redirect:admin/toLogin";
	}
	
	//下架商品
	@RequestMapping("/downProduct")
	public String downProduct(Integer judge,Integer status,Integer goodId,ModelMap model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(judge==1) {
			Good good = goodService.selectByPrimaryKey(goodId);
			good.setStatus(1);
			goodService.updateByPrimaryKeySelective(good);
			
		}
		if(judge==2) {
			Good good = goodService.selectByPrimaryKey(goodId);
			good.setStatus(2);
			goodService.updateByPrimaryKeySelective(good);
			
		}
		return accordingStatusFindProduct(1, 8, status, model,session);
	}
	
	//删除商品，状态修改为2是删除
	
	
	//添加商品
	@RequestMapping("/AddProduct")
	public String AddProduct(@RequestParam("imgs")MultipartFile[] imgs,
							@RequestParam("bigImgs")MultipartFile[] bigImgs,
								Good good,ModelMap model,
								HttpServletRequest request) {
		Admin admin =(Admin) request.getSession().getAttribute("currAdmin");
		String realPath = request.getServletContext().getRealPath("upload");
		//储存图片名字集合
		List<String> str=new ArrayList(5);
		for( int i=0;i<5;i++) {
			str.add(null);
		}
		int j=0;
		//上传缩略图
		for(MultipartFile img:imgs) {
			String originalFilename = img.getOriginalFilename();
			String substring = originalFilename.substring(originalFilename.lastIndexOf("."));
			//自定义保存名
			originalFilename=System.currentTimeMillis()+UUID.randomUUID().toString()+substring;
			str.add(j,originalFilename);
			j++;
			File targetFile=new File(realPath,originalFilename);
			//没有就创建文件夹
			if(!targetFile.exists()) {
				targetFile.mkdirs();
			}
			try {
				
				img.transferTo(targetFile);
				 FileUploadUtil.uploadImage(targetFile, "small/"+originalFilename);
				 targetFile.delete();
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		good.setImg1(str.get(0)==null?null:"small/"+str.get(0));
		good.setImg2(str.get(1)==null?null:"small/"+str.get(1));
		good.setImg3(str.get(2)==null?null:"small/"+str.get(2));
		good.setImg4(str.get(3)==null?null:"small/"+str.get(3));
		good.setImg5(str.get(4)==null?null:"small/"+str.get(4));
		
		//上传详细图
		for( int i=0;i<5;i++) {
			str.add(i,null);
		}
		int k=0;
		for(MultipartFile bigImg :bigImgs) {
			String originalFilename = bigImg.getOriginalFilename();
			String substring = originalFilename.substring(originalFilename.lastIndexOf("."));
			//自定义保存名
			originalFilename=System.currentTimeMillis()+UUID.randomUUID().toString()+substring;
			str.add(k,originalFilename);
			k++;
			File targetFile=new File(realPath,originalFilename);
			//没有就创建文件夹
			if(!targetFile.exists()) {
				targetFile.mkdirs();
			}
			try {
				bigImg.transferTo(targetFile);
				FileUploadUtil.uploadImage(targetFile, "big/"+originalFilename);
				targetFile.delete();
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		good.setBigImg1(str.get(0)==null?null:"big/"+str.get(0));
		good.setBigImg2(str.get(1)==null?null:"big/"+str.get(1));
		good.setBigImg3(str.get(2)==null?null:"big/"+str.get(2));
		good.setBigImg4(str.get(3)==null?null:"big/"+str.get(3));
		good.setBigImg5(str.get(4)==null?null:"big/"+str.get(4));
		int StoreId=Integer.parseInt(admin.getStoreId());
		good.setStoreId(StoreId);
		good.setStatus(3);
		
		int insertSelective = goodService.insertSelective(good);
		if(insertSelective==1) {
			model.put("msg", "插入成功");
			return "redirect:/storeGood/accordingStatusFindProduct";
		}
		model.put("msg", "插入失败");
		return "back/edit_product";
	}
	
	
	//跳转到修改商品页面
	@RequestMapping("/toEditProduct")
	public String toEditProduct(Integer goodId,ModelMap model) {
		List<Category> SecondCategory = categoryService.selectSecondProperty();
		model.put("categoryList", SecondCategory);
		Good good = goodService.selectByPrimaryKey(goodId);
		model.put("good", good);
		return "back/edit_product";
		
	}
	
	//修改商品
	@RequestMapping("/UpdataProduct")
	public String UpdataProduct(@RequestParam("imgs")MultipartFile[] imgs,
			@RequestParam("bigImgs")MultipartFile[] bigImgs,
				Good good,Integer gId,Integer sId, ModelMap model,
				HttpServletRequest request) {
		String realPath = request.getServletContext().getRealPath("upload");
		//文件名数组
		String[] str= {good.getImg1(),good.getImg2(),good.getImg3(),good.getImg4(),good.getImg5()};
		System.out.println(good.getImg1());
		for(String s:str) {
			System.out.print(s+"..");
			
		}
		
		//上传缩略图
		int j=0;
		for(MultipartFile img:imgs) {
			//如果已经勋在图片用原图片名覆盖图片
			if(str[j]!=null) {
				File targetFile=new File(realPath,str[j]);
				if(!targetFile.exists()) {
					targetFile.mkdirs();
				}
				try {
					img.transferTo(targetFile);
					FileUploadUtil.uploadImage(targetFile, "small/"+str[j]);
					targetFile.delete();
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			//没有图片就按正常的文件上传步骤
			else {
				String originalFilename = img.getOriginalFilename();
				String substring = originalFilename.substring(originalFilename.lastIndexOf("."));
				//自定义保存名
				originalFilename=System.currentTimeMillis()+UUID.randomUUID().toString()+substring;
				str[j]=originalFilename;
				File targetFile=new File(realPath,originalFilename);
				if(!targetFile.exists()) {
					targetFile.mkdirs();
				}
				try {
					img.transferTo(targetFile);
					FileUploadUtil.uploadImage(targetFile, "small/"+originalFilename);
					targetFile.delete();
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			j++;
		}
		good.setImg1(str[0]==null?null:"small/"+str[0]);
		good.setImg2(str[1]==null?null:"small/"+str[1]);
		good.setImg3(str[2]==null?null:"small/"+str[2]);
		good.setImg4(str[3]==null?null:"small/"+str[3]);
		good.setImg5(str[4]==null?null:"small/"+str[4]);
		
		//图片名数组
		String[] str1= {good.getBigImg1(),good.getBigImg2(),good.getBigImg3(),good.getBigImg4(),good.getBigImg5()};
		
		//上传详情图
				int k=0;
				for(MultipartFile bigImg:bigImgs) {
					//如果已经勋在图片用原图片名覆盖图片
					if(str1[k]!=null) {
						File targetFile=new File(realPath,str1[k]);
						if(!targetFile.exists()) {
							targetFile.mkdirs();
						}
						try {
							bigImg.transferTo(targetFile);
							FileUploadUtil.uploadImage(targetFile, "big/"+str1[k]);
							targetFile.delete();
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
					}
					//没有图片就按正常的文件上传步骤
					else {
						String originalFilename = bigImg.getOriginalFilename();
						String substring = originalFilename.substring(originalFilename.lastIndexOf("."));
						//自定义保存名
						originalFilename=System.currentTimeMillis()+UUID.randomUUID().toString()+substring;
						str1[k]=originalFilename;
						File targetFile=new File(realPath,originalFilename);
						if(!targetFile.exists()) {
							targetFile.mkdirs();
						}
						try {
							bigImg.transferTo(targetFile);
							FileUploadUtil.uploadImage(targetFile, "big/"+originalFilename);
							targetFile.delete();
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
					}
					k++;
				}
		good.setBigImg1(str1[0]==null?null:"big/"+str1[0]);
		good.setBigImg2(str1[1]==null?null:"big/"+str1[1]);
		good.setBigImg3(str1[2]==null?null:"big/"+str1[2]);
		good.setBigImg4(str1[3]==null?null:"big/"+str1[3]);
		good.setBigImg5(str1[4]==null?null:"big/"+str1[4]);
		good.setStatus(3);
		good.setGoodId(gId);
		good.setStoreId(sId);
		System.out.println(good);
		int insertSelective = goodService.updateByPrimaryKeySelective(good);
		if(insertSelective==1) {
			model.put("msg", "修改成功");
			return "redirect:/storeGood/accordingStatusFindProduct";
		}
		model.put("msg", "修改失败");
		return "back/edit_product";
		
	}
	
	//跳转到添加商品规格页面
	@RequestMapping("/toAddProductCategory")
	public String toAddProductCategory(Integer goodId,ModelMap model) {
		Good good = goodService.selectByPrimaryKey(goodId);
		List<Property> propertys = propertyService.selectPropertysByCategoryId(good.getCategoryId());
		model.put("good", good);
		model.put("propertys", propertys);
		return "back/add_product_category";
	}
	
	@RequestMapping("/addProductCategory")
	public String addProductCategory(GoodProperty goodProperty,String goodName,Integer goodId,ModelMap model) {
		goodProperty.setGoodId(goodId);
		int i = goodPropertyService.insertSelective(goodProperty);
		if(i==1) {
			model.put("msg", "保存类别成功！！");
			return "back/add_product_category_success";
		}
		model.put("msg", "保存类别失败！！");
		return "/storeGood/toAddProductCategory?goodId="+goodId+"&goodName="+goodName;
		
	}
	
	@RequestMapping("/toEditProductCategory")
	public String toEditProductCategory(Integer goodId,Integer goodPropertyId,ModelMap model) {
		Good good = goodService.selectByPrimaryKey(goodId);
		List<Property> propertys = propertyService.selectPropertysByCategoryId(good.getCategoryId());
		
		 GoodProperty goodProperty = goodPropertyService.selectByPrimaryKey(goodPropertyId);
		
		Property p1Id = propertyService.selectByPrimaryKey(goodProperty.getP1Id());
		Property p2Id = propertyService.selectByPrimaryKey(goodProperty.getP2Id());
		model.put("goodProperty", goodProperty);
		model.put("good", good);
		model.put("propertys", propertys);
		model.put("gpid", goodProperty.getGoodPropertyId());
		return "back/add_product_category";
	}
	
	@RequestMapping("/updataProductCategory")
	public String updataProductCategory(Integer gpid ,GoodProperty goodProperty,String goodName,Integer goodId,ModelMap model) {
		goodProperty.setGoodId(goodId);
		goodProperty.setGoodPropertyId(gpid);
		System.out.println(goodProperty);
		int i = goodPropertyService.updateByPrimaryKeySelective(goodProperty);
		if(i==1) {
			model.put("msg", "保存类别成功！！");
			return "back/add_product_category_success";
		}
		model.put("msg", "保存类别失败！！");
		return "/storeGood/toAddProductCategory?goodId="+goodId+"&goodName="+goodName;
	}
}
