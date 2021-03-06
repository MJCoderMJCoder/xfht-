package com.cxgc.front.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

@Entity
@Table(name = "t_fun_modular", catalog = "mysql")
public class FunctionModular {
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private FunctionModular personId;
	private String moduleName;
	private String moduleUrl;
	private String moduleCode;
	private String permissions;
	private Integer sort;
	private String imageUrl;
	private Set<FunctionModular> childs=new LinkedHashSet<FunctionModular>();  
	
	public FunctionModular() {
		// TODO Auto-generated constructor stub
	}
	
	public FunctionModular(Integer id, FunctionModular personId, String moduleName, String moduleUrl, String moduleCode,
			String permissions, Integer sort, String imageUrl, Set<FunctionModular> childs) {
		super();
		this.id = id;
		this.personId = personId;
		this.moduleName = moduleName;
		this.moduleUrl = moduleUrl;
		this.moduleCode = moduleCode;
		this.permissions = permissions;
		this.sort = sort;
		this.imageUrl = imageUrl;
		this.childs = childs;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false, length = 20)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)  
    @JoinColumn(name = "parent_id")  
	public FunctionModular getPersonId() {
		return personId;
	}

	public void setPersonId(FunctionModular personId) {
		this.personId = personId;
	}

	@Column(name = "module_name", length = 50)
	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	@Column(name = "module_url", length = 255)
	public String getModuleUrl() {
		return moduleUrl;
	}

	public void setModuleUrl(String moduleUrl) {
		this.moduleUrl = moduleUrl;
	}

	@Column(name = "module_code", length = 50)
	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	@Column(name = "permissions", length = 255)
	public String getPermissions() {
		return permissions;
	}

	public void setPermissions(String permissions) {
		this.permissions = permissions;
	}
	
	@Column(name = "image_url", length = 255)
	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@Column(name = "sort", length = 3)
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "personId", fetch = FetchType.EAGER)  
    @OrderBy("sort ASC") 
	public Set<FunctionModular> getChilds() {
		return childs;
	}

	public void setChilds(Set<FunctionModular> childs) {
		this.childs = childs;
	}

}
