package com.skycat.user.info;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Random;
import java.util.UUID;
import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.junit.Test;

import com.skycat.base.BaseTest;
import com.skycat.user.info.dao.UserMapper;
import com.skycat.user.info.entity.User;
import com.skycat.user.info.util.MD5Utils;
import com.skycat.user.info.util.MailUtil;

public class TestUserInfo extends BaseTest{
@Resource
UserMapper userMapper;
@Resource
UserMapper userService;
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
@Test
public void TestSelectByEmail(){
	User user = userMapper.selectUserByEmail("1234@qq.com");
	System.out.println(user);; 
}
@Test
public void TestInsertByEmail(){
	User user=new User(11,null,null,null,null,"15200000000","55@qq.com",null,"家乡","学历","专业","11","22","33");
	int i = userService.updateByPrimaryKeySelective(user);
	System.out.println(i);
}
@Test
public void updatePwd(){
	User user=new User();
	user.setUserPassword("111");
	user.setUserPassword(MD5Utils.getPwd(user.getUserPassword()));
	System.out.println(user.getUserPassword());
	user.setUserId(11);
	int i = userMapper.updatePwd(user);
	System.out.println(i);
}
@Test
public void testMD5(){
	String pwd=MD5Utils.getPwd("123");
	System.out.println(pwd);
}
@Test
public void TestRandom(){
	String str="";
	//随机函数
	Random rd=new Random();
	//用数组保存验证码中出现的字符
	String[] arr= {"1","2","3","4","5","6","7","8","9","a","b","c","S","R","A","B","f","k"};
	//循环，拼接生成字符串
	for(int i=0;i<5;i++) {
			str+=arr[rd.nextInt(18)];
		}
	System.out.println(str);
	
}
@Test
public void testSendMail() throws AddressException, MessagingException, IOException{
	String to="1065357291@qq.com";//收件邮箱地址
	String subject = "SkyCat修改密码邮箱验证";
	String title = "验证邮件";
	String name = "aa";
	String main = "123";//邮件内容
	String content ="ss" ;
    //写入mailTo.html
	BufferedReader br = new BufferedReader(
			new InputStreamReader(
					TestUserInfo.class.getClassLoader().
					getResourceAsStream("com/skycat/user/info/util/mailTo.html"), "UTF-8"));
	StringBuilder sb = new StringBuilder();
	String s = null;
	while((s=br.readLine())!=null){
		sb.append(s);
	}
	br.close();
	content = sb.toString();
	content = content.replace("${title}", title)
				.replace("${verfify_code}", UUID.randomUUID().toString())
				.replace("${email}", to).replace("${content}", main).replace("${fromname}", name);
   //直接发送邮件内容
   MailUtil.send(to, subject, content, MailUtil.UNICODE);
	System.out.println("邮件发送完成...");
	
}
}
