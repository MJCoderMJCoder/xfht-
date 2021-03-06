package com.cxgc.front.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

@Entity
@Table(name = "role", catalog = "mysql")
public class Role implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String roleName;
	private Date lastModifyTime;
	private String ip;
	private String describes;
	private Set<RolePermission> rolePermissions;
	private List<RoleModular> roleModulars;
	
	public Role() {
	}

	public Role(Long id, String roleName, Date lastModifyTime, String ip,String describes) {
		super();
		this.id = id;
		this.roleName = roleName;
		this.lastModifyTime = lastModifyTime;
		this.ip = ip;
		this.describes = describes;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false, length = 20)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "role_name", length = 255)
	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	@Column(name = "last_modify_time")
	public Date getLastModifyTime() {
		return lastModifyTime;
	}

	public void setLastModifyTime(Date lastModifyTime) {
		this.lastModifyTime = lastModifyTime;
	}

	@Column(name = "ip", length = 255)
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Column(name = "describes", length = 255)
	public String getdescribe() {
		return describes;
	}

	public void setdescribe(String describes) {
		this.describes = describes;
	}

	@OneToMany(targetEntity=RolePermission.class, mappedBy="role", cascade=CascadeType.ALL, fetch = FetchType.EAGER)  
    @OrderBy("role_id ASC") 
	public Set<RolePermission> getRolePermissions() {
		return rolePermissions;
	}

	public void setRolePermissions(Set<RolePermission> rolePermissions) {
		this.rolePermissions = rolePermissions;
	}

	@OneToMany(targetEntity=RoleModular.class, mappedBy="role", cascade=CascadeType.ALL, fetch = FetchType.EAGER)  
    @OrderBy("mouid ASC") 
	public List<RoleModular> getRoleModulars() {
		return roleModulars;
	}

	public void setRoleModulars(List<RoleModular> roleModulars) {
		this.roleModulars = roleModulars;
	}
	
	

}
