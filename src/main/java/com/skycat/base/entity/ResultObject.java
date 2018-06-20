package com.skycat.base.entity;

/**
 * 方便在ajax请求时，方便的返回错误信息
 * 维护了一个结果对象和一个消息
 * @author Administrator
 *
 */
public class ResultObject {
	private Object result;
	private String msg;
	public Object getResult() {
		return result;
	}
	public void setResult(Object result) {
		this.result = result;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public ResultObject(Object result, String msg) {
		super();
		this.result = result;
		this.msg = msg;
	}
	public ResultObject() {
		super();
	}
	
}
