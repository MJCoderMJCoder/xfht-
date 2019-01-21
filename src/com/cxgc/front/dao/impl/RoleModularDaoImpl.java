package com.cxgc.front.dao.impl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.RoleModularDao;
import com.cxgc.front.model.RoleModular;



@Repository
public class RoleModularDaoImpl  extends BaseDao implements RoleModularDao<Object> {

	@Override
	public int delete(RoleModular roleModular) {
		int i = 0;
		try {
			String strUpdate = "delete from t_role_modular where id = " + roleModular.getId();
			SQLQuery qu = getSession().createSQLQuery(strUpdate);
			i = qu.executeUpdate();
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

	@Override
	public int deleteBatch(List<RoleModular> roleModulars) {
		String ids = "";
		String con = "";
		if(roleModulars == null || roleModulars.size() <= 0){
			return 0;
		}
		for(RoleModular rm : roleModulars){
			ids += con + rm.getId();
			con = ",";
		}
		if(ids.length() <= 0 ){
			return 0;
		}
		int i = 0;
		try {
			String strUpdate = "delete from t_role_modular where id in ("+ids+")";
			SQLQuery qu = getSession().createSQLQuery(strUpdate);
			i = qu.executeUpdate();
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

	@Override
	public int deleteByRoleId(Integer roleId) {
		int i = 0;
		try {
			String strUpdate = "delete from t_role_modular where roleid = " + roleId;
			SQLQuery qu = getSession().createSQLQuery(strUpdate);
			i = qu.executeUpdate();
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

}
