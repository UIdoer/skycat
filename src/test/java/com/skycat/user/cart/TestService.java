package com.skycat.user.cart;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageInfo;
import com.skycat.base.BaseTest;
import com.skycat.user.info.entity.User;
import com.skycat.user.info.entity.UserPageCondition;
import com.skycat.user.info.service.UserService;

public class TestService extends BaseTest{
	@Autowired
	UserService userService;
	
	
	@Test
	public void testSelectAll() {
		List<User> list = userService.selectAll();
		System.out.println(list);
	}
	
	/*
	 * PageInfo{pageNum=1, pageSize=5, size=1, startRow=1, endRow=1, total=1, pages=1,
	 *  list=Page{count=true, pageNum=1, pageSize=5, startRow=0, endRow=5, total=1,
	 *   pages=1, reasonable=false, pageSizeZero=false}, prePage=0, nextPage=0, isFirstPage=true, 
	 *   isLastPage=true, hasPreviousPage=false, hasNextPage=false, navigatePages=8, navigateFirstPage1, 
	 *   navigateLastPage1, navigatepageNums=[1]}
	 */
	@Test
	public void testSelectByCondition() {
		UserPageCondition c = new UserPageCondition();
		c.setStatus(-1);
		c.setStrCondition("188");
		c.setPageNum(1);
		c.setPageSize(5);
		PageInfo<User> p = userService.selectByCondition(c);
		System.out.println(p);
		List<User> list = p.getList();
		for (User user : list) {
			System.out.println(user);
		}
	}

}
