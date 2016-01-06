package com.na.entity;

/**
 * Group entity. @author MyEclipse Persistence Tools
 */

public class Group implements java.io.Serializable {

	// Fields

	private Long id;
	private Long aid;
	private String groupname;
	private String description;
	private Long leader;
	private Integer maxcount;

	// Constructors

	/** default constructor */
	public Group() {
	}

	/** minimal constructor */
	public Group(Long id, Long leader, Integer maxcount) {
		this.id = id;
		this.leader = leader;
		this.maxcount = maxcount;
	}

	/** full constructor */
	public Group(Long id, Long aid, String groupname, String description,
			Long leader, Integer maxcount) {
		this.id = id;
		this.aid = aid;
		this.groupname = groupname;
		this.description = description;
		this.leader = leader;
		this.maxcount = maxcount;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getAid() {
		return this.aid;
	}

	public void setAid(Long aid) {
		this.aid = aid;
	}

	public String getGroupname() {
		return this.groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getLeader() {
		return this.leader;
	}

	public void setLeader(Long leader) {
		this.leader = leader;
	}

	public Integer getMaxcount() {
		return this.maxcount;
	}

	public void setMaxcount(Integer maxcount) {
		this.maxcount = maxcount;
	}

}