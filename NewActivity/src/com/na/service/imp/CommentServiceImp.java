package com.na.service.imp;

import java.util.List;

import com.na.dao.CommentDao;
import com.na.entity.Comment;
import com.na.service.CommentService;

public class CommentServiceImp implements CommentService {
	CommentDao commentDao;

	public CommentDao getCommentDao() {
		return commentDao;
	}

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	@Override
	public int newComment(long uid, long aid, String content) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateComment(long id, String content) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteComment(long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Comment getComment(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> getAllCommentsByAID(long aid) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
