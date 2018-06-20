package com.skycat.order.order.entity;

import java.util.Date;
import java.util.List;

import com.skycat.order.item.entity.OrderItemVo;

public class OrderVo {
	private Integer orderId;
    private Integer userId;
    private Integer addId;
    private Integer storeId;
    private Double total;
    private String remark;
    private Integer status;
    private String logisticNo;
    private Date orderTime;
    private String storeName;
    private List<OrderItemVo> orderItem;
    
    
    
	public String getStoreName() {
		return storeName;
	}


	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}


	public Integer getOrderId() {
		return orderId;
	}

	
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getAddId() {
		return addId;
	}

	public void setAddId(Integer addId) {
		this.addId = addId;
	}

	public Integer getStoreId() {
		return storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getLogisticNo() {
		return logisticNo;
	}

	public void setLogisticNo(String logisticNo) {
		this.logisticNo = logisticNo;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	

	public List<OrderItemVo> getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(List<OrderItemVo> orderItem) {
		this.orderItem = orderItem;
	}

	@Override
	public String toString() {
		return "OrderVo [orderId=" + orderId + ", userId=" + userId + ", addId=" + addId + ", storeId=" + storeId
				+ ", total=" + total + ", remark=" + remark + ", status=" + status + ", logisticNo=" + logisticNo
				+ ", orderTime=" + orderTime + ", orderItem=" + orderItem + "]";
	}

	
    
	
	
	
	
}
