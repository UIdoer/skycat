package com.skycat.role.entity;

import java.util.List;

import com.skycat.privilege.entity.Privilege;

public class Role {
    @Override
	public String toString() {
		return "Role [roleId=" + roleId + ", roleName=" + roleName + ", privileges=" + privileges + "]";
	}

	private Integer roleId;

    private String roleName;
    
    private List<Privilege> privileges;
    

    public List<Privilege> getPrivileges() {
		return privileges;
	}

	public void setPrivileges(List<Privilege> privileges) {
		this.privileges = privileges;
	}

	public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }
}