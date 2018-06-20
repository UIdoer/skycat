package com.skycat.message.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.skycat.base.service.AbstractBaseServiceImpl;
import com.skycat.message.dao.MessageMapper;
import com.skycat.message.entity.Message;

@Service
public class MessageServiceImpl extends AbstractBaseServiceImpl<Message>
implements MessageService{

	@Resource
	MessageMapper messageMapper;
	
	@Override
	public Message selectByMessageTitle(Message record) {
		return messageMapper.selectByMessageTitle(record);
	}

}
