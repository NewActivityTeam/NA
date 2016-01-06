package com.na.service;

import com.na.entity.Vote;

public interface VoteService {
	
	public int newVote(String title,String address);
	
	public int updateVote(long id,String title,String address);
	
	public int deleteVote(long id);
	
	public Vote getVote(long id);
	
}
