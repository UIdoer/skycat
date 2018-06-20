package com.skycat.good.goodproperty.entity;

import java.util.ArrayList;
import java.util.List;

import com.skycat.good.property.entity.Property;

public class GoodProperty {
    private Integer goodPropertyId;

    private Integer goodId;

    private Integer p1Id;

    private String p1Value;

    private Integer p2Id;

    private String p2Value;

    private Integer stock;

    private Double price;
    
    //嵌套查询，根据商品属性ID查询----所属类目和属性名
   // private Property propertys;

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public Integer getP1Id() {
        return p1Id;
    }

    public void setP1Id(Integer p1Id) {
        this.p1Id = p1Id;
    }

    public String getP1Value() {
        return p1Value;
    }

    public void setP1Value(String p1Value) {
        this.p1Value = p1Value == null ? null : p1Value.trim();
    }

    public Integer getP2Id() {
        return p2Id;
    }

    public void setP2Id(Integer p2Id) {
        this.p2Id = p2Id;
    }

    public String getP2Value() {
        return p2Value;
    }

    public void setP2Value(String p2Value) {
        this.p2Value = p2Value == null ? null : p2Value.trim();
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

	public Integer getGoodPropertyId() {
		return goodPropertyId;
	}

	public void setGoodPropertyId(Integer goodPropertyId) {
		this.goodPropertyId = goodPropertyId;
	}

//	public Property getPropertys() {
//		return propertys;
//	}
//
//	public void setPropertys(Property propertys) {
//		this.propertys = propertys;
//	}

	@Override
	public String toString() {
		return "GoodProperty [goodPropertyId=" + goodPropertyId + ", goodId=" + goodId + ", p1Id=" + p1Id + ", p1Value="
				+ p1Value + ", p2Id=" + p2Id + ", p2Value=" + p2Value + ", stock=" + stock + ", price=" + price
				+  "]";
	}

	
	
}