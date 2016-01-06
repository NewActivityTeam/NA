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

	@Override
	public int createGroup(long aid, String groupname, String descrption,
			int maxcount) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateGroup(long id, String groupname, String descrption,
			int maxcount) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteGroip(long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Group getGroup(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Group> getGroupsByAID(long aid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Group> getGroupsByUID(long uid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Long> fastCreateGroups(long aid, int count, int nop) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
