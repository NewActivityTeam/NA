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

	@Override
	public int setUserinfo(String ybaccount, int authority, float height,
			int weight, int age, int sex, String phonenumber, String email) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUserinfo(long uid, int subject, Object content) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUserinfo(long uid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Userinfo getUserinfo(long uid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Userinfo getUserinfoByYbAccount(String ybaccount) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Userinfo> getUserinfos(long[] ids) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
