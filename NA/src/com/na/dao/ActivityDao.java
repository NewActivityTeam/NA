package com.na.dao;

import java.util.List;

import com.na.entity.Activity;

public interface ActivityDao {
	public boolean insert(Activity activity);
	public boolean add(Activity activity);
	public boolean update(Activity activity);
	public boolean delete(Activity activity);
	public Object selectHql(String hql);
	public Object selectSql(String sql);
	public Object selectHqlByPage(String hql,int currentPage,int totalSize);
	public int otherHql(String hql);
	public int otherSql(String sql);
	public Activity getActivity(long id);
}
