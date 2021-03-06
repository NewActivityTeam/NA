package com.na.service;

import java.util.List;

import com.na.entity.Userinfo;

public interface UserinfoService {

	public int createAndSetUserinfo(long uid,String ybaccount,int authority,String name, float height,float weight,int age,int sex,String phonenumber,String email);
	
	public int createUserinfo(long uid,String ybaccount);
	
	public int setUserinfo(long uid,String name,float height,float weight,int age,int sex,String phonenumber,String email);
	
	public int updateUserinfo(long uid,int subject,Object content);
	
	public int updateUser(Userinfo user);

	public int deleteUserinfo(long uid);
	
	public int changeAuthority(long uid,int authority);
	
	public int banUser(long uid,int bandays);
	
	public boolean testBan(long uid);
	
	public boolean testUserinfo(long uid);
	
	public Userinfo getUserinfo(long uid);
	
	public Userinfo getUserinfoByYbAccount(String ybaccount);
	
	public List<Userinfo> getUserinfos(long[] ids);
	
	public List<Userinfo> getAllUserinfos();
	public int getJoinedActivityNumber(long uid);
	
}
