package com.skycat.base;

import javax.annotation.Resource;

import org.junit.Test;

import com.skycat.message.entity.Message;
import com.skycat.message.service.MessageService;

public class MessageTest extends BaseTest{

	@Resource
	MessageService messageService;
	
	@Test
	public void test1() {
		Message message = messageService.selectByPrimaryKey(1);
		System.out.println(message);
	}
	
	@Test
	public void test2() {
		Message mssage=new Message();
		mssage.setMessageTitle("小米促销1");
		Message message2 = messageService.selectByMessageTitle(mssage);
		System.out.println(message2);
	}
}
