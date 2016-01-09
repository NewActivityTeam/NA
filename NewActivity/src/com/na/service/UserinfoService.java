package com.na.service;

import java.util.List;

import com.na.entity.Userinfo;

public interface UserinfoService {

	public int createAndSetUserinfo(long uid,String ybaccount,int authority,float height,float weight,int age,int sex,String phonenumber,String email);
	
	public int createUserinfo(long uid,String ybaccount);
	
	public int setUserinfo(long uid,float height,float weight,int age,int sex,String phonenumber,String email);
	
	public boolean testUserinfo(long uid);
	
	public int updateUserinfo(long uid,int subject,Object content);

	public int deleteUserinfo(long uid);
	
	public int changeAuthority(long uid,int authority);
	
	public Userinfo getUserinfo(long uid);
	
	public Userinfo getUserinfoByYbAccount(String ybaccount);
	
	public List<Userinfo> getUserinfos(long[] ids);
	
	
}
