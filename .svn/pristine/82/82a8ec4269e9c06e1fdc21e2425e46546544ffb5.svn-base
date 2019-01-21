package com.cxgc.front.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/**
 * AES 加密
 */
public class AESEncoder {
	/**
	 * 
	 * @ TODO 加密
	 * @author 张一洋
	 * @date 创建时间 2014年3月18日
	 * @param src 需要加密的信息
	 * @return
	 * @throws Exception 谁调用谁处理
	 * @version
	 */
	public static String encrypt(String src)throws Exception {
		String key = null;
		SimpleDateFormat sdf = new SimpleDateFormat(
				"MMddyyyy");
		key = sdf.format(new Date());
		return encrypt(src,key+key);
	}
	/**
	 * 
	 * @ TODO 解密方法
	 * @author 张一洋
	 * @date 创建时间 2014年3月18日
	 * @param src 解密信息字符串
	 * @return
	 * @throws Exception
	 * @version
	 */
	
	public static String decrypt(String src)throws Exception {
		String key = null;
		SimpleDateFormat sdf = new SimpleDateFormat(
				"MMddyyyy");
		key = sdf.format(new Date());
		return decrypt(src,key+key);
	}
	/**
	 * 解密方法
	 */
	public static String decrypt(String src, String key) throws Exception {
			if (key == null)
				return null;
			if (key.length() != 16)
				return null;
			byte[] raw = key.getBytes("ASCII");
			SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.DECRYPT_MODE, skeySpec);
			byte[] encrypted = hex2byte(src.trim());
			byte[] original = cipher.doFinal(encrypted);
			String originalString = new String(original);
			return originalString;
	}

	/**
	 * 
	 * 加密方法
	 */
	public static String encrypt(String src, String key) throws Exception {
		if (key == null)
			return null;
		if (key.length() != 16)
			return null;
		byte[] raw = key.getBytes("ASCII");
		SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
		byte[] encrypted = cipher.doFinal(src.getBytes());
		return byte2hex(encrypted).toLowerCase();
	}

	private static byte[] hex2byte(String hex) {
		if (hex == null)
			return null;
		int l = hex.length();
		if (l % 2 == 1)
			return null;
		byte[] bytes = new byte[l / 2];
		for (int i = 0; i != l / 2; i++)
			bytes[i] = (byte) Integer.parseInt(hex.substring(i * 2, i * 2 + 2),
					16);
		return bytes;

	}

	private static String byte2hex(byte[] bytes) {
		String hs = "";
		String stmp = "";
		for (int i = 0; i < bytes.length; i++) {
			stmp = (java.lang.Integer.toHexString(bytes[i] & 0XFF));
			if (stmp.length() == 1)
				hs = hs + "0" + stmp;
			else
				hs = hs + stmp;
		}
		return hs.toUpperCase();
	}
	
	
	public static void main(String[] args) {
		String m = "";
		try {
			m=AESEncoder.decrypt(AESEncoder.encrypt("1234567890"));
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		System.out.println("m==="+m);
	}

}
