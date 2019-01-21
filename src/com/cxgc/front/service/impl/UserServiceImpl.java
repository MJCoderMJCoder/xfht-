package com.cxgc.front.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.UserDao;
import com.cxgc.front.model.User;
import com.cxgc.front.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;
	
	@Override
	public List<Object[]> loginCheck(String username, String password) {
		return dao.loginCheck(username, password);
	}
	
	@Override
	public List<Object[]> search(String username, Long organizationid, Long roleid) {
		return dao.search(username, organizationid, roleid);
	}

	@Override
	public List<Object[]> page(String s_username,String s_description,String s_IDNumber,String s_sex, Long organizationid, Long roleid, 
			int pageNumStart, int pageRecord) {
		return dao.page(s_username,s_description,s_IDNumber,s_sex, organizationid, roleid, pageNumStart, pageRecord);
	}
	
	@Override
	public List<Object[]> findAll() {
		return dao.findAll();
	}

	@Override
	public User findById(Integer id) {
		return dao.findById(id);
	}

	@Override
	public int deleteById(Long id) {
		return dao.deleteById(id);
	}

	@Override
	public int update(Long id, String description, String email, Boolean enabled, 
			Integer issystemaccount, Date lastlogin, String password, String telephone, 
			String username, Long organization, Long role) {
		return dao.update(id, description, email, enabled, issystemaccount, lastlogin, password, 
				telephone, username, organization, role);
	}

	@Override
	public List<User> getList(String username, String IDNumber,Long id) {
		return dao.getList(username, IDNumber,id);
	}
	
	@Override
	public User save(User user) {
		return dao.save(user);
	}
	
	@Override
	public int update(User user) {
		return dao.update(user);
	}

	@Override
	public User getUserById(Long id) {
		return dao.getUserById(id);
	}
	
	@Override
	public List<User> getListByPage(String description, String username, String IDNumber, Integer sex, String telephone,
			Integer roleid, Integer organizationid, int page, int size) {
		return dao.getListByPage(description,username,IDNumber,sex, telephone,roleid,organizationid,page, size);
	}

	@Override
	public int getPageCount(String description, String username, String IDNumber, Integer sex, String telephone,
			Integer roleid, Integer organizationid) {
		return dao.getPageCount(description,username,IDNumber,sex, telephone,roleid,organizationid);
	}

	@Override
	public List<User> getListByOrganizational(Integer organizationid) {
		return dao.getListByOrganizational(organizationid);
	}
}
