package com.skycat.order.item.entity;

public class OrderItem {
    private Integer itemId;

    private Integer orderId;

    private Integer goodPropertyId;

    private Integer itemCount;

    private Double total;

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getGoodPropertyId() {
        return goodPropertyId;
    }

    public void setGoodPropertyId(Integer goodPropertyId) {
        this.goodPropertyId = goodPropertyId;
    }

    public Integer getItemCount() {
        return itemCount;
    }

    public void setItemCount(Integer itemCount) {
        this.itemCount = itemCount;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

	@Override
	public String toString() {
		return "OrderItem [itemId=" + itemId + ", orderId=" + orderId + ", goodPropertyId=" + goodPropertyId
				+ ", itemCount=" + itemCount + ", total=" + total + "]";
	}
    
    
}