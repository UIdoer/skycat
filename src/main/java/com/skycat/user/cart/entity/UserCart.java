package com.skycat.user.cart.entity;

public class UserCart {
    private Integer userId;

    private Integer goodPropertyId;

    private Integer number;

    private Double total;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getGoodPropertyId() {
        return goodPropertyId;
    }

    public void setGoodPropertyId(Integer goodPropertyId) {
        this.goodPropertyId = goodPropertyId;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

	@Override
	public String toString() {
		return "UserCart [userId=" + userId + ", goodPropertyId=" + goodPropertyId + ", number=" + number + ", total="
				+ total + "]";
	}
    
    
}