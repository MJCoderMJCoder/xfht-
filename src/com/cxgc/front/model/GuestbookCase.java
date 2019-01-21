package com.cxgc.front.model;

import javax.persistence.Table;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/** 案件管理实体
 * @author Hit-Hitdy
 *
 */
@Entity
@Table(name = "jc_guestbook_case", catalog = "mysql")
public class GuestbookCase implements java.io.Serializable  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id; //主键
	private Integer learer; //主关联信访-取时间最早的信访案件
	private Integer follower;//关联案件
	
	public GuestbookCase(Integer id, Integer learer, Integer follower) {
		super();
		this.id = id;
		this.learer = learer;
		this.follower = follower;
	}

	public GuestbookCase() {
		// TODO Auto-generated constructor stub
	}
	
	
	@Id
	@GeneratedValue(strategy = IDENTITY) 
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "leader", length = 255)
	public Integer getLearer() {
		return learer;
	}

	public void setLearer(Integer learer) {
		this.learer = learer;
	}

	@Column(name = "follower", length = 255)
	public Integer getFollower() {
		return follower;
	}

	public void setFollower(Integer follower) {
		this.follower = follower;
	}
	
	
	
	
}
