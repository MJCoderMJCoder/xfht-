package com.cxgc.front.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.cxgc.front.model.Organization;

public interface OrganizationalDao {
	
	public List<Organization> getList(Integer parentId);
	
	public Organization findById(Integer id);
	
	public int update(Organization organization);
	
	public Organization save(Organization organization);

	public int deleteById(Integer id);
	
	public int getPageCount(Integer id, String name);
	
	public List<Organization> getListByPage(Integer id, String name, int page, int size);
	
 
	public  List<Organization> getFlist(DetachedCriteria dc);
	
 
	public int getChildPageCount();
	
	public List<Organization> getChildListByPage(int page, int size);
	
 
}
