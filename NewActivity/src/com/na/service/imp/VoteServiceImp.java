package com.na.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.na.dao.VoteDao;
import com.na.entity.Vote;
import com.na.service.VoteService;

@Service("voteService")
public class VoteServiceImp implements VoteService {

	@Autowired
	@Qualifier("voteDao")
	VoteDao voteDao;


	//新增投票
	@Override
	public int newVote(String title, String address) {
		
		int code = 18014;
		try {
			Vote vote = new Vote();
			vote.setTitle(title);
			vote.setAddress(address);
			if (voteDao.insert(vote)) {
				code = 18011;
			}
			else{
				code = 18013;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}

	//修改投票
	@Override
	public int updateVote(long id, String title, String address) {

		int code = 18024;
		try {
			Vote vote = voteDao.getVote(id);
			vote.setTitle(title);
			vote.setAddress(address);
			if (voteDao.update(vote)) {
				code = 18021;
			}
			else{
				code = 18023;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}

	//删除投票
	@Override
	public int deleteVote(long id) {
		int code = 18034;
		try {
			Vote vote = voteDao.getVote(id);
			if (voteDao.delete(vote)) {
				code = 18031;
			}
			else{
				code = 18033;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}

	//获取投票
	@Override
	public Vote getVote(long id) {
		return voteDao.getVote(id);
	}
	
}
