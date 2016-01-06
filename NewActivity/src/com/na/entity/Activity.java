package com.na.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Activity entity. @author MyEclipse Persistence Tools
 */

public class Activity implements java.io.Serializable {

	// Fields

	private Long id;
	private String title;
	private String description;
	private Timestamp starttime;
	private Timestamp endtime;
	private Timestamp createtime;
	private String manager;
	private Float grade;
	private String webAddress;
	private String mobileAddress;
	private Set comments = new HashSet(0);

	// Constructors

	/** default constructor */
	public Activity() {
	}

	/** minimal constructor */
	public Activity(String title, Timestamp createtime, String manager) {
		this.title = title;
		this.createtime = createtime;
		this.manager = manager;
	}

	/** full constructor */
	public Activity(String title, String description, Timestamp starttime,
			Timestamp endtime, Timestamp createtime, String manager,
			Float grade, String webAddress, String mobileAddress, Set comments) {
		this.title = title;
		this.description = description;
		this.starttime = starttime;
		this.endtime = endtime;
		this.createtime = createtime;
		this.manager = manager;
		this.grade = grade;
		this.webAddress = webAddress;
		this.mobileAddress = mobileAddress;
		this.comments = comments;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getStarttime() {
		return this.starttime;
	}

	public void setStarttime(Timestamp starttime) {
		this.starttime = starttime;
	}

	public Timestamp getEndtime() {
		return this.endtime;
	}

	public void setEndtime(Timestamp endtime) {
		this.endtime = endtime;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	public String getManager() {
		return this.manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public Float getGrade() {
		return this.grade;
	}

	public void setGrade(Float grade) {
		this.grade = grade;
	}

	public String getWebAddress() {
		return this.webAddress;
	}

	public void setWebAddress(String webAddress) {
		this.webAddress = webAddress;
	}

	public String getMobileAddress() {
		return this.mobileAddress;
	}

	public void setMobileAddress(String mobileAddress) {
		this.mobileAddress = mobileAddress;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

}