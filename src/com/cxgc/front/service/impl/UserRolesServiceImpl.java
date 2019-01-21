package com.cxgc.front.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.UserRolesDao;
import com.cxgc.front.service.UserRolesService;

@Service
@Transactional
public class UserRolesServiceImpl implements UserRolesService{

	@Autowired
	private UserRolesDao dao;
	
	@Override
	public int deleteByUserId(Long userId) {
		return dao.deleteByUserId(userId);
	}

}
