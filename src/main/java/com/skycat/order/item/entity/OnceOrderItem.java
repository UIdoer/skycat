package com.skycat.order.item.entity;

public class OnceOrderItem {

	private String img1;
	private String good_title;
	private String p1_value;
	private String p2_value;
	private Double price;
	private Double item_count;
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
	public String getP1_value() {
		return p1_value;
	}
	public void setP1_value(String p1_value) {
		this.p1_value = p1_value;
	}
	public String getP2_value() {
		return p2_value;
	}
	public void setP2_value(String p2_value) {
		this.p2_value = p2_value;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getItem_count() {
		return item_count;
	}
	public void setItem_count(Double item_count) {
		this.item_count = item_count;
	}
	
	@Override
	public String toString() {
		return "OnceOrderItem [img1=" + img1 + ", good_title=" + good_title + ", p1_value=" + p1_value + ", p2_value="
				+ p2_value + ", price=" + price + ", item_count=" + item_count + "]";
	}
	
	
}
