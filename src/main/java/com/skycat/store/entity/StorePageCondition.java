package com.skycat.store.entity;

/**
 * 封装的store查询页面的条件 bean
 * @author Administrator
 *
 */
public class StorePageCondition {
	private int status;
	private String storeName;
	
	private int pageNum;
	private int pageSize;
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
}
