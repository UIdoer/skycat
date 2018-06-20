package com.skycat.category.entity;

import java.util.List;

/**
 * @author Administrator
 * 封装的值对象，包含了分类列表以及父分类的id和表明当前分类是第几级
 */
public class CategoryLevel {
	private int level;
	private String name;
	private int parentId;
	private List<Category> categories;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public List<Category> getCategories() {
		return categories;
	}
	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}
	@Override
	public String toString() {
		return "CategoryLevel [level=" + level + ", name=" + name + ", parentId=" + parentId + ", categories="
				+ categories + "]";
	}

	
	
}
