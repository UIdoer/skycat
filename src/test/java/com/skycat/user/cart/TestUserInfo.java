package com.skycat.user.cart;

import javax.annotation.Resource;

import org.junit.Test;

import com.skycat.base.BaseTest;
import com.skycat.user.info.dao.UserMapper;
import com.skycat.user.info.entity.User;

public class TestUserInfo extends BaseTest{
@Resource
UserMapper userMapper;
@Test
public void TestSelectUserByPwdName(){
	User user2 = new User();
	user2.setUserPassword("111");
	user2.setUserName("qqq");
	User user = userMapper.selectUserByPwdName(user2);
	System.out.println(user);
}
@Test
public void TestSelectByUSerName(){
	User user = userMapper.selectByUserName("qqq");
	System.out.println(user);
}
}
