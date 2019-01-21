package com.cxgc.front.model;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "t_modular", catalog = "mysql")
public class Modular {
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int parentId;
	private String Modulename;
	private String Moduleurl;
	private String Modulecode;
	private String permissions;
	private int sort;
	private String Imageurl;
	
	
	
	
	public Modular() {
		// TODO Auto-generated constructor stub
	}
	
	public Modular(int parentId,String Modulename,String Moduleurl,String Modulecode,String permissions,int sort,String Imageurl) {
		this.parentId = parentId;
		this.Modulename = Modulename;
		this.Moduleurl = Moduleurl;
		this.Modulecode = Modulecode;
		this.permissions = permissions;
		this.sort = sort;
		this.Imageurl = Imageurl;
	}
	
	
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false, length = 20)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "parentId", length = 20)
	public int getparentId() {
		return parentId;
	}

	public void setparentId(int parentId) {
		this.parentId = parentId;
	}
	
	@Column(name = "Modulename", length = 50)
	public String getModulename() {
		return Modulename;
	}

	public void setModulename(String Modulename) {
		this.Modulename = Modulename;
	}

	@Column(name = "Moduleurl", length = 255)
	public String getModuleurl() {
		return Moduleurl;
	}

	public void setModuleurl(String Moduleurl) {
		this.Moduleurl = Moduleurl;
	}

	@Column(name = "Modulecode", length = 50)
	public String getModulecode() {
		return Modulecode;
	}

	public void setModulecode(String Modulecode) {
		this.Modulecode = Modulecode;
	}

	@Column(name = "permissions", length = 255)
	public String getpermissions() {
		return permissions;
	}

	public void setpermissions(String permissions) {
		this.permissions = permissions;
	}
	
	@Column(name = "sort",length = 20)
	public int getsort() {
		return sort;
	}

	public void setsort(int sort) {
		this.sort = sort;
	}
	
	@Column(name = "Imageurl", length = 255)
	public String getImageurl() {
		return Imageurl;
	}

	public void setImageurl(String Imageurl) {
		this.Imageurl = Imageurl;
	}
	
}
