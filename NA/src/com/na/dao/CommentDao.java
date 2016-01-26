package com.na.dao;

import com.na.entity.Comment;

public interface CommentDao {
	public boolean insert(Comment comment);
	public boolean update(Comment comment);
	public boolean delete(Comment comment);
	public Object selectHql(String hql);
	public Object selectSql(String sql);
	public int otherHql(String hql);
	public int otherSql(String sql);
	public Comment getComment(long id);
}
