package com.na.entity;

/**
 * Assess entity. @author MyEclipse Persistence Tools
 */

public class Assess implements java.io.Serializable {

	// Fields

	private Long id;
	private Long uid;
	private Long aid;
	private Float grade;

	// Constructors

	/** default constructor */
	public Assess() {
	}

	/** full constructor */
	public Assess(Long id, Long uid, Long aid, Float grade) {
		this.id = id;
		this.uid = uid;
		this.aid = aid;
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

	public Float getGrade() {
		return this.grade;
	}

	public void setGrade(Float grade) {
		this.grade = grade;
	}

}