package com.skycat.admin.entity;

import java.util.List;

import com.skycat.role.entity.Role;

public class Admin {
  

	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminCode=" + adminCode + ", adminPassword=" + adminPassword
				+ ", roles=" + roles + ", storeId=" + storeId + "]";
	}

	private Integer adminId;

    private String adminCode;

    private String adminPassword;
    
    /**
     * 管理员拥有的权限列表
     */
    List<Role> roles;
    
    public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	/**
     * 管理员的角色是店铺管理员还是系统管理员
     */
    //private Integer adminRole;
    
    /**
     * 如果是店铺管理员，管理的店铺的编号 
     * 因为如果管理员没有管理店铺的话，
     * 数据库查询的时候可能会返回空，
     * 所以使用String而不用int
     */
    private String storeId;


	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminCode() {
        return adminCode;
    }

    public void setAdminCode(String adminCode) {
        this.adminCode = adminCode == null ? null : adminCode.trim();
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword == null ? null : adminPassword.trim();
    }
}