package com.na.entity.nodb;

import java.util.List;

import javax.persistence.Entity;

import com.na.entity.Userinfo;

public class ReturnInfo{
	String groupName;
	List<Userinfo> members;
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public List<Userinfo> getMembers() {
		return members;
	}
	public void setMembers(List<Userinfo> members) {
		this.members = members;
	}
	
}