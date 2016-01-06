package com.na.entity;

/**
 * Image entity. @author MyEclipse Persistence Tools
 */

public class Image implements java.io.Serializable {

	// Fields

	private Long id;
	private String address;
	private Long aid;
	private Integer index;

	// Constructors

	/** default constructor */
	public Image() {
	}

	/** full constructor */
	public Image(String address, Long aid, Integer index) {
		this.address = address;
		this.aid = aid;
		this.index = index;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Long getAid() {
		return this.aid;
	}

	public void setAid(Long aid) {
		this.aid = aid;
	}

	public Integer getIndex() {
		return this.index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}

}