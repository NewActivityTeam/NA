package com.na.service;

import java.util.List;

import com.na.entity.GroupApply;

public interface GroupApplyService {

	public int newGroupApply(long uid,long gid);
	
	public int acceptApply(long id);
	
	public int refuseApply(long id);
	
	public GroupApply getGroupApply(long id);
	
	public List<GroupApply> getGroupAppliesByGID(long gid);
	
	public List<GroupApply> getGroupAppliesByUID(long uid);
	
}
