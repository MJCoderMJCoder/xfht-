package com.cxgc.front.dao.impl;

import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.UserRolesDao;

@Repository
public class UserRolesDaoImpl extends BaseDao implements UserRolesDao{

	@Override
	public int deleteByUserId(Long userId) {
		int i = 0;
		try {
			String strUpdate = "delete from r_users_roles where user_id = " + userId;
			SQLQuery qu = getSession().createSQLQuery(strUpdate);
			i = qu.executeUpdate();
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

}
