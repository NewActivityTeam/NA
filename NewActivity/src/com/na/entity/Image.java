package com.na.entity;

/**
 * Image entity. @author MyEclipse Persistence Tools
 */

public class Image implements java.io.Serializable {

	// Fields

	private Long id;
	private String address;

	// Constructors

	/** default constructor */
	public Image() {
	}

	/** full constructor */
	public Image(String address) {
		this.address = address;
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

}