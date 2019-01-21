package com.cxgc.front.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.RoleModularDao;
import com.cxgc.front.model.RoleModular;
import com.cxgc.front.service.RoleModularService;


 
@Service
@Transactional
public class RoleModularServiceImpl implements RoleModularService {

	@Autowired
	public RoleModularDao dao;

	@Override
	public int delete(RoleModular roleModular) {
		return dao.delete(roleModular);
	}

	@Override
	public int deleteBatch(List<RoleModular> roleModulars) {
		return dao.deleteBatch(roleModulars);
	}

	@Override
	public int deleteByRoleId(Integer roleId) {
		return dao.deleteByRoleId(roleId);
	}
	
}
