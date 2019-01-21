package com.cxgc.front.config;

import java.util.*;
import java.io.*;

/**
 * 
 * @author kongxiangming 
 *
 */
public class ReadProperties {

	private InputStream configFile;
	private Properties props;

	public ReadProperties() {
	}

	public String getProperty(String property) {
		return props.getProperty(property);
	}

	public void loadConfig() throws IOException {
		// 当前类文件目录下的文件
		configFile = getClass().getResourceAsStream("config.properties");
		props = new Properties();
		props.load(configFile);
	}

	public void loadConfig(String fileName) throws IOException {
		configFile = (InputStream) new FileInputStream(new File(fileName));
		props = new Properties();
		props.load(configFile);
	}

	public void setProp(String name, String value) {
		if (props == null)
			props = new Properties();
		props.put(name, value);

	}

	/**
	 * 返回string类型专用
	 * @param strName
	 * @return
	 */
	public static String getPropertyByStringName(String strName) {
		String str = "";
		try {
			ReadProperties pro = new ReadProperties();
			pro.loadConfig();
			str = pro.getProperty(strName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
	
	/**
	 * 返回long类型专用
	 * @param strName
	 * @return
	 */
	public static long getPropertyByLongName(String strName) {
		long l = 0;
		try {
			ReadProperties pro = new ReadProperties();
			pro.loadConfig();
			String property = pro.getProperty(strName);
			l = Long.parseLong(property);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return l;
	}
	
	public static int getPropertyByIntName(String strName) {
		int i = 0;
		try {
			ReadProperties pro = new ReadProperties();
			pro.loadConfig();
			String property = pro.getProperty(strName);
			i = Integer.parseInt(property);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return i;
	}
	
	
	/**
	 * Http连接超时时长超时时间
	 * @return
	 */
	public static String getConnectionTimeout(){
		String str = "";
		try {
			ReadProperties pro = new ReadProperties();
			pro.loadConfig();
			str = pro.getProperty("connectiontimeout");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return str;
	}

	
	/**
	 * 读取返回数据超时时长
	 * @return
	 */
	public static String getReadTimeout(){
		String str = "";
		try {
			ReadProperties pro = new ReadProperties();
			pro.loadConfig();
			str = pro.getProperty("readtimeout");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return str;
	} 
	
	
	/**
	 * 读取返回数据超时时长
	 * @return
	 */
	public static String getPrivateKey(){
		String str = "";
		try {
			ReadProperties pro = new ReadProperties();
			pro.loadConfig();
			str = pro.getProperty("privateKey");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	} 

}
