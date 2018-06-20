package com.skycat.order.order.entity;

import java.util.Date;

public class StoreOrderList {
	private Integer orderId;
	private String logisticNo;
	private Date orderTime;
	private String receive_name;
	private String receive_phone;
	private String receive_detail;
	private Double total;
	private Integer status;
	private String remark;
	
	
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
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
	public String getReceive_name() {
		return receive_name;
	}
	public void setReceive_name(String receive_name) {
		this.receive_name = receive_name;
	}
	public String getReceive_phone() {
		return receive_phone;
	}
	public void setReceive_phone(String receive_phone) {
		this.receive_phone = receive_phone;
	}
	public String getReceive_detail() {
		return receive_detail;
	}
	public void setReceive_detail(String receive_detail) {
		this.receive_detail = receive_detail;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
	
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "StoreOrderList [orderId=" + orderId + ", logisticNo=" + logisticNo + ", orderTime=" + orderTime
				+ ", receive_name=" + receive_name + ", receive_phone=" + receive_phone + ", receive_detail="
				+ receive_detail + ", total=" + total + ", status=" + status + ", remark=" + remark + "]";
	}
	
	
	
}
