package com.skycat.user.info.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.skycat.base.service.AbstractBaseServiceImpl;
import com.skycat.user.info.dao.UserMapper;
import com.skycat.user.info.entity.User;
import com.skycat.user.info.entity.UserPageCondition;
import com.skycat.user.info.util.MD5Utils;
@Service
public class UserServiceImpl extends AbstractBaseServiceImpl<User> implements UserService{

	@Autowired
	UserMapper userMapper;
	
	@Override
	public PageInfo<User> selectPage(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<>(userMapper.selectAll(),5);
	}

	@Override
	public PageInfo<User> selectByCondition(UserPageCondition condition) {
		PageHelper.startPage(condition.getPageNum(), condition.getPageSize());
		return new PageInfo<>(userMapper.selectByCondition(condition),5);
	}
	
	@Override
	public int updateByPrimaryKeySelective(User record) {
		record.setUserPassword(MD5Utils.getPwd(record.getUserPassword()));
		return super.updateByPrimaryKeySelective(record);
	}
	@Override
	public int insertSelective(User record) {
		//为用户性别添加默认值
		record.setSex("0");
		//为用户状态添加默认值
		record.setStatus(0);
		//用户密码加密
		record.setUserPassword(MD5Utils.getPwd(record.getUserPassword()));
		return super.insertSelective(record);
	}
	@Override
	public User selectByPwdName(User user) {
		user.setUserPassword(MD5Utils.getPwd(user.getUserPassword()));
		return userMapper.selectUserByPwdName(user);
	}

	@Override
	public User selectByUserName(String userName) {
		return userMapper.selectByUserName(userName);
	}

	@Override
	public User selectUserByEmail(String email) {
		return userMapper.selectUserByEmail(email);
	}

	@Override
	public int updatePwd(Integer userId, String userPassword) {
		User user=new User();
		user.setUserId(userId);
		user.setUserPassword(userPassword);
		return userMapper.updatePwd(user);
	}

	@Override
	public int updatePicture(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKeySelective(user);
	}
}
