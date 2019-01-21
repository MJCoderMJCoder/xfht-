package com.cxgc.front.model;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "jc_guestbook_ctg", catalog = "mysql")
public class GuestbookCtg implements java.io.Serializable {
	
	private Integer id;
	private Integer siteId = 1;
	private String name;//名称
	private Integer priority;//排序
	private String description;//描述
	private Boolean isSynchronization;//是否同步
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "guestbookctg_id", unique = true, nullable = false, length = 11)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "site_id", length = 11, nullable=false)
	public Integer getSiteId() {
		return siteId;
	}

	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}
	
	@Column(name = "ctg_name", length = 100, nullable=false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "priority", length = 11, nullable=false)
	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	@Column(name = "description", length = 255)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "is_synchronization", nullable=false)
	public Boolean getIsSynchronization() {
		return isSynchronization;
	}

	public void setIsSynchronization(Boolean isSynchronization) {
		this.isSynchronization = isSynchronization;
	}
	
}
