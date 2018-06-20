package com.skycat.order.order.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class UserOrderSearchCondition {
	private String storeName;
	private Integer isCommented;
	private String goodTitle;
	private Integer orderId;
	private Integer orderStatus;
	private Integer userId;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date orderTimeStart;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date orderTimeEnd;
	
	@Override
	public String toString() {
		return "UserOrderSearchCondition [storeName=" + storeName + ", isCommented=" + isCommented + ", goodTitle="
				+ goodTitle + ", orderId=" + orderId + ", orderStatus=" + orderStatus + ", userId=" + userId
				+ ", orderTimeStart=" + orderTimeStart + ", orderTimeEnd=" + orderTimeEnd + "]";
	}
	public String getGoodTitle() {
		return goodTitle;
	}
	public void setGoodTitle(String goodTitle) {
		this.goodTitle = goodTitle;
	}
	public Date getOrderTimeStart() {
		return orderTimeStart;
	}
	public void setOrderTimeStart(Date orderTimeStart) {
		this.orderTimeStart = orderTimeStart;
	}
	public Date getOrderTimeEnd() {
		return orderTimeEnd;
	}
	public void setOrderTimeEnd(Date orderTimeEnd) {
		this.orderTimeEnd = orderTimeEnd;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public Integer getIsCommented() {
		return isCommented;
	}
	public void setIsCommented(Integer isCommented) {
		this.isCommented = isCommented;
	}
	
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	

	
}
