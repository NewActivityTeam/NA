package com.na.service;

import java.util.List;

import com.na.entity.Group;

public interface GroupService {

	public int createGroup(long aid,String groupname,String description,int maxcount);
	
	public int updateGroup(long id,String groupname,String description,int maxcount);
	
	public int deleteGroip(long id);
	
	public Group getGroup(long id);
	
	public List<Group> getGroupsByAID(long aid);
	
	public List<Group> getGroupsByUID(long uid);
	
	public List<Long> fastCreateGroups(long aid,int count,int nop);
	
	public int fastGroupResultHandle(long aid,boolean result);
	
}
