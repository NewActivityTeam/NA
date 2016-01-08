package com.na.service.imp;

import java.util.List;

import com.na.dao.GroupApplyDao;
import com.na.entity.GroupApply;
import com.na.service.GroupApplyService;

public class GroupApplyServiceImp implements GroupApplyService {

	GroupApplyDao groupApplyDao;

	public GroupApplyDao getGroupApplyDao() {
		return groupApplyDao;
	}

	public void setGroupApplyDao(GroupApplyDao groupApplyDao) {
		this.groupApplyDao = groupApplyDao;
	}

	//新的组队申请
	@Override
	public int newGroupApply(long uid, long gid) {
		// TODO Auto-generated method stub
		return 0;
	}

	//接受申请
	@Override
	public int acceptApply(long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	//拒绝申请
	@Override
	public int refuseApply(long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	//获取组队申请
	@Override
	public GroupApply getGroupApply(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	//获取小组的所有组队申请
	@Override
	public List<GroupApply> getGroupAppliesByGID(long gid) {
		// TODO Auto-generated method stub
		return null;
	}

	//获取用户发出的所有组队申请
	@Override
	public List<GroupApply> getGroupAppliesByUID(long uid) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
