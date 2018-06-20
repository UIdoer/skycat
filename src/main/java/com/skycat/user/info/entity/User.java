package com.skycat.user.info.entity;

public class User {
    private Integer userId;

    private String userName;

    private String userPassword;

    private String sex;

    private String picture;

    private String telephone;

    private String email;

    private Integer status;

    private String question1;

    private String question2;

    private String question3;

    private String answer1;

    private String answer2;

    private String answer3;
    
    public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(Integer userId, String userName, String userPassword, String sex, String picture, String telephone,
			String email, Integer status, String question1, String question2, String question3, String answer1,
			String answer2, String answer3) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPassword = userPassword;
		this.sex = sex;
		this.picture = picture;
		this.telephone = telephone;
		this.email = email;
		this.status = status;
		this.question1 = question1;
		this.question2 = question2;
		this.question3 = question3;
		this.answer1 = answer1;
		this.answer2 = answer2;
		this.answer3 = answer3;
	}

	public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getQuestion1() {
        return question1;
    }

    public void setQuestion1(String question1) {
        this.question1 = question1 == null ? null : question1.trim();
    }

    public String getQuestion2() {
        return question2;
    }

    public void setQuestion2(String question2) {
        this.question2 = question2 == null ? null : question2.trim();
    }

    public String getQuestion3() {
        return question3;
    }

    public void setQuestion3(String question3) {
        this.question3 = question3 == null ? null : question3.trim();
    }

    public String getAnswer1() {
        return answer1;
    }

    public void setAnswer1(String answer1) {
        this.answer1 = answer1 == null ? null : answer1.trim();
    }

    public String getAnswer2() {
        return answer2;
    }

    public void setAnswer2(String answer2) {
        this.answer2 = answer2 == null ? null : answer2.trim();
    }

    public String getAnswer3() {
        return answer3;
    }

    public void setAnswer3(String answer3) {
        this.answer3 = answer3 == null ? null : answer3.trim();
    }

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userPassword=" + userPassword + ", sex=" + sex
				+ ", picture=" + picture + ", telephone=" + telephone + ", email=" + email + ", status=" + status
				+ ", question1=" + question1 + ", question2=" + question2 + ", question3=" + question3 + ", answer1="
				+ answer1 + ", answer2=" + answer2 + ", answer3=" + answer3 + "]";
	}
	
    
}