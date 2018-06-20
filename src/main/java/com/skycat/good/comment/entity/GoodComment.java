package com.skycat.good.comment.entity;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrlPattern;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.skycat.user.info.entity.User;

public class GoodComment {
    private Integer commentId;

    private Integer goodId;

    private Integer userId;

    private Integer comGrade;

    private String comText;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date comTime;

    private String img1;

    private String img2;

    private String img3;

    private String img4;
    
    //嵌套查询根据用户ID，查找该条评论的用户--用户表包含：
    private User user;
    
    
    
    

    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getComGrade() {
        return comGrade;
    }

    public void setComGrade(Integer comGrade) {
        this.comGrade = comGrade;
    }

    public String getComText() {
        return comText;
    }

    public void setComText(String comText) {
        this.comText = comText == null ? null : comText.trim();
    }

    public Date getComTime() {
        return comTime;
    }

    public void setComTime(Date comTime) {
        this.comTime = comTime;
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

	@Override
	public String toString() {
		return "GoodComment [commentId=" + commentId + ", goodId=" + goodId + ", userId=" + userId + ", comGrade="
				+ comGrade + ", comText=" + comText + ", comTime=" + comTime + ", img1=" + img1 + ", img2=" + img2
				+ ", img3=" + img3 + ", img4=" + img4 + ", user=" + user + "]";
	}
    
    
}