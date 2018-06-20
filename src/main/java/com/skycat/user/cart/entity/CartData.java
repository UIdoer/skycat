package com.skycat.user.cart.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class CartData {
	private Integer addressId;
	private String remark;
	private Integer storeId;
	private List<Integer> goodPropertyIds;
	

	public Integer getAddressId() {
		return addressId;
	}
	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getStoreId() {
		return storeId;
	}
	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}
	
	public List<Integer> getGoodPropertyIds() {
		return goodPropertyIds;
	}
	public void setGoodPropertyIds(List<Integer> goodPropertyIds) {
		this.goodPropertyIds = goodPropertyIds;
	}
	@Override
	public String toString() {
		return "CartData [addressId=" + addressId + ", remark=" + remark + ", storeId=" + storeId + ", goodPropertyIds="
				+ goodPropertyIds + "]";
	}
	
	
	
	
	
}
