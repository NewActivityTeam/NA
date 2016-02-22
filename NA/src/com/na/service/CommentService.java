package com.na.service;

import java.util.List;

import com.na.entity.Comment;

public interface CommentService {

	public int newComment(long uid,long aid,String uname,String content);
	
	public int updateComment(long id,String content);
	
	public int deleteComment(long id);
	
	public Comment getComment(long id);
	
	public List<Comment> getAllCommentsByAID(long aid);
	
	public boolean deleteAllCommentsByAID(long aid);
	
	public boolean deleteAllCommentsByUID(long uid);
	
	public int getAllCommentNumberByAID(long aid);
	
	public List<Comment> getAllCommentsByPage(long aid,int currentPage,int pageSize);
	
	
}
