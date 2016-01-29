package com.na.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Userinfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_userinfo", catalog = "na")
public class Userinfo implements java.io.Serializable {

	// Fields

	private Long uid;
	private String ybaccount;
	private Integer authority;
	private String name;
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
	public Userinfo(Long uid) {
		this.uid = uid;
	}

	/** full constructor */
	public Userinfo(Long uid, String ybaccount, Integer authority, String name,
			Float height, Float weight, Integer age, Integer sex,
			String phonenumber, String email) {
		this.uid = uid;
		this.ybaccount = ybaccount;
		this.authority = authority;
		this.name = name;
		this.height = height;
		this.weight = weight;
		this.age = age;
		this.sex = sex;
		this.phonenumber = phonenumber;
		this.email = email;
	}

	// Property accessors
	@Id
	@Column(name = "uid", unique = true, nullable = false)
	public Long getUid() {
		return this.uid;
	}

	public void setUid(Long uid) {
		this.uid = uid;
	}

	@Column(name = "ybaccount")
	public String getYbaccount() {
		return this.ybaccount;
	}

	public void setYbaccount(String ybaccount) {
		this.ybaccount = ybaccount;
	}

	@Column(name = "authority")
	public Integer getAuthority() {
		return this.authority;
	}

	public void setAuthority(Integer authority) {
		this.authority = authority;
	}

	@Column(name = "name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "height", precision = 12, scale = 0)
	public Float getHeight() {
		return this.height;
	}

	public void setHeight(Float height) {
		this.height = height;
	}

	@Column(name = "weight", precision = 12, scale = 0)
	public Float getWeight() {
		return this.weight;
	}

	public void setWeight(Float weight) {
		this.weight = weight;
	}

	@Column(name = "age")
	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	@Column(name = "sex")
	public Integer getSex() {
		return this.sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	@Column(name = "phonenumber")
	public String getPhonenumber() {
		return this.phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	@Column(name = "email")
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}