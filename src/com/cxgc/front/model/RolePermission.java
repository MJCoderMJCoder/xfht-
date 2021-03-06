package com.cxgc.front.model;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "role_permission", catalog = "mysql")
public class RolePermission implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Role role;//角色ID
	private String modular_url;//模块路径
	private String modular_qx;//模块权限
	private int modular_id;//模块ID
	
	public RolePermission() {
	}

	public RolePermission(Long id, Role role, String modular_url, String modular_qx,int modular_id) {
		super();
		this.id = id;
		this.role = role;
		this.modular_url = modular_url;
		this.modular_qx = modular_qx;
		this.modular_id = modular_id;
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

	@ManyToOne(cascade=CascadeType.REFRESH,optional=false,fetch = FetchType.LAZY) 
	@JoinColumn(name = "role_id")   
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}


	@Column(name = "modular_url", length = 255)
	public String getModularUrl() {
		return modular_url;
	}

	public void setModularUrl(String modular_url) {
		this.modular_url = modular_url;
	}

	@Column(name = "modular_qx", length = 255)
	public String getModularQx() {
		return modular_qx;
	}

	public void setModularQx(String modular_qx) {
		this.modular_qx = modular_qx;
	}
	
	@Column(name = "modular_id", length = 10)
	public int getModularId() {
		return modular_id;
	}

	public void setModularId(int modular_id) {
		this.modular_id = modular_id;
	}
}
