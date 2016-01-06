package com.na.entity;

/**
 * Userinfo entity. @author MyEclipse Persistence Tools
 */

public class Userinfo implements java.io.Serializable {

	// Fields

	private Long uid;
	private String ybaccount;
	private Integer authority;
	private Float height;
	private Float weight;
	private Integer age;
	private Integer sex;
	private String phonenumber;
	private String email;

	// Constructors

	/** default constructor */
	public Userinfo() {
	}

	/** minimal constructor */
	public Userinfo(String ybaccount, Integer authority) {
		this.ybaccount = ybaccount;
		this.authority = authority;
	}

	/** full constructor */
	public Userinfo(String ybaccount, Integer authority, Float height,
			Float weight, Integer age, Integer sex, String phonenumber,
			String email) {
		this.ybaccount = ybaccount;
		this.authority = authority;
		this.height = height;
		this.weight = weight;
		this.age = age;
		this.sex = sex;
		this.phonenumber = phonenumber;
		this.email = email;
	}

	// Property accessors

	public Long getUid() {
		return this.uid;
	}

	public void setUid(Long uid) {
		this.uid = uid;
	}

	public String getYbaccount() {
		return this.ybaccount;
	}

	public void setYbaccount(String ybaccount) {
		this.ybaccount = ybaccount;
	}

	public Integer getAuthority() {
		return this.authority;
	}

	public void setAuthority(Integer authority) {
		this.authority = authority;
	}

	public Float getHeight() {
		return this.height;
	}

	public void setHeight(Float height) {
		this.height = height;
	}

	public Float getWeight() {
		return this.weight;
	}

	public void setWeight(Float weight) {
		this.weight = weight;
	}

	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getSex() {
		return this.sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getPhonenumber() {
		return this.phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}