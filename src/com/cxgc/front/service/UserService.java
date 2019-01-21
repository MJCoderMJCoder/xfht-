package com.cxgc.front.service;

import java.util.Date;
import java.util.List;

import com.cxgc.front.model.User;

public interface UserService {
	
	public List<Object[]> loginCheck(String username, String password);
	
	public List<Object[]> search(String username, Long organizationid, Long roleid);
	
	public List<Object[]> page(String s_username,String s_description,String s_IDNumber,String s_sex, Long organizationid, Long roleid, 
			int pageNumStart, int pageRecord);
	
	public List<Object[]> findAll();
	
	public User findById(Integer id);
	
	public int deleteById(Long id);
	
	public int update(Long id, String description, String email, Boolean enabled, 
			Integer issystemaccount, Date lastlogin, String password, String telephone, 
			String username, Long organization, Long role);

	public List<User> getList(String username, String IDNumber,Long id);
	
	public User save(User user);
	
	public int update(User user);
	
	public User getUserById(Long id);
	
	public List<User> getListByPage(String description,String username,String IDNumber,Integer sex, String telephone,Integer roleid,Integer organizationid,int page,int size);

	public int getPageCount(String description,String username,String IDNumber,Integer sex, String telephone,Integer roleid,Integer organizationid);
	
	public List<User> getListByOrganizational(Integer organizationid);

}
