package com.na.entity;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Comment entity.
 */
@Entity
@Table(name = "tb_comment")
public class Comment implements java.io.Serializable {

	// Fields

	private Long id;
	private Long uid;
	private Long aid;
	private Timestamp createtime;
	private String content;

	// Constructors

	/** default constructor */
	public Comment() {
	}

	/** minimal constructor */
	public Comment(Long uid, Timestamp createtime) {
		this.uid = uid;
		this.createtime = createtime;
	}

	/** full constructor */
	public Comment(Long uid, Long aid, Timestamp createtime, String content) {
		this.uid = uid;
		this.aid = aid;
		this.createtime = createtime;
		this.content = content;
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

	@Column(name = "aid")
	public Long getAid() {
		return this.aid;
	}

	public void setAid(Long aid) {
		this.aid = aid;
	}

	@Column(name = "createtime", nullable = false, length = 19)
	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	@Column(name = "content", length = 2000)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}