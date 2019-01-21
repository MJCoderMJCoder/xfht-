package com.cxgc.front.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.RoleDao;
import com.cxgc.front.model.Role;
import com.cxgc.front.model.User;
import com.cxgc.front.util.DateUtils;

@Repository
public class RoleDaoImpl extends BaseDao implements RoleDao {
	
	@Override
	public List<Role> findAll() {
		try { 
			StringBuffer hql = new StringBuffer("from Role bean ");
			hql.append(" order by bean.id asc");
			Query query = getSession().createQuery(hql.toString());
			List<Role> list = query.list();
			return list;
		} catch (RuntimeException re) {
			return null;
		}
	}

	@Override
	public Role findById(long id) {
		try { 
			StringBuffer hql = new StringBuffer("from Role bean where id="+id);
			hql.append(" order by bean.id asc");
			Query query = getSession().createQuery(hql.toString());
			List<Role> list = query.list();
			if(list != null && list.size() > 0){
				return list.get(0);
			}
		} catch (RuntimeException re) {
			return null;
		}
		return null;
	}

	@Override
	public Role save(Role role) {
		//Long i = 0L;
		getSession().save(role);
		return role;
	}

	@Override
	public void update(Role role) {
		getSession().update(role);
	}
	
	@Override
	public int deleteById(Integer id) {
		int i = 0;
		try {
			String strUpdate = "delete from role where id = " + id;
			SQLQuery qu = getSession().createSQLQuery(strUpdate);
			i = qu.executeUpdate();
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

	@Override
	public List<Role> searchByPage(String name ,int pageNumStart , int pageRecord) {
		try { 
			StringBuffer hql = new StringBuffer("from Role bean where 1=1 ");
			if(name != null && !"".equals(name)){
				hql.append(" and bean.roleName like '%" + name + "%'");
			}
			hql.append(" order by bean.id asc");
			Query query = getSession().createQuery(hql.toString()).setFirstResult((pageNumStart - 1) * pageRecord ).setMaxResults(pageRecord);
			//Query query = getSession().createQuery(hql.toString()).setFirstResult(pageNumStart).setMaxResults(pageRecord);
			List<Role> list = query.list();
			return list;
		} catch (RuntimeException re) {
			return null;
		}
	}
	
	@Override
	public int getCount(String name) {
		StringBuilder sqlBuilder = new StringBuilder();
		sqlBuilder.append("select count(r.id) from role r  where 1=1 ");
		if(name != null && !"".equals(name)){
			sqlBuilder.append(" and r.role_name like '%" + name + "%'");
		}
		
		List<Object> objs = getSession().createSQLQuery(sqlBuilder.toString()).list();
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		return 0;
	}
	
	@Override
	public List<Role> getList(String roleName,Long id) {
		StringBuffer hql = new StringBuffer("from Role bean where 1=1 ");
		if(roleName != null && !"".equals(roleName)){
			hql.append(" and bean.roleName = '" + roleName + "'");
		}
		if(id>0){
			hql.append(" and bean.id <> " + id + "");	
		}
		hql.append(" order by bean.id asc");
		Query query = getSession().createQuery(hql.toString());
		List<Role> user = query.list();
		
		return user;
	}
}
