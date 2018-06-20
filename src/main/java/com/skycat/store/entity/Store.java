package com.skycat.store.entity;

public class Store {
    @Override
	public String toString() {
		return "Store [storeId=" + storeId + ", storeName=" + storeName + ", storeDescr=" + storeDescr + ", status="
				+ status + ", storeAdd=" + storeAdd + ", phone=" + phone + ", grade=" + grade + ", managerId="
				+ managerId + "]";
	}

	private Integer storeId;

    private String storeName;

    private String storeDescr;

    private Integer status;

    private String storeAdd;

    private String phone;

    private Integer grade;

    private Integer managerId;

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName == null ? null : storeName.trim();
    }

    public String getStoreDescr() {
        return storeDescr;
    }

    public void setStoreDescr(String storeDescr) {
        this.storeDescr = storeDescr == null ? null : storeDescr.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getStoreAdd() {
        return storeAdd;
    }

    public void setStoreAdd(String storeAdd) {
        this.storeAdd = storeAdd == null ? null : storeAdd.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Integer getManagerId() {
        return managerId;
    }

    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
    }
}