package com.na.dao;

import com.na.entity.Image;

public interface ImageDao {

	public boolean insert(Image image);
	public boolean update(Image image);
	public boolean delete(Image image);
	public Object selectHql(String hql);
	public Object selectSql(String sql);
	public boolean otherHql(String hql);
	public boolean otherSql(String sql);
	public Image getImage(long id);
}
