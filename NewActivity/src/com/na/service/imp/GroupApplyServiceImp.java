package com.na.service.imp;

import com.na.dao.GroupApplyDao;
import com.na.entity.GroupApply;

public class GroupApplyServiceImp implements GroupApplyDao {

	GroupApplyDao groupApplyDao;

	public GroupApplyDao getGroupApplyDao() {
		return groupApplyDao;
	}

	public void setGroupApplyDao(GroupApplyDao groupApplyDao) {
		this.groupApplyDao = groupApplyDao;
	}

	@Override
	public boolean insert(GroupApply groupApply) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(GroupApply groupApply) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(GroupApply groupApply) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object selectHql(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object selectSql(String sql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean otherHql(String hql) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean otherSql(String sql) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public GroupApply getGroupApply(long id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
