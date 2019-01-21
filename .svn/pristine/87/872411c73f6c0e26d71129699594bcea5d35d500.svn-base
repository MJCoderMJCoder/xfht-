package com.cxgc.front.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.RoleDao;
import com.cxgc.front.model.Role;
import com.cxgc.front.model.User;
import com.cxgc.front.service.RoleService;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDao dao;
	
	@Override
	public List<Role> findAll() {
		return dao.findAll();
	}
	
	@Override
	public Role findById(long id) {
		return dao.findById(id);
	}

	@Override
	public Role save(Role role) {
		return dao.save(role);
	}
	
	@Override
	public void update(Role role) {
		dao.update(role);
	}
	
	@Override
	public int deleteById(Integer id) {
		return dao.deleteById(id);
	}

	@Override
	public List<Role> searchByPage(String name, int pageNumStart, int pageRecord) {
		return dao.searchByPage(name, pageNumStart, pageRecord);
	}

	@Override
	public int getCount(String name) {
		return dao.getCount(name);
	}

	@Override
	public List<Role> getList(String roleName,Long id) {
		return dao.getList(roleName, id);
	}
	
}
