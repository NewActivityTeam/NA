package com.na.service;

import java.util.List;

import com.na.entity.Group;

public interface GroupService {

	public int createGroup(long aid,String groupname,String description,int maxcount);
	
	public int createGroup(long aid,long leader,String groupname,String description,int maxcount);
	
	public int updateGroup(long id,String groupname,String description,int maxcount);
	
	public int deleteGroip(long id);
	
	public Group getGroup(long id);
	
	public Group getGroupByAIDAndLeader(long aid,long leader);
	
	public List<Group> getGroupsByAID(long aid);
	
	public List<Group> getGroupsByUID(long uid);
	
	public List<Group> getGroupsByLeader(long leader);
	
	public List<Long> fastCreateGroups(long aid,int count,int nop);
	
	public int fastGroupResultHandle(long aid,boolean result,int fgc);
	
	public int updateGroupLeader(long gid,long newleader);
	
	
}
