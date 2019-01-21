package com.cxgc.front.util;

import com.cxgc.front.config.ReadProperties;

import getword.GetWord;

public class picProcessUtil {

	public static String getWord(String path,String fileName,String imgType) throws Exception{
		getword.GetWord getword = new GetWord();
		
		String ocrPath = ReadProperties.getPropertyByStringName("ocrPath");
		
		String word = getword.getWord(path, fileName, imgType, ocrPath);
		
		return word;
	}
	
	public static void main(String[] args) {
		
		String word;
		try {
			word = getWord("E:\\test", "4.jpg", "jpg");
			System.out.println(word);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
