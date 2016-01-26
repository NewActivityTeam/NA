package com.na.dao;

import com.na.entity.Group;

public interface GroupDao {

	public boolean insert(Group group);
	public boolean update(Group group);
	public boolean delete(Group group);
	public Object selectHql(String hql);
	public Object selectSql(String sql);
	public int otherHql(String hql);
	public int otherSql(String sql);
	public Group getGroup(long id);
}
