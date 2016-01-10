package com.na.service.imp;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.na.dao.GroupApplyDao;
import com.na.entity.GroupApply;
import com.na.service.GroupApplyService;

@Service("groupApplyService")
public class GroupApplyServiceImp implements GroupApplyService {

	@Autowired
	@Qualifier("groupApplyDao")
	GroupApplyDao groupApplyDao;


	//新的组队申请
	@Override
	public int newGroupApply(long uid, long gid) {
		
		int code = 16014;
		
		try {
			GroupApply groupApply = new GroupApply();
			groupApply.setUid(uid);
			groupApply.setGid(gid);
			groupApply.setState(0);
			groupApply.setCreatetime(new Timestamp(new Date().getTime()));
			if (groupApplyDao.insert(groupApply)) {
				code = 16011;
			}
			else{
				code = 16013;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}

	//接受申请
	@Override
	public int acceptApply(long id) {
		
		int code = 16024;
		
		try {
			GroupApply groupApply = new GroupApply();
			groupApply.setState(1);
			if(groupApplyDao.update(groupApply)){
				code = 16021;
			}
			else{
				code = 16023;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}

	//拒绝申请
	@Override
	public int refuseApply(long id) {
		
		int code = 16034;

		try {
			GroupApply groupApply = new GroupApply();
			groupApply.setState(2);
			if(groupApplyDao.update(groupApply)){
				code = 16031;
			}
			else{
				code = 16033;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}

	//获取组队申请
	@Override
	public GroupApply getGroupApply(long id) {
		return groupApplyDao.getGroupApply(id);
	}

	//获取小组的所有组队申请
	@Override
	public List<GroupApply> getGroupAppliesByGID(long gid) {

		String hql = "from GroupApply where gid="+gid;
		try {
			List<GroupApply> list = (List<GroupApply>) groupApplyDao.selectHql(hql);
			if (list!=null&&list.size()!=0) {
				return list;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//获取用户发出的所有组队申请
	@Override
	public List<GroupApply> getGroupAppliesByUID(long uid) {

		String hql = "from GroupApply where uid="+uid;
		try {
			List<GroupApply> list = (List<GroupApply>) groupApplyDao.selectHql(hql);
			if (list!=null&&list.size()!=0) {
				return list;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
	
}
