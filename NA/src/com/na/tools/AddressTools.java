package com.na.tools;

public class AddressTools {

	//易班获取的APPKEY
	public static String Appkey = "";
	//易班APPID
	public static String AppID = "4d66c2ae613bf94d";
	//易班AppSeceret
	public static String AppSecret = "fee6214c7160d328207e1f8fa25869bd";
	
	//API主机地址
	public static String APIHost = "https://openapi.yiban.cn/";
	
	//应用的域名地址APPAddress
	public static String AppAdress = "http://";
	//自定义的参数State
	public static String State = "";

	//Web授权
	public static String AuthorizeWeb = APIHost + "oauth/authorize?client_id="+Appkey+"&redirect_uri="
	+AppAdress+"&state="+State+"&display=web";
	//手机端授权
	public static String AuthorizeMobile = APIHost + "oauth/authorize?client_id="+Appkey+"&redirect_uri="
			+AppAdress+"&state="+State+"&display=mobile";
	//HTML授权
	public static String AuthorizeHTML = APIHost + "oauth/authorize?client_id="+Appkey+"&redirect_uri="
			+AppAdress+"&state="+State+"&display=html";
	
	//获取用户个人信息
	public static String GetUser = APIHost + "user/me";
	
	
	
	
}
