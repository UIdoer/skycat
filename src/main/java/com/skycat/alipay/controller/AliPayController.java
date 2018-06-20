package com.skycat.alipay.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.skycat.alipay.config.AlipayConfig;
import com.skycat.order.order.entity.Order;
import com.skycat.order.order.service.OrderService;

@Controller
@RequestMapping("alipay")
public class AliPayController {

	@Autowired
	OrderService orderService;

	/**
	 * 跳转支付页面
	 * 
	 * @param WIDout_trade_no
	 *            商户订单号
	 * @param WIDsubject
	 *            订单标题
	 * @param WIDtotal_amount
	 *            订单总价
	 * @param WIDbody
	 *            订单内容
	 * @param map
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("generatePay")
	@ResponseBody
	public void toPaymentPage(@RequestParam("WIDout_trade_no") String WIDout_trade_no,
			@RequestParam("WIDsubject") String WIDsubject, @RequestParam("WIDtotal_amount") String WIDtotal_amount,
			@RequestParam(name="WIDbody",defaultValue="订单") String WIDbody, 
			ModelMap map,
			HttpServletRequest request,
			HttpServletResponse response) {
		// 获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.getGatewayUrl(), AlipayConfig.getApp_id(),
		AlipayConfig.getMerchant_private_key(), "json", AlipayConfig.getCharset(),
		AlipayConfig.getAlipay_public_key(), AlipayConfig.getSign_type());

		// 设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.getReturn_url());
		alipayRequest.setNotifyUrl(AlipayConfig.getNotify_url());

		// 商户订单号，商户网站订单系统中唯一订单号，必填
		String out_trade_no = WIDout_trade_no;
		// 付款金额，必填
		String total_amount = WIDtotal_amount;
		// 订单名称，必填
		String subject = WIDsubject;
		// 商品描述，可空
		String body = WIDbody;

		alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\"," + "\"total_amount\":\"" + total_amount
				+ "\"," + "\"subject\":\"" + subject + "\"," + "\"body\":\"" + body + "\","
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

		// 若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
		// alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
		// + "\"total_amount\":\""+ total_amount +"\","
		// + "\"subject\":\""+ subject +"\","
		// + "\"body\":\""+ body +"\","
		// + "\"timeout_express\":\"10m\","
		// + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		// 请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节

		// 请求
		String result = "";
		try {
			result = alipayClient.pageExecute(alipayRequest).getBody();
		} catch (AlipayApiException e) {
			e.printStackTrace();
		}

		// 输出
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().println(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return;
	}

	/**
	 * 支付宝支付成功后异步的回调url
	 * 
	 * @return
	 */
	@RequestMapping("returnUrl")
	@ResponseBody
	public String returnUrl(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("AliPayController.returnUrl()");
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			//获取支付宝GET过来反馈信息
			Map<String,String> params = new HashMap<String,String>();
			Map<String,String[]> requestParams = request.getParameterMap();
			for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i]
							: valueStr + values[i] + ",";
				}
				//乱码解决，这段代码在出现乱码时使用
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
				params.put(name, valueStr);
			}
			
			boolean signVerified=false;
			try {
				signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.getAlipay_public_key(), AlipayConfig.getCharset(), AlipayConfig.getSign_type());
			} catch (AlipayApiException e) {
				e.printStackTrace(); 
			} //调用SDK验证签名

			//——请在这里编写您的程序（以下代码仅作参考）——
			if(signVerified) {
				//商户订单号
				String out_trade_no = request.getParameter("out_trade_no");
			
				//支付宝交易号
				String trade_no = request.getParameter("trade_no");
			
				//付款金额
				String total_amount = request.getParameter("total_amount");
				
				// 验证通知中的订单号
				Order o = orderService.selectByPrimaryKey(Integer.valueOf(out_trade_no));
				if (o != null) {
					Double total = o.getTotal();
					if (total_amount != null && Double.valueOf(total_amount).toString().equals(String.valueOf(total))) {
						// 调用service改变订单的状态为已付款
						Order order = new Order();
						order.setOrderId(Integer.valueOf(out_trade_no));
						order.setStatus(1);
						orderService.updateByPrimaryKeySelective(order);
					} else {
						System.out.println("订单" + out_trade_no + "支付失败，金额不一致,total_amount:"+Double.valueOf(total_amount)+" total: "+total);
						out.print("fail");
						return null;
					}
				} else {
					System.out.println("订单" + out_trade_no + "支付失败，订单号不存在");
					out.print("fail");
					return null;
				}
				System.out.println("订单" + out_trade_no + "支付成功");
				//out.print("success");
				out.print("订单支付成功，正在回到订单列表~<script>window.setTimeout(\"location='/skycat/user/order/list';\",500)</script>");
				//out.println("trade_no:"+trade_no+"<br/>out_trade_no:"+out_trade_no+"<br/>total_amount:"+total_amount);
			}else {
				out.println("验签失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// ——请在这里编写您的程序（以上代码仅作参考）——
		return null;
	}
	
	/**
	 * 支付宝支付成功后异步的回调url
	 * 
	 * @return
	 */
	@RequestMapping("notify")
	@ResponseBody
	public String orderNotify(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("AliPayController.orderNotify()");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		// 获取支付宝POST过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用
			// valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}

		boolean signVerified = false;
		try {
			signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.getAlipay_public_key(),
					AlipayConfig.getCharset(), AlipayConfig.getSign_type());
		} catch (AlipayApiException e) {
			e.printStackTrace();
		} // 调用SDK验证签名

		// ——请在这里编写您的程序（以下代码仅作参考）——

		/*
		 * 实际验证过程建议商户务必添加以下校验： 1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
		 * 2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额）， 3、校验通知中的seller_id（或者seller_email)
		 * 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
		 * 4、验证app_id是否为该商户本身。
		 */
		if (signVerified) {// 验证成功
			// 商户订单号
			String out_trade_no = request.getParameter("out_trade_no");

			// 总金额
			String total_amount = request.getParameter("total_amount");

			// 支付宝交易号
			String trade_no = request.getParameter("trade_no");

			// 交易状态
			String trade_status = request.getParameter("trade_status");

			if (trade_status.equals("TRADE_FINISHED")) {
				// 判断该笔订单是否在商户网站中已经做过处理
				// 如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				// 如果有做过处理，不执行商户的业务程序

				// 注意：
				// 退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
			} else if (trade_status.equals("TRADE_SUCCESS")) {
				// 判断该笔订单是否在商户网站中已经做过处理
				// 如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				// 如果有做过处理，不执行商户的业务程序

				// 验证通知中的订单号
				Order o = orderService.selectByPrimaryKey(Integer.valueOf(out_trade_no));
				if (o != null) {
					Double total = o.getTotal();
					if (total_amount != null && total_amount.equals(String.valueOf(total))) {
						// 调用service改变订单的状态为已付款
						Order order = new Order();
						order.setOrderId(Integer.valueOf(out_trade_no));
						order.setStatus(1);
						orderService.updateByPrimaryKeySelective(order);
					} else {
						System.out.println("订单" + out_trade_no + "支付失败，金额不一致");
						out.print("fail");
						return null;
					}
				} else {
					System.out.println("订单" + out_trade_no + "支付失败，订单号不存在");
					out.print("fail");
					return null;
				}
				System.out.println("订单" + out_trade_no + "支付成功");
				out.print("success");
				// 注意：
				// 付款完成后，支付宝系统发送该交易状态通知
			}

		} else {// 验证失败
			out.print("fail");
			// 调试用，写文本函数记录程序运行情况是否正常
			// String sWord = AlipaySignature.getSignCheckContentV1(params);
			// AlipayConfig.logResult(sWord);
		}

		// ——请在这里编写您的程序（以上代码仅作参考）——
		return null;
	}
}
