package com.na.entity.nodb;

import com.na.entity.GroupApply;
import com.na.entity.Userinfo;

public class GroupApplyInfo {

	public GroupApply groupApply;
	public Userinfo userinfo;
	public GroupApply getGroupApply() {
		return groupApply;
	}
	public void setGroupApply(GroupApply groupApply) {
		this.groupApply = groupApply;
	}
	public Userinfo getUserinfo() {
		return userinfo;
	}
	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}
	
}
