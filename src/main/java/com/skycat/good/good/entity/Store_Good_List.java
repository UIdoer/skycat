package com.skycat.good.good.entity;

public class Store_Good_List {

	private Integer good_id;
	private String img1;
	private String good_title;
	private Double default_price;
	private Integer stock;
	private Integer status;
	
	public Integer getGood_id() {
		return good_id;
	}
	public void setGood_id(Integer good_id) {
		this.good_id = good_id;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getGood_title() {
		return good_title;
	}
	public void setGood_title(String good_title) {
		this.good_title = good_title;
	}
	public Double getDefault_price() {
		return default_price;
	}
	public void setDefault_price(Double default_price) {
		this.default_price = default_price;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Store_Good_List [good_id=" + good_id + ", img1=" + img1 + ", good_title=" + good_title
				+ ", default_price=" + default_price + ", stock=" + stock + ", status=" + status + "]";
	}
	
	
}
