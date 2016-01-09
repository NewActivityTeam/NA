package com.na.tools;

public class UnicodeAndStringTools {

	//String字符串转换成Unicode字符串
	public static String stringToUnicode(String string) {
		 
	    StringBuffer unicode = new StringBuffer();
	    for (int i = 0; i < string.length(); i++) {
	        char c = string.charAt(i);
	        unicode.append("\\u" + Integer.toHexString(c));
	    }
	 
	    return unicode.toString();
	}
	
	//Unicode字符串转换成String字符串
	public static String unicodeToString(String unicode) {
		 
	    StringBuffer string = new StringBuffer();
	 
	    String[] hex = unicode.split("\\\\u");
	 
	    //不是Unicode类型的不需要转换
	    if (hex.length==1) {
			return unicode;
		}
	    
	    for (int i = 1; i < hex.length; i++) {
	        int data = Integer.parseInt(hex[i], 16);
	        string.append((char) data);
	    }
	 
	    return string.toString();
	}
}
