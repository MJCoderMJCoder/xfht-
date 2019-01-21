package com.cxgc.front.dao;

import java.util.List;

import com.cxgc.front.model.RoleModular;

public interface RoleModularDao<T> {

	public int delete(RoleModular roleModular);
	
	public int deleteBatch(List<RoleModular> roleModulars);
	
	public int deleteByRoleId(Integer roleId);
	
}
