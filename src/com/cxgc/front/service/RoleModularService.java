package com.cxgc.front.service;

import java.util.List;

import com.cxgc.front.model.RoleModular;

public interface RoleModularService {
	
	public int delete(RoleModular roleModular);
	
	public int deleteBatch(List<RoleModular> roleModulars);

	public int deleteByRoleId(Integer roleId);
}
