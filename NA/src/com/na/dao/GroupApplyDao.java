package com.na.dao;

import com.na.entity.GroupApply;

public interface GroupApplyDao {

	public boolean insert(GroupApply groupApply);
	public boolean update(GroupApply groupApply);
	public boolean delete(GroupApply groupApply);
	public Object selectHql(String hql);
	public Object selectSql(String sql);
	public int otherHql(String hql);
	public int otherSql(String sql);
	public GroupApply getGroupApply(long id);
}
