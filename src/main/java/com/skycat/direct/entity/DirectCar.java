package com.skycat.direct.entity;

public class DirectCar {
    private Integer id;

    private String img1;

    private String urla;

    private String img2;

    private String urlb;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1 == null ? null : img1.trim();
    }

    public String getUrla() {
        return urla;
    }

    public void setUrla(String urla) {
        this.urla = urla == null ? null : urla.trim();
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2 == null ? null : img2.trim();
    }

    public String getUrlb() {
        return urlb;
    }

    public void setUrlb(String urlb) {
        this.urlb = urlb == null ? null : urlb.trim();
    }
}