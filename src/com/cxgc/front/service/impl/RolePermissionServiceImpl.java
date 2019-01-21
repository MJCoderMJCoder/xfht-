package com.cxgc.front.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.RolePermissionDao;
import com.cxgc.front.service.RolePermissionService;

@Service
@Transactional
public class RolePermissionServiceImpl implements RolePermissionService {

	@Autowired
	private RolePermissionDao dao;
	
	@Override
	public int deleteById(Long id) {
		return dao.deleteById(id);
	}

}
