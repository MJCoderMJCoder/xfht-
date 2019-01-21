package com.cxgc.front.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "t_facedb", catalog = "mysql")
public class FaceDB {
	
	private Long id;
	
	private Date createDate;
	
	private Date LastModifyDate;
	
	private String description;
	
	private Boolean isPublic;
	
	private String name;
	
	private Integer sort;
	
	private Dictionary type;
	
	private Long createById;
	
	private Long lastModifyById;
	
	private Long icon_id;

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false, length = 20)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "create_date")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "last_modify_date")
	public Date getLastModifyDate() {
		return LastModifyDate;
	}

	public void setLastModifyDate(Date lastModifyDate) {
		LastModifyDate = lastModifyDate;
	}

	@Column(name = "description", length = 255)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "is_public", length = 1)
	public Boolean getIsPublic() {
		return isPublic;
	}

	public void setIsPublic(Boolean isPublic) {
		this.isPublic = isPublic;
	}

	@Column(name = "name", length = 45)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "sort", length = 11)
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	@ManyToOne(fetch = FetchType.LAZY, targetEntity = Dictionary.class)  
	@JoinColumn(name = "type")
	public Dictionary getType() {
		return type;
	}

	public void setType(Dictionary type) {
		this.type = type;
	}
	

	@Column(name = "create_by_id", length = 20)
	public Long getCreateById() {
		return createById;
	}

	public void setCreateById(Long createById) {
		this.createById = createById;
	}

	@Column(name = "last_modify_by_id", length = 20)
	public Long getLastModifyById() {
		return lastModifyById;
	}

	public void setLastModifyById(Long lastModifyById) {
		this.lastModifyById = lastModifyById;
	}

	@Column(name = "icon_id", length = 20)
	public Long getIcon_id() {
		return icon_id;
	}

	public void setIcon_id(Long icon_id) {
		this.icon_id = icon_id;
	}
	
}
