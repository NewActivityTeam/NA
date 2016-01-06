package com.na.entity;

import java.sql.Timestamp;

/**
 * GroupApply entity. @author MyEclipse Persistence Tools
 */

public class GroupApply implements java.io.Serializable {

	// Fields

	private Long id;
	private Long uid;
	private Long gid;
	private Integer state;
	private Timestamp createtime;

	// Constructors

	/** default constructor */
	public GroupApply() {
	}

	/** minimal constructor */
	public GroupApply(Long id, Long uid, Long gid, Integer state) {
		this.id = id;
		this.uid = uid;
		this.gid = gid;
		this.state = state;
	}

	/** full constructor */
	public GroupApply(Long id, Long uid, Long gid, Integer state,
			Timestamp createtime) {
		this.id = id;
		this.uid = uid;
		this.gid = gid;
		this.state = state;
		this.createtime = createtime;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUid() {
		return this.uid;
	}

	public void setUid(Long uid) {
		this.uid = uid;
	}

	public Long getGid() {
		return this.gid;
	}

	public void setGid(Long gid) {
		this.gid = gid;
	}

	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

}