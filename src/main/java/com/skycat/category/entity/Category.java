package com.skycat.category.entity;

import java.util.ArrayList;
import java.util.List;

import com.skycat.good.good.entity.Good;

public class Category {
    private Integer categoryId;

    private String categoryName;

    private Integer parentId;

    private Integer del;
    
    private List<Category> sonCategory=new ArrayList();
    private List<Good> goods= new ArrayList();
    private List<BeTop> beTops = new ArrayList();
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public Integer getDel() {
		return del;
	}
	public void setDel(Integer del) {
		this.del = del;
	}
	public List<Category> getSonCategory() {
		return sonCategory;
	}
	public void setSonCategory(List<Category> sonCategory) {
		this.sonCategory = sonCategory;
	}
	public List<Good> getGoods() {
		return goods;
	}
	public void setGoods(List<Good> goods) {
		this.goods = goods;
	}
	public List<BeTop> getBeTops() {
		return beTops;
	}
	public void setBeTops(List<BeTop> beTops) {
		this.beTops = beTops;
	}
	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryName=" + categoryName + ", parentId=" + parentId
				+ ", del=" + del + ", sonCategory=" + sonCategory + ", goods=" + goods + ", beTops=" + beTops + "]";
	}
	
    
}