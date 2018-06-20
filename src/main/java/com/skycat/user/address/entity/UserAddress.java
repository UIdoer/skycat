package com.skycat.user.address.entity;

public class UserAddress {
    private Integer addressId;

    private Integer userId;

    private String receiveName;

    private String receivePhone;

    private String receiveDetail;
    
    private String isDefault;
    private String specificAddress;
    
    public String getSpecificAddress() {
		return specificAddress;
	}

	public void setSpecificAddress(String specificAddress) {
		this.specificAddress = specificAddress;
	}

	public String getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}

    public Integer getAddressId() {
		return addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getReceiveName() {
        return receiveName;
    }

    public void setReceiveName(String receiveName) {
        this.receiveName = receiveName == null ? null : receiveName.trim();
    }

    public String getReceivePhone() {
        return receivePhone;
    }

    public void setReceivePhone(String receivePhone) {
        this.receivePhone = receivePhone == null ? null : receivePhone.trim();
    }

    public String getReceiveDetail() {
        return receiveDetail;
    }

    public void setReceiveDetail(String receiveDetail) {
        this.receiveDetail = receiveDetail == null ? null : receiveDetail.trim();
    }

	@Override
	public String toString() {
		return "UserAddress [addressId=" + addressId + ", userId=" + userId + ", receiveName=" + receiveName
				+ ", receivePhone=" + receivePhone + ", receiveDetail=" + receiveDetail + ", isDefault=" + isDefault
				+ "]";
	}

    
}