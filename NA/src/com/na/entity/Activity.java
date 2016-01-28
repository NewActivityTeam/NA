package com.na.entity;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Activity entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_activity", catalog = "na")
public class Activity implements java.io.Serializable {

	// Fields

	private Long id;
	private String title;
	private String description;
	private Timestamp starttime;
	private Timestamp endtime;
	private Timestamp endsigntime;
	private String address;
	private Timestamp createtime;
	private String voteaddress;
	private Long manager;
	private String webAddress;
	private String mobileAddress;

	// Constructors

	/** default constructor */
	public Activity() {
	}

	/** minimal constructor */
	public Activity(String title, Timestamp createtime, Long manager) {
		this.title = title;
		this.createtime = createtime;
		this.manager = manager;
	}

	/** full constructor */
	public Activity(String title, String description, Timestamp starttime,
			Timestamp endtime, Timestamp endsigntime, String address,
			Timestamp createtime, String voteaddress, Long manager,
			String webAddress, String mobileAddress) {
		this.title = title;
		this.description = description;
		this.starttime = starttime;
		this.endtime = endtime;
		this.endsigntime = endsigntime;
		this.address = address;
		this.createtime = createtime;
		this.voteaddress = voteaddress;
		this.manager = manager;
		this.webAddress = webAddress;
		this.mobileAddress = mobileAddress;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "title", nullable = false, length = 40)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "description", length = 5000)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "starttime", length = 19)
	public Timestamp getStarttime() {
		return this.starttime;
	}

	public void setStarttime(Timestamp starttime) {
		this.starttime = starttime;
	}

	@Column(name = "endtime", length = 19)
	public Timestamp getEndtime() {
		return this.endtime;
	}

	public void setEndtime(Timestamp endtime) {
		this.endtime = endtime;
	}

	@Column(name = "endsigntime", length = 19)
	public Timestamp getEndsigntime() {
		return this.endsigntime;
	}

	public void setEndsigntime(Timestamp endsigntime) {
		this.endsigntime = endsigntime;
	}

	@Column(name = "address")
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "createtime", nullable = false, length = 19)
	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	@Column(name = "voteaddress")
	public String getVoteaddress() {
		return this.voteaddress;
	}

	public void setVoteaddress(String voteaddress) {
		this.voteaddress = voteaddress;
	}

	@Column(name = "manager", nullable = false)
	public Long getManager() {
		return this.manager;
	}

	public void setManager(Long manager) {
		this.manager = manager;
	}

	@Column(name = "web_address")
	public String getWebAddress() {
		return this.webAddress;
	}

	public void setWebAddress(String webAddress) {
		this.webAddress = webAddress;
	}

	@Column(name = "mobile_address")
	public String getMobileAddress() {
		return this.mobileAddress;
	}

	public void setMobileAddress(String mobileAddress) {
		this.mobileAddress = mobileAddress;
	}

}