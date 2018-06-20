package com.skycat.good.good.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.skycat.good.comment.entity.GoodComment;
import com.skycat.good.goodproperty.entity.GoodProperty;

public class Good {
    private Integer goodId;

    private String goodTitle;

    private Integer storeId;

    private Double defaultPrice;

    private String img1;

    private String img2;

    private String img3;

    private String img4;

    private String img5;

    private Integer grade;

    private Integer volume;

    private Integer categoryId;

    private Integer status;

    private Integer beHot;

    private Integer beTop;

    private Integer postFree;

    private Integer postFee;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date putTime;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date downTime;

    private String bigImg1;

    private String bigImg2;

    private String bigImg3;

    private String bigImg4;

    private String bigImg5;

    private String bigImg6;
    
    private List<GoodComment> goodCommets;
    
    
    public void setGoodCommets(List<GoodComment> goodCommets) {
		this.goodCommets = goodCommets;
	}

	public List<GoodComment> getGoodCommets() {
		return goodCommets;
	}


	public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public String getGoodTitle() {
        return goodTitle;
    }

    public void setGoodTitle(String goodTitle) {
        this.goodTitle = goodTitle == null ? null : goodTitle.trim();
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public Double getDefaultPrice() {
        return defaultPrice;
    }

    public void setDefaultPrice(Double defaultPrice) {
        this.defaultPrice = defaultPrice;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1 == null ? null : img1.trim();
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2 == null ? null : img2.trim();
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3 == null ? null : img3.trim();
    }

    public String getImg4() {
        return img4;
    }

    public void setImg4(String img4) {
        this.img4 = img4 == null ? null : img4.trim();
    }

    public String getImg5() {
        return img5;
    }

    public void setImg5(String img5) {
        this.img5 = img5 == null ? null : img5.trim();
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Integer getVolume() {
        return volume;
    }

    public void setVolume(Integer volume) {
        this.volume = volume;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getBeHot() {
        return beHot;
    }

    public void setBeHot(Integer beHot) {
        this.beHot = beHot;
    }

    public Integer getBeTop() {
        return beTop;
    }

    public void setBeTop(Integer beTop) {
        this.beTop = beTop;
    }

    public Integer getPostFree() {
        return postFree;
    }

    public void setPostFree(Integer postFree) {
        this.postFree = postFree;
    }

    public Integer getPostFee() {
        return postFee;
    }

    public void setPostFee(Integer postFee) {
        this.postFee = postFee;
    }

    public Date getPutTime() {
        return putTime;
    }

    public void setPutTime(Date putTime) {
        this.putTime = putTime;
    }

    public Date getDownTime() {
        return downTime;
    }

    public void setDownTime(Date downTime) {
        this.downTime = downTime;
    }

    public String getBigImg1() {
        return bigImg1;
    }

    public void setBigImg1(String bigImg1) {
        this.bigImg1 = bigImg1 == null ? null : bigImg1.trim();
    }

    public String getBigImg2() {
        return bigImg2;
    }

    public void setBigImg2(String bigImg2) {
        this.bigImg2 = bigImg2 == null ? null : bigImg2.trim();
    }

    public String getBigImg3() {
        return bigImg3;
    }

    public void setBigImg3(String bigImg3) {
        this.bigImg3 = bigImg3 == null ? null : bigImg3.trim();
    }

    public String getBigImg4() {
        return bigImg4;
    }

    public void setBigImg4(String bigImg4) {
        this.bigImg4 = bigImg4 == null ? null : bigImg4.trim();
    }

    public String getBigImg5() {
        return bigImg5;
    }

    public void setBigImg5(String bigImg5) {
        this.bigImg5 = bigImg5 == null ? null : bigImg5.trim();
    }

    public String getBigImg6() {
        return bigImg6;
    }

    public void setBigImg6(String bigImg6) {
        this.bigImg6 = bigImg6 == null ? null : bigImg6.trim();
    }

	@Override
	public String toString() {
		return "Good [goodId=" + goodId + ", goodTitle=" + goodTitle + ", storeId=" + storeId + ", defaultPrice="
				+ defaultPrice + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3 + ", img4=" + img4 + ", img5="
				+ img5 + ", grade=" + grade + ", volume=" + volume + ", categoryId=" + categoryId + ", status=" + status
				+ ", beHot=" + beHot + ", beTop=" + beTop + ", postFree=" + postFree + ", postFee=" + postFee
				+ ", putTime=" + putTime + ", downTime=" + downTime + ", bigImg1=" + bigImg1 + ", bigImg2=" + bigImg2
				+ ", bigImg3=" + bigImg3 + ", bigImg4=" + bigImg4 + ", bigImg5=" + bigImg5 + ", bigImg6=" + bigImg6
				+ "]";
	}



	
	
    
}