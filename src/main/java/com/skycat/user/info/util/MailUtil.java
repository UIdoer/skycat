package com.skycat.user.info.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;


/**
 * 邮件发送工具
 * @author ming
 *
 */
public class MailUtil {
	/**UTF8编码*/
	public static final String UNICODE = "UTF-8";
	/**汉字编码*/
	public static final String ZH = "GBK";
	
	private static Properties props = new Properties();
	
	
	/**SMTP地址*/
	private static String host;
	/**发件人邮箱*/
	private static String user;
	/**发件人密码*/
	private static String password;

	static {
		try {
			props.load(MailUtil.class.getClassLoader().getResourceAsStream("email.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		host = props.getProperty("host");
		user = props.getProperty("user");
		password = props.getProperty("pass");

		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	}

	/**
	 * 发送邮件
	 * @param to				收件人
	 * @param subject			主题
	 * @param content			内容
	 * @param charset			邮件编码
	 * @throws AddressException
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException 
	 */
	public static void send(String to, String subject, String content, String charset)
			throws AddressException, MessagingException, UnsupportedEncodingException {
		send(new String[] { to }, null, null, subject, content, null, charset);
	}
	/**
	 * 发送邮件
	 * @param to				收件人
	 * @param cc				抄送人
	 * @param subject			主题
	 * @param content			内容
	 * @param charset			邮件编码
	 * @throws AddressException
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException 
	 */
	public static void send(String to, String cc, String subject, String content, String charset)
			throws AddressException, MessagingException, UnsupportedEncodingException {
		send(new String[] { to }, new String[]{ cc }, null, subject, content, null, charset);
	}
	/**
	 * 发送邮件
	 * @param to				收件人
	 * @param cc				抄送人
	 * @param bcc				密送人
	 * @param subject			主题
	 * @param content			内容
	 * @param charset			邮件编码
	 * @throws AddressException
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException 
	 */
	public static void send(String to, String cc, String bcc, String subject, String content, String charset)
			throws AddressException, MessagingException, UnsupportedEncodingException {
		send(new String[] { to }, new String[]{ cc }, new String[]{ bcc }, subject, content, null, charset);
	}

	/**
	 * 发送邮件
	 * @param to				收件人
	 * @param cc				抄送人
	 * @param bcc				密送人
	 * @param subject			标题
	 * @param content			正文
	 * @param files				附件
	 * @param charset			字符编码
	 * @throws AddressException
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 */
	public static void send(String[] to, String[] cc, String[] bcc, String subject, String content, String[] files, String charset)
			throws AddressException, MessagingException, UnsupportedEncodingException {
		Session mailSession = Session.getInstance(props);
		Message message = new MimeMessage(mailSession);

		// 发件人
		message.setFrom(new InternetAddress(user));
		// 收件人
		if (to != null) {
			message.addRecipients(Message.RecipientType.TO, makeMailList(to));
		}
		// 抄送人
		if (cc != null) {
			message.addRecipients(Message.RecipientType.CC, makeMailList(to));
		}
		// 密送人
		if (bcc != null){
			message.addRecipients(Message.RecipientType.BCC, makeMailList(to));
		}
		// 邮件主题
		message.setSubject(subject);
		// 指定邮箱内容及ContentType和编码
		if (files != null){
			message.setContent(addAttachments(content, files, charset));
		}else{
			message.setContent(content, "text/html;charset=" + charset);
		}
	
		// 设置发送日期
		message.setSentDate(new Date());
		message.saveChanges();

		Transport transport = mailSession.getTransport("smtp");
		transport.connect(host, user, password);
		transport.sendMessage(message, message.getAllRecipients());
		transport.close();
	}

	/**
	 * 添加附件
	 * @param content	正文内容
	 * @param files		附件文件
	 * @param charset	字符编码
	 * @return
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 */
	private static Multipart addAttachments(String content, String[] files, String charset) throws MessagingException, UnsupportedEncodingException {
		Multipart multipart = new MimeMultipart();
		BodyPart bodypart = new MimeBodyPart();
		bodypart.setContent(content, "text/html;charset=" + charset);
		multipart.addBodyPart(bodypart);
		makeAttachments(files, multipart, charset);
		return multipart;
	}
	/**
	 * 创建收件人列表数组
	 * @param to          	收件人邮箱
	 * @param message		Message对象
	 * @throws MessagingException
	 */
	private static InternetAddress[] makeMailList(String[] to) throws MessagingException {
		int size = to.length;
		InternetAddress[] address = new InternetAddress[size];
		for (int i = 0; i < size; i++) {
			address[i] = new InternetAddress(to[i]);
		}
		return address;
	}
	
	/**
	 * 添加附件
	 * @param files
	 * @param multipart
	 * @param charset
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 */
	private static void makeAttachments(String[] files,Multipart multipart, String charset) throws MessagingException, UnsupportedEncodingException{ 
	    for (int index = 0;index <  files.length;index++) 
	        { 
	         MimeBodyPart mailArchieve = new MimeBodyPart(); 
	         FileDataSource fds = new FileDataSource(files[index]); 
	         mailArchieve.setDataHandler(new DataHandler(fds)); 
	         mailArchieve.setFileName(MimeUtility.encodeText(fds.getName(),charset,"B")); 
	         multipart.addBodyPart(mailArchieve); 
	        }   
	} 
	public static void sendMail(String str,String userName,String email) throws AddressException, MessagingException, IOException{
		String to=email;//收件邮箱地址
		String subject = "SkyCat修改密码邮箱验证";
		String title = "验证邮件";
		String name = userName;
		String main = str;//邮件内容
		String content ="ss" ;
	    //写入mailTo.html
		BufferedReader br = new BufferedReader(
				new InputStreamReader(
						MailUtil.class.getClassLoader().
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
	public static String strRandom(){
		String str="";
		//随机函数
		Random rd=new Random();
		//用数组保存验证码中出现的字符
		String[] arr= {"1","2","3","4","5","6","7","8","9","a","b","c","S","R","A","B","f","k"};
		//循环，拼接生成字符串
		for(int i=0;i<5;i++) {
				str+=arr[rd.nextInt(18)];
			}
		return  str;
		
	}
}
