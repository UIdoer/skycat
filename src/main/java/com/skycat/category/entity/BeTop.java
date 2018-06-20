package com.skycat.category.entity;

import java.util.ArrayList;
import java.util.List;

import com.skycat.good.good.entity.Good;

public class BeTop {
	 	private Integer categoryId;
	    private String categoryName;
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
		@Override
		public String toString() {
			return "BeTop [categoryId=" + categoryId + ", categoryName=" + categoryName + "]";
		}
		
}
