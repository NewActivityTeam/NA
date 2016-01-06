package com.na.service;

import com.na.entity.Userinfo;

public interface UserinfoService {

	public int setUserinfo(String ybaccount,int authority,float height,int weight,int age,int sex,String phonenumber,String email);
	
	public int updateUserinfo(long uid,int subject,Object content);

	public int deleteUserinfo(long uid);
	
	public Userinfo getUserinfo(long uid);
	
	public Userinfo getUserinfoByYbAccount(String ybaccount);
	
	
}
