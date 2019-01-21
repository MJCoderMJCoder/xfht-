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
import javax.persistence.Table;

@Entity
@Table(name = "t_role_modular", catalog = "mysql")
public class RoleModular {
	
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Role role;
	private FunctionModular functionModular;
	private Integer isuse;
	
	public RoleModular() {
		// TODO Auto-generated constructor stub
	}

	public RoleModular(Integer id, Role role, FunctionModular functionModular, Integer isuse) {
		super();
		this.id = id;
		this.role = role;
		this.functionModular = functionModular;
		this.isuse = isuse;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "roleid", nullable = false)
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@ManyToOne(fetch = FetchType.EAGER, targetEntity = FunctionModular.class)
	@JoinColumn(name = "mouid", nullable = false)
	public FunctionModular getFunctionModular() {
		return functionModular;
	}

	public void setFunctionModular(FunctionModular functionModular) {
		this.functionModular = functionModular;
	}


	@Column(name = "isuse")
	public Integer getIsuse() {
		return isuse;
	}

	public void setIsuse(Integer isuse) {
		this.isuse = isuse;
	}



	
	
}
