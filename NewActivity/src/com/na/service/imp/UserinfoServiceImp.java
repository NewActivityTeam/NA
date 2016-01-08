package com.na.service.imp;

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

	//设置用户信息
	@Override
	public int setUserinfo(String ybaccount, int authority, float height,
			int weight, int age, int sex, String phonenumber, String email) {
		// TODO Auto-generated method stub
		return 0;
	}

	//更新用户信息
	@Override
	public int updateUserinfo(long uid, int subject, Object content) {
		// TODO Auto-generated method stub
		return 0;
	}

	//删除用户信息
	@Override
	public int deleteUserinfo(long uid) {
		// TODO Auto-generated method stub
		return 0;
	}

	//获取用户信息
	@Override
	public Userinfo getUserinfo(long uid) {
		// TODO Auto-generated method stub
		return null;
	}

	//获取用户信息通过易班账号
	@Override
	public Userinfo getUserinfoByYbAccount(String ybaccount) {
		// TODO Auto-generated method stub
		return null;
	}

	//获取多个用户信息
	@Override
	public List<Userinfo> getUserinfos(long[] ids) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
