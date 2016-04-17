package com.na.entity.nodb;

import com.na.entity.Activity;
import com.na.entity.Group;
import com.na.entity.PCP;

public class ReturnMyActivity {
	Activity activity;
	PCP pcp;
	Group group;
	boolean comment;
	public boolean isComment() {
		return comment;
	}
	public void setComment(boolean comment) {
		this.comment = comment;
	}
	public Activity getActivity() {
		return activity;
	}
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	public PCP getPcp() {
		return pcp;
	}
	public void setPcp(PCP pcp) {
		this.pcp = pcp;
	}
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}
}
