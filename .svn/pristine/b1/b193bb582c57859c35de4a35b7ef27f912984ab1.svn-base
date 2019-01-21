package com.cxgc.front.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.OrganizationalDao;
import com.cxgc.front.model.Organization;
import com.cxgc.front.service.OrganizationalService;

@Service
@Transactional
public class OrganizationalServiceImpl implements OrganizationalService {
	
	@Autowired
	private OrganizationalDao dao;

	@Override
	public List<Organization> getList(Integer parentId) {
		
		return dao.getList(parentId);
	}

	@Override
	public Organization findById(Integer id) {
		return dao.findById(id);
	}

	@Override
	public int update(Organization organization) {
		return dao.update(organization);
	}

	@Override
	public Organization save(Organization organization) {
		return dao.save(organization);
	}

	@Override
	public int deleteById(Integer id) {
		
		return dao.deleteById(id);
	}

	@Override
	public int getPageCount(Integer id, String name) {
		return dao.getPageCount(id, name);
	}

	@Override
	public List<Organization> getListByPage(Integer id, String name, int page, int size) {
		return dao.getListByPage(id, name, page, size);
	}

	@Override
	public int getChildPageCount() {
		return dao.getChildPageCount();
	}

	@Override
	public List<Organization> getChildListByPage(int page, int size) {
		return dao.getChildListByPage(page, size);
	}

	
	@Override
	public  List<Organization> getFlist()
	{
		DetachedCriteria dc = DetachedCriteria.forClass(Organization.class); 	
		dc.add(Restrictions.sqlRestriction(" parent_id is null "));
		return dao.getFlist(dc); 
		
	}
	
	
}
