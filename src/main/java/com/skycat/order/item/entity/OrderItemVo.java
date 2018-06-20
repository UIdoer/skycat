package com.skycat.order.item.entity;

import com.skycat.good.good.entity.Good;
import com.skycat.good.goodproperty.entity.GoodProperty;
import com.skycat.good.goodproperty.entity.GoodPropertyVo;

public class OrderItemVo {
    private Integer itemId;

    private Integer orderId;

    private Integer goodPropertyId;

    private Integer itemCount;

    private Double total;

    private Good good;
    
    private GoodPropertyVo gp;
    
    
    
    public Good getGood() {
		return good;
	}

	public void setGood(Good good) {
		this.good = good;
	}

	

	public GoodPropertyVo getGp() {
		return gp;
	}

	public void setGp(GoodPropertyVo gp) {
		this.gp = gp;
	}

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
		return "OrderItemVo [itemId=" + itemId + ", orderId=" + orderId + ", goodPropertyId=" + goodPropertyId
				+ ", itemCount=" + itemCount + ", total=" + total + ", good=" + good + ", gp=" + gp + "]";
	}

	

	
    
    
}