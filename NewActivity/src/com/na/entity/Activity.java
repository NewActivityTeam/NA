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
	private String content;
	private Timestamp starttime;
	private Timestamp endtime;
	private Timestamp endsigntime;
	private Timestamp createtime;
	private Long manager;
	private String voteaddress;
	private String webAddress;
	private String mobileAddress;
	private String address;

	// Constructors

	/** default constructor */
	public Activity() {
	}

	/** minimal constructor */
	public Activity(String title, Timestamp createtime) {
		this.title = title;
		this.createtime = createtime;
	}

	/** full constructor */
	public Activity(String title, String content, Timestamp starttime,
			Timestamp endtime, Timestamp endsigntime, Timestamp createtime,
			Long manager, String voteaddress, String webAddress,
			String mobileAddress, String address) {
		this.title = title;
		this.content = content;
		this.starttime = starttime;
		this.endtime = endtime;
		this.endsigntime = endsigntime;
		this.createtime = createtime;
		this.manager = manager;
		this.voteaddress = voteaddress;
		this.webAddress = webAddress;
		this.mobileAddress = mobileAddress;
		this.address = address;
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

	@Column(name = "content", length = 5000)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
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

	@Column(name = "createtime", nullable = false, length = 19)
	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	@Column(name = "manager")
	public Long getManager() {
		return this.manager;
	}

	public void setManager(Long manager) {
		this.manager = manager;
	}

	@Column(name = "voteaddress")
	public String getVoteaddress() {
		return this.voteaddress;
	}

	public void setVoteaddress(String voteaddress) {
		this.voteaddress = voteaddress;
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

	@Column(name = "address")
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}