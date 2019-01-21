package com.cxgc.front.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;

public class NumberUtil {

	protected final Logger log = Logger.getLogger(NumberUtil.class);
	
	/**
	 * 根据前缀生成随机的编号
	 * @param prefix
	 * @return
	 */
	public static String getRandomCode(String prefix){
		String code="";
		if(prefix!=null && !"".equals(prefix)){
			code+=prefix;
		}
		//获取当前的日期
        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        //获取String类型的时间
		code+=sdf.format(date);
		
		String random=""+(int)((Math.random()*9+1)*1000);  
		code+=random;
		
		return code;
	}
	
	public static void main(String[] args) {
		
		for (int i = 0; i < 10; i++) {
			System.out.println(getRandomCode("R"));
		}
		
	}
}
