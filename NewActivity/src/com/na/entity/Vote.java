package com.na.entity;

import java.sql.Timestamp;

/**
 * Vote entity. @author MyEclipse Persistence Tools
 */

public class Vote implements java.io.Serializable {

	// Fields

	private Long id;
	private String title;
	private String address;
	private Timestamp createtime;

	// Constructors

	/** default constructor */
	public Vote() {
	}

	/** full constructor */
	public Vote(String title, String address, Timestamp createtime) {
		this.title = title;
		this.address = address;
		this.createtime = createtime;
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

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

}