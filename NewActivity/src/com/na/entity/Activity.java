package com.na.entity;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Activity entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_activity")
public class Activity implements java.io.Serializable {

	// Fields

	private Long id;
	private String title;
	private String description;
	private Timestamp starttime;
	private Timestamp endtime;
	private Timestamp createtime;
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
			Timestamp endtime, Timestamp createtime, Long manager,
			String webAddress, String mobileAddress) {
		this.title = title;
		this.description = description;
		this.starttime = starttime;
		this.endtime = endtime;
		this.createtime = createtime;
		this.manager = manager;
		this.webAddress = webAddress;
		this.mobileAddress = mobileAddress;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
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

	@Column(name = "createtime", nullable = false, length = 19)
	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
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