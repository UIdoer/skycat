package com.skycat.message.dao;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.message.entity.Message;

@MyBatisAnnotation 
public interface MessageMapper extends BaseMapper<Message>{
    Message selectByMessageTitle(Message record);
}