package com.na.entity;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * PCP entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_participation")
public class PCP implements java.io.Serializable {

	// Fields

	private Long id;
	private Long uid;
	private Long aid;
	private Long groupid;
	private Timestamp createtime;
	private Float grade;

	// Constructors

	/** default constructor */
	public PCP() {
	}

	/** minimal constructor */
	public PCP(Long uid, Long aid, Timestamp createtime) {
		this.uid = uid;
		this.aid = aid;
		this.createtime = createtime;
	}

	/** full constructor */
	public PCP(Long uid, Long aid, Long groupid, Timestamp createtime,
			Float grade) {
		this.uid = uid;
		this.aid = aid;
		this.groupid = groupid;
		this.createtime = createtime;
		this.grade = grade;
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

	@Column(name = "uid", nullable = false)
	public Long getUid() {
		return this.uid;
	}

	public void setUid(Long uid) {
		this.uid = uid;
	}

	@Column(name = "aid", nullable = false)
	public Long getAid() {
		return this.aid;
	}

	public void setAid(Long aid) {
		this.aid = aid;
	}

	@Column(name = "groupid")
	public Long getGroupid() {
		return this.groupid;
	}

	public void setGroupid(Long groupid) {
		this.groupid = groupid;
	}

	@Column(name = "createtime", nullable = false, length = 19)
	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	@Column(name = "grade", precision = 12, scale = 0)
	public Float getGrade() {
		return this.grade;
	}

	public void setGrade(Float grade) {
		this.grade = grade;
	}

}