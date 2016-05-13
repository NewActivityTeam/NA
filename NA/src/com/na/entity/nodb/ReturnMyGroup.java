package com.na.entity.nodb;

public class ReturnMyGroup {
	long id;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	String title;
	String leader;
	String groupname;
	int number;
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLeader() {
		return leader;
	}
	public void setLeader(String leader) {
		this.leader = leader;
	}
	public String getGroupname() {
		return groupname;
	}
	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
	
}
