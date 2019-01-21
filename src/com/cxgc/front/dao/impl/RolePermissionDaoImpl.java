package com.cxgc.front.dao.impl;

import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.RolePermissionDao;

@Repository
public class RolePermissionDaoImpl extends BaseDao implements RolePermissionDao {

	@Override
	public int deleteById(Long id) {
		int i = 0;
		try {
			String strUpdate = "delete from role_permission where role_id = " + id;
			SQLQuery qu = getSession().createSQLQuery(strUpdate);
			i = qu.executeUpdate();
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

}
