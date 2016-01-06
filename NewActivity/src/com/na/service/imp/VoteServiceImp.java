package com.na.service.imp;

import com.na.dao.VoteDao;
import com.na.entity.Vote;
import com.na.service.VoteService;

public class VoteServiceImp implements VoteService {

	VoteDao voteDao;

	public VoteDao getVoteDao() {
		return voteDao;
	}

	public void setVoteDao(VoteDao voteDao) {
		this.voteDao = voteDao;
	}

	@Override
	public int newVote(String title, String address) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateVote(long id, String title, String address) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteVote(long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Vote getVote(long id) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
