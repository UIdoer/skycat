package com.skycat.good.property.entity;

public class Property {
    private Integer propertyId;

    private Integer categoryId;

    private String propertyName;

    public Integer getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(Integer propertyId) {
        this.propertyId = propertyId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName == null ? null : propertyName.trim();
    }

	@Override
	public String toString() {
		return "Property [propertyId=" + propertyId + ", categoryId=" + categoryId + ", propertyName=" + propertyName
				+ "]";
	}
    

}