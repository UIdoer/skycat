package com.skycat.user.cart.entity;

import com.skycat.good.good.entity.Good;
import com.skycat.good.goodproperty.entity.GoodProperty;
import com.skycat.good.property.entity.Property;
import com.skycat.store.entity.Store;
import com.skycat.user.info.entity.User;

public class UserCartVo  {
	private GoodProperty gp;
	private Store s;
	private Property p;
	private UserCart uc;
	private Good g;
	

	public GoodProperty getGp() {
		return gp;
	}
	public void setGp(GoodProperty gp) {
		this.gp = gp;
	}
	public Store getS() {
		return s;
	}
	public void setS(Store s) {
		this.s = s;
	}
	public Property getP() {
		return p;
	}
	public void setP(Property p) {
		this.p = p;
	}
	public UserCart getUc() {
		return uc;
	}
	public void setUc(UserCart uc) {
		this.uc = uc;
	}
	public Good getG() {
		return g;
	}
	public void setG(Good g) {
		this.g = g;
	}
	
}














