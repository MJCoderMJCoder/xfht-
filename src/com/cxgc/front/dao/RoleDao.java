package com.cxgc.front.dao;

import java.util.List;

import com.cxgc.front.model.Role;

public interface RoleDao {
	
	public List<Role> findAll();
	
	public Role findById(long id);

	public List<Role> searchByPage(String name, int pageNumStart, int pageRecord);
	
	public int getCount(String name);
	
	public Role save(Role role);
	
	public void update(Role role);
	
	public int deleteById(Integer id);
	
	public List<Role> getList(String roleName,Long id);
}
