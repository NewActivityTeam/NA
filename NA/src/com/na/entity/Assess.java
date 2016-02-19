package com.na.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Assess entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_assess")
public class Assess implements java.io.Serializable {

	// Fields

	private Long id;
	private Long uid;
	private Long aid;
	private Float grade;
	private String comment;
	private String imageurl;

	// Constructors

	/** default constructor */
	public Assess() {
	}

	/** minimal constructor */
	public Assess(Long uid, Long aid, Float grade) {
		this.uid = uid;
		this.aid = aid;
		this.grade = grade;
	}

	/** full constructor */
	public Assess(Long uid, Long aid, Float grade, String comment,
			String imageurl) {
		this.uid = uid;
		this.aid = aid;
		this.grade = grade;
		this.comment = comment;
		this.imageurl = imageurl;
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

	@Column(name = "grade", nullable = false, precision = 12, scale = 0)
	public Float getGrade() {
		return this.grade;
	}

	public void setGrade(Float grade) {
		this.grade = grade;
	}

	@Column(name = "comment", length = 500)
	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Column(name = "imageurl", length = 500)
	public String getImageurl() {
		return this.imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

}