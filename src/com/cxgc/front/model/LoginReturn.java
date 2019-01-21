package com.cxgc.front.model;

public class LoginReturn implements java.io.Serializable {
	
	public Integer code;
	
	public String msg;
	
	public LoginReturn() {
		
	}
	
	public LoginReturn(Integer code, String msg) {
		this.code = code;
		this.msg = msg;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public String toString() {
		return code + "---" + msg;
	}
	
}
