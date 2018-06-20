package com.skycat.message.service;

import com.skycat.base.service.BaseService;
import com.skycat.message.entity.Message;

public interface MessageService extends BaseService<Message>{
	
	 Message selectByMessageTitle(Message record);
}
