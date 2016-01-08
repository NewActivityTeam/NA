package com.na.service.imp;

import java.util.List;

import com.na.dao.GroupDao;
import com.na.entity.Group;
import com.na.service.GroupService;

public class GroupServiceImp implements GroupService {

	GroupDao groupDao;

	public GroupDao getGroupDao() {
		return groupDao;
	}

	public void setGroupDao(GroupDao groupDao) {
		this.groupDao = groupDao;
	}

	//创建新的小组
	@Override
	public int createGroup(long aid, String groupname, String descrption,
			int maxcount) {
		// TODO Auto-generated method stub
		return 0;
	}

	//更新小组描述
	@Override
	public int updateGroup(long id, String groupname, String descrption,
			int maxcount) {
		// TODO Auto-generated method stub
		return 0;
	}

	//删除小组
	@Override
	public int deleteGroip(long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	//获取小组
	@Override
	public Group getGroup(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	//获取某活动的所有小组
	@Override
	public List<Group> getGroupsByAID(long aid) {
		// TODO Auto-generated method stub
		return null;
	}

	//获取某人参加的所有小组（适用于不同活动）
	@Override
	public List<Group> getGroupsByUID(long uid) {
		// TODO Auto-generated method stub
		return null;
	}

	//快速创建多个小组，返回小组ID列表
	@Override
	public List<Long> fastCreateGroups(long aid, int count, int nop) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
