package com.na.dao;

import com.na.entity.Assess;

public interface AssessDao {

	public boolean insert(Assess assess);
	public boolean update(Assess assess);
	public boolean delete(Assess assess);
	public Object selectHql(String hql);
	public Object selectSql(String sql);
	public int otherHql(String hql);
	public int otherSql(String sql);
	public Assess getAssess(long id);
}
