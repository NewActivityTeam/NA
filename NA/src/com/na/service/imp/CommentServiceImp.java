package com.na.service.imp;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.na.dao.CommentDao;
import com.na.entity.Comment;
import com.na.service.CommentService;

@Service("commentService")
public class CommentServiceImp implements CommentService {
	
	@Autowired
	@Qualifier("commentDao")
	CommentDao commentDao;


	//创建评论
	@Override
	public int newComment(long uid, long aid, String uname, String content) {
		
		int code = 13014;
		
		try {
			Comment comment = new Comment();
			comment.setUid(uid);
			comment.setUname(uname);
			comment.setAid(aid);
			comment.setCreatetime(new Timestamp(new Date().getTime()));
			comment.setContent(content);
			if(commentDao.insert(comment)){
				code = 13011;
			}
			else {
				code = 13013;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return code;
	}

	//更新评论
	@Override
	public int updateComment(long id, String content) {
		
		int code = 13024;
		
		try {
			Comment comment = commentDao.getComment(id);
			comment.setContent(content);
			if(commentDao.update(comment)){
				code = 13021;
			}
			else{
				code = 13023;
			}
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return code;
	}

	//删除评论
	@Override
	public int deleteComment(long id) {
		
		int code = 13034;
		
		try {
			Comment comment = commentDao.getComment(id);
			if (commentDao.delete(comment)) {
				code = 13031;
			}
			else{
				code = 13033;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return code;
	}

	//获取评论
	@Override
	public Comment getComment(long id) {
		return commentDao.getComment(id);
	}

	//获取某活动的所有评论
	@Override
	public List<Comment> getAllCommentsByAID(long aid) {
		
		String hql = "from Comment where aid="+aid + "order by createtime desc";
		try {
			List<Comment> list = (List<Comment>) commentDao.selectHql(hql);
			if (list!=null&&list.size()!=0) {
				return list;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	//获取某活动所有评论个数
	@Override
	public int getAllCommentNumberByAID(long aid) {
		String hql = "from Comment where aid="+aid;
		List<Comment> list = (List<Comment>) commentDao.selectHql(hql);
		return list.size();
	}
	//删除某活动所有评论
	@Override
	public boolean deleteAllCommentsByAID(long aid) {
		
		String hql = "from Comment where aid="+aid;
		
		try {
			if(commentDao.otherHql(hql)!=-1){
				return true;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	//删除某用户所有评论
	@Override
	public boolean deleteAllCommentsByUID(long uid) {

		String hql = "from Comment where uid="+uid;
		
		try {
			if(commentDao.otherHql(hql)!=-1){
				return true;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
