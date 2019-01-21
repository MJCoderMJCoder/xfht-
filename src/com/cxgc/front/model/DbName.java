package com.cxgc.front.model;

public class DbName {

	public  int id;
	public String createdate;
	public String des;
	public String ispublic;
	public String name;
	public String sort;
	
	public DbName()
	{}
	
	public DbName(int id, String createdate, String des, String ispublic, String name, String sort) {
		super();
		this.id = id;
		this.createdate = createdate;
		this.des = des;
		this.ispublic = ispublic;
		this.name = name;
		this.sort = sort;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getIspublic() {
		return ispublic;
	}
	public void setIspublic(String ispublic) {
		this.ispublic = ispublic;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	
}
