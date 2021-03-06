package com.cxgc.front.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "t_organization", catalog = "mysql")
public class Organization implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;//主键ID
	private Integer sort;//状态
	private String path;//父级路径
	private String code;//编码
	private String contact;//联系方式
	private String ext;//描述
	private String manager;//负责人
	private String name;//名称
	private Integer parentid;//父级ID
	private Date createTime;//创建时间
	private Boolean insystem;//是否系统内部门
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false, length = 11)
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "sort", length = 11)
	public Integer getSort() {
		return sort;
	}
	
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
	@Column(name = "path", length = 255)
	public String getPath() {
		return path;
	}
	
	public void setPath(String path) {
		this.path = path;
	}
	
	@Column(name = "code", length = 255)
	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
	
	@Column(name = "contact", length = 255)
	public String getContact() {
		return contact;
	}
	
	public void setContact(String contact) {
		this.contact = contact;
	}
	
	@Column(name = "ext", length = 0)
	public String getExt() {
		return ext;
	}
	
	public void setExt(String ext) {
		this.ext = ext;
	}
	
	@Column(name = "manager", length = 255)
	public String getManager() {
		return manager;
	}
	
	public void setManager(String manager) {
		this.manager = manager;
	}
	
	@Column(name = "name", length = 255)
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "parent_id", length = 11)
	public Integer getParentid() {
		return parentid;
	}
	
	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	@Column(name = "createTime")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Column(name = "insystem")
	public Boolean getInsystem() {
		return insystem;
	}

	public void setInsystem(Boolean insystem) {
		this.insystem = insystem;
	}


}
