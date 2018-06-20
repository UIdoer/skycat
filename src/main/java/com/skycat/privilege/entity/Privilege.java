package com.skycat.privilege.entity;

public class Privilege {
    @Override
	public String toString() {
		return "Privilege [privilegeId=" + privilegeId + ", url=" + url + ", name=" + name + ", parentId=" + parentId
				+ "]";
	}

	private Integer privilegeId;

    private String url;

    private String name;

    private Integer parentId;

    public Integer getPrivilegeId() {
        return privilegeId;
    }

    public void setPrivilegeId(Integer privilegeId) {
        this.privilegeId = privilegeId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
}