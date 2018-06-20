package com.skycat.user.info.service;

import com.github.pagehelper.PageInfo;
import com.skycat.base.service.BaseService;
import com.skycat.user.info.entity.User;
import com.skycat.user.info.entity.UserPageCondition;

public interface UserService extends BaseService<User>{
	/**
	 * 按条件分页查询
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	PageInfo<User> selectPage(int pageNum,int pageSize);
	
	/**
	 * 带条件的查询
	 * @param pageNum
	 * @param pageSize
	 * @param condition
	 * @return
	 */
	PageInfo<User> selectByCondition(UserPageCondition condition);
	/**
	 * 添加注册用户数据
	 * @param user
	 * @return
	 */
	int insertSelective(User record);
	/**
	 * 用户登录数据库验证
	 * @param userName
	 * @param userPassword
	 * @return User
	 */
	User selectByPwdName(User user);
	/**
	 * 找回密码用户名验证
	 * @param userName
	 * @return User
	 */
	User selectByUserName(String userName);
	/**
	 * 修改密码邮箱验证
	 * @param userName
	 * @return User
	 */
	User selectUserByEmail(String email);
	/**
	 * 修改密码
	 * @param userName
	 * @param userPassword
	 * @return int
	 */
	int updatePwd(Integer userId,String userPassword);
	int updatePicture(User user);
}
