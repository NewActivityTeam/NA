package com.na.dao;

import com.na.entity.Userinfo;

public interface UserinfoDao {
	public boolean insert(Userinfo userinfo);
	public boolean update(Userinfo userinfo);
	public boolean delete(Userinfo userinfo);
	public Object selectHql(String hql);
	public Object selectSql(String sql);
	public int otherHql(String hql);
	public int otherSql(String sql);
	public Userinfo getUserinfo(long uid);
	public int findCount(String sql);
}
