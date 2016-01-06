package com.na.entity;

import java.sql.Timestamp;

/**
 * PCP entity. @author MyEclipse Persistence Tools
 */

public class PCP implements java.io.Serializable {

	// Fields

	private Long id;
	private Long uid;
	private Long aid;
	private Long groupid;
	private Timestamp createtime;
	private Float grade;

	// Constructors

	/** default constructor */
	public PCP() {
	}

	/** minimal constructor */
	public PCP(Long uid, Long aid, Timestamp createtime) {
		this.uid = uid;
		this.aid = aid;
		this.createtime = createtime;
	}

	/** full constructor */
	public PCP(Long uid, Long aid, Long groupid, Timestamp createtime,
			Float grade) {
		this.uid = uid;
		this.aid = aid;
		this.groupid = groupid;
		this.createtime = createtime;
		this.grade = grade;
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

	public Long getAid() {
		return this.aid;
	}

	public void setAid(Long aid) {
		this.aid = aid;
	}

	public Long getGroupid() {
		return this.groupid;
	}

	public void setGroupid(Long groupid) {
		this.groupid = groupid;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	public Float getGrade() {
		return this.grade;
	}

	public void setGrade(Float grade) {
		this.grade = grade;
	}
	
}