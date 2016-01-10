package com.na.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Image entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_image")
public class Image implements java.io.Serializable {

	// Fields

	private Long id;
	private String address;
	private Long aid;
	private Integer index;

	// Constructors

	/** default constructor */
	public Image() {
	}

	/** full constructor */
	public Image(String address, Long aid, Integer index) {
		this.address = address;
		this.aid = aid;
		this.index = index;
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

	@Column(name = "address", length = 500)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "aid")
	public Long getAid() {
		return this.aid;
	}

	public void setAid(Long aid) {
		this.aid = aid;
	}

	@Column(name = "index")
	public Integer getIndex() {
		return this.index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}

}