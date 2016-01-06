package com.na.dao;

import com.na.entity.GroupApply;

public interface GroupApplyDao {

	public boolean insert(GroupApply groupApply);
	public boolean update(GroupApply groupApply);
	public boolean delete(GroupApply groupApply);
	public Object selectHql(String hql);
	public Object selectSql(String sql);
	public boolean otherHql(String hql);
	public boolean otherSql(String sql);
	public GroupApply getGroupApply(long id);
}
