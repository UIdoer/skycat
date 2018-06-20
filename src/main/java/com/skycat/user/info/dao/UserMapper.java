package com.skycat.user.info.dao;

import java.util.List;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.user.info.entity.User;
import com.skycat.user.info.entity.UserPageCondition;

@MyBatisAnnotation
public interface UserMapper extends BaseMapper<User>{
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> selectByCondition(UserPageCondition condition);
    //根据用户名和密码到数据库查询用户，如果有就返回user
    User selectUserByPwdName(User user);
        
    User selectByUserName(String userName);
    
    User selectUserByEmail(String email);
    
    int updatePwd(User user);
    

}