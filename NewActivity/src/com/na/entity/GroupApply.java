package com.na.entity;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tb_group_apply")
public class GroupApply implements java.io.Serializable {

	// Fields

	private Long id;
	private Long uid;
	private Long gid;
	private Integer state;
	private Timestamp createtime;

	// Constructors

	/** default constructor */
	public GroupApply() {
	}

	/** minimal constructor */
	public GroupApply(Long uid, Long gid, Integer state) {
		this.uid = uid;
		this.gid = gid;
		this.state = state;
	}

	/** full constructor */
	public GroupApply(Long uid, Long gid, Integer state, Timestamp createtime) {
		this.uid = uid;
		this.gid = gid;
		this.state = state;
		this.createtime = createtime;
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

	@Column(name = "gid", nullable = false)
	public Long getGid() {
		return this.gid;
	}

	public void setGid(Long gid) {
		this.gid = gid;
	}

	@Column(name = "state", nullable = false)
	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Column(name = "createtime", length = 19)
	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

}