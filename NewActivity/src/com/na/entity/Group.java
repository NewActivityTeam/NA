package com.na.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tb_group")
public class Group implements java.io.Serializable {

	// Fields

	private Long id;
	private Long aid;
	private String groupname;
	private String description;
	private Long leader;
	private Integer maxcount;

	// Constructors

	/** default constructor */
	public Group() {
	}

	/** minimal constructor */
	public Group(Long aid) {
		this.aid = aid;
	}

	/** full constructor */
	public Group(Long aid, String groupname, String description, Long leader,
			Integer maxcount) {
		this.aid = aid;
		this.groupname = groupname;
		this.description = description;
		this.leader = leader;
		this.maxcount = maxcount;
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

	@Column(name = "aid", nullable = false)
	public Long getAid() {
		return this.aid;
	}

	public void setAid(Long aid) {
		this.aid = aid;
	}

	@Column(name = "groupname")
	public String getGroupname() {
		return this.groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "leader")
	public Long getLeader() {
		return this.leader;
	}

	public void setLeader(Long leader) {
		this.leader = leader;
	}

	@Column(name = "maxcount")
	public Integer getMaxcount() {
		return this.maxcount;
	}

	public void setMaxcount(Integer maxcount) {
		this.maxcount = maxcount;
	}

}