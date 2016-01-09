package com.na.service.imp;

import java.util.ArrayList;
import java.util.List;

import com.na.dao.UserinfoDao;
import com.na.entity.Userinfo;
import com.na.service.UserinfoService;

public class UserinfoServiceImp implements UserinfoService {
	
	UserinfoDao userinfoDao;

	public UserinfoDao getUserinfoDao() {
		return userinfoDao;
	}

	public void setUserinfoDao(UserinfoDao userinfoDao) {
		this.userinfoDao = userinfoDao;
	}

	//创建并设置用户信息
	@Override
	public int createAndSetUserinfo(long uid,String ybaccount, int authority, float height,
			float weight, int age, int sex, String phonenumber, String email) {
		
		int code = 11014;
		try{
			Userinfo userinfo = new Userinfo();
			userinfo.setUid(uid);
			userinfo.setYbaccount(ybaccount);
			userinfo.setAuthority(0);
			userinfo.setHeight(height);
			userinfo.setWeight(weight);
			userinfo.setAge(age);
			userinfo.setSex(sex);
			userinfo.setPhonenumber(phonenumber);
			userinfo.setEmail(email);
			if(userinfoDao.insert(userinfo)){
				code = 11011;
			}
			else{
				code = 11013;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return code;
	}

	//创建用户信息（尚未参加活动，刚刚授权）
	@Override
	public int createUserinfo(long uid, String ybaccount) {
		
		int code = 11014;
		try{
			Userinfo userinfo = new Userinfo();
			userinfo.setUid(uid);
			userinfo.setYbaccount(ybaccount);
			userinfo.setAuthority(0);
			if(userinfoDao.insert(userinfo)){
				code = 11011;
			}
			else{
				code = 11013;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return code;
		
	}

	//设置用户信息（第一次参与活动）
	@Override
	public int setUserinfo(long uid,float height,float weight,int age,int sex,String phonenumber,String email){
		
		int code = 11014;
		try{
			Userinfo userinfo = userinfoDao.getUserinfo(uid);
			userinfo.setHeight(height);
			userinfo.setWeight(weight);
			userinfo.setAge(age);
			userinfo.setSex(sex);
			userinfo.setPhonenumber(phonenumber);
			userinfo.setEmail(email);
			if(userinfoDao.update(userinfo)){
				code = 11011;
			}
			else{
				code = 11013;
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return code;
		
	}

	//参与活动时，先检测用户信息是否已填写,已填写为true，未填写为false
	@Override
	public boolean testUserinfo(long uid) {
		
		try{
			Userinfo userinfo = userinfoDao.getUserinfo(uid);
			
			if (userinfo.getSex()!=null) {
				return true;
			}
			else {
				return false;
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
		
	}
	
	/***
	 * 更新用户信息
	 * subject:
	 * 		1	height		身高
	 * 		2	weight		体重
	 * 		3	age			年龄
	 * 		4	sex			性别
	 * 		5	phonenumber	手机号
	 * 		6	email		电子邮箱
	 */
	@Override
	public int updateUserinfo(long uid, int subject, Object content) {
		
		int code = 11024;
		try{
			Userinfo userinfo = userinfoDao.getUserinfo(uid);
			boolean change = false;
			switch (subject) {
			
			case 1:
				userinfo.setHeight(Float.parseFloat(content.toString()));
				change = true;
				break;
			
			case 2:
				userinfo.setWeight(Float.parseFloat(content.toString()));
				change = true;
				break;
				
			case 3:
				userinfo.setAge(Integer.parseInt(content.toString()));
				change = true;
				break;
				
			case 4:
				userinfo.setSex(Integer.parseInt(content.toString()));
				change = true;
				break;
			
			case 5:	
				userinfo.setPhonenumber(content.toString());
				change = true;
				break;
			case 6:
				userinfo.setEmail(content.toString());
				change = true;
				break;

			default:
				break;
			}
			if (change) {
				if(userinfoDao.update(userinfo)){
					code = 11021;
				}
				else{
					code = 11023;
				}

			}
			else{
				code = 11022;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return code;
		
	}

	//删除用户信息
	@Override
	public int deleteUserinfo(long uid) {
		
		int code = 11034;
		try{
			Userinfo userinfo = userinfoDao.getUserinfo(uid);
			if(userinfoDao.delete(userinfo)){
				code = 11031;
			}
			else{
				code = 11033;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return code;
		
	}

	/***
	 * 修改用户权限
	 * 	authority:
	 * 		超级管理员：9999
	 * 		管理员1
	 *  	普通用户0
	 */
	@Override
	public int changeAuthority(long uid, int authority) {
		
		int code = 11024;
		try{
			Userinfo userinfo = userinfoDao.getUserinfo(uid);
			userinfo.setAuthority(authority);
			if(userinfoDao.update(userinfo)){
				code = 11021;
			}
			else{
				code = 11023;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return code;
		
	}
	
	//获取用户信息
	@Override
	public Userinfo getUserinfo(long uid) {
		return userinfoDao.getUserinfo(uid);
	}

	//获取用户信息通过易班账号
	@Override
	public Userinfo getUserinfoByYbAccount(String ybaccount) {
		String hql = "from Userinfo where ybaccount='" + ybaccount +"'";
		List<Userinfo> list = (List<Userinfo>) userinfoDao.selectHql(hql);
		if (list!=null&&list.size()!=0) {
			return list.get(0);
		}
		return null;
	}

	//获取多个用户信息
	@Override
	public List<Userinfo> getUserinfos(long[] ids) {
		List<Userinfo> list = new ArrayList<Userinfo>();
		for (long uid : ids) {
			Userinfo userinfo = userinfoDao.getUserinfo(uid);
			if (userinfo!=null) {
				list.add(userinfo);
			}
		}
		if (list.size()!=0) {
			return list;
		}
		return null;
	}

}
