package com.skycat.user.info.entity;

public class UserPageCondition {
	private Integer status;
	private String strCondition;
	private int pageNum;
	private int pageSize;
	
	
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
	@Override
	public String toString() {
		return "UserPageCondition [status=" + status + ", strCondition=" + strCondition + "]";
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getStrCondition() {
		return strCondition;
	}
	public void setStrCondition(String strCondition) {
		this.strCondition = strCondition;
	}

}
