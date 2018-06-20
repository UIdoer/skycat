package com.skycat.user.msg.dao;

import java.util.List;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.message.entity.Message;
import com.skycat.user.info.entity.User;

@MyBatisAnnotation 
public interface MessageMapper extends BaseMapper<Message>{
   List<Message> selectUserMsgByUserId(Integer userId);
}