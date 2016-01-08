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

	//创建评论
	@Override
	public int newComment(long uid, long aid, String content) {
		// TODO Auto-generated method stub
		return 0;
	}

	//更新评论
	@Override
	public int updateComment(long id, String content) {
		// TODO Auto-generated method stub
		return 0;
	}

	//删除评论
	@Override
	public int deleteComment(long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	//获取评论
	@Override
	public Comment getComment(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	//获取某活动的所有评论
	@Override
	public List<Comment> getAllCommentsByAID(long aid) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
