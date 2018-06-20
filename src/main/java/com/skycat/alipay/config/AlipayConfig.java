package com.skycat.alipay.config;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class AlipayConfig {
	
	private static String gatewayUrl;
	private static String app_id;
	private static String merchant_private_key;
	private static String charset;
	private static String alipay_public_key;
	private static String sign_type;
	private static String return_url;
	private static String notify_url;

	static {
		Properties p = new Properties();
		InputStream is = AlipayConfig.class.getClassLoader().getResourceAsStream("alipay.properties");
		try {
			p.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		gatewayUrl=p.getProperty("GATEWAY_URL");
		app_id=p.getProperty("APP_ID");
		merchant_private_key=p.getProperty("MERCHANT_PRIVATE_KEY");
		charset=p.getProperty("CHARSET");
		alipay_public_key=p.getProperty("ALIPAY_PUBLIC_KEY");
		sign_type=p.getProperty("SIGN_TYPE");
		return_url=p.getProperty("RETURN_URL");
		notify_url=p.getProperty("NOTIFY_URL");
	}

	public static String getReturn_url() {
		return return_url;
	}

	public static String getNotify_url() {
		return notify_url;
	}

	public static String getGatewayUrl() {
		return gatewayUrl;
	}

	public static String getApp_id() {
		return app_id;
	}

	public static String getMerchant_private_key() {
		return merchant_private_key;
	}

	public static String getCharset() {
		return charset;
	}

	public static String getAlipay_public_key() {
		return alipay_public_key;
	}

	public static String getSign_type() {
		return sign_type;
	}

	
}
