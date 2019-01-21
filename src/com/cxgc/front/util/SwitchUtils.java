package com.cxgc.front.util;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.log4j.Logger;

/**
 * @author kongxm
 */
public class SwitchUtils {
	protected final Logger log = Logger.getLogger(SwitchUtils.class);
	
	/**
	 * 将boolean类型转换为string类型
	 * @param b
	 * @return
	 */
	public static String booleanSwitchString(Boolean b){
		
		if(b!=null){
			if(b){
				return "是";
			}else{
				return "否";
			}
		}else{
			return null;
		}
		
	}
	
	
	/**
	 * double类型转换为String类型的0.00%格式
	 * @param args
	 * @return
	 */
	public static String format_perCent(double args) {
        DecimalFormat df = new DecimalFormat("0.00%");
        String str = df.format(args);
        return str;
    }
	
	
	
}
