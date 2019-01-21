package com.cxgc.front.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.OrganizationalDao;
import com.cxgc.front.model.Dictionary;
import com.cxgc.front.model.Guestbook;
import com.cxgc.front.model.Organization;

@Repository
public class OrganizationalDaoImpl extends BaseDao implements OrganizationalDao {

	@Override
	public List<Organization> getList(Integer parentId) {
		
		StringBuilder sqlBuilder = new StringBuilder();
		sqlBuilder.append("from Organization dict  where 1=1 ");
		
		if(parentId!=null){
			sqlBuilder.append(" and dict.parentid = '" + parentId + "'");
		}
		
		Query query = getSession().createQuery(sqlBuilder.toString());
		List<Organization> o = query.list();
		
		return o;
	}

	@Override
	public Organization findById(Integer id) {
		if(id == null ){
			return null;
		}
		StringBuffer hql = new StringBuffer("from Organization dict where dict.id = " + id );
		hql.append(" order by dict.id desc");
		Query query = getSession().createQuery(hql.toString());
		List<Organization> list = query.list();
		if(list == null || list.size() <= 0){
			return null;
		}
		return list.get(0);
	}

	@Override
	public int update(Organization organization) {
		int i = 0;
		try {
			getSession().update(organization);
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

	@Override
	public Organization save(Organization organization) {
		getSession().save(organization);
		return organization;
	}

	@Override
	public int deleteById(Integer id) {
		int i = 0;
		try {
			String strUpdate = "delete from t_organization where id = " + id;
			SQLQuery qu = getSession().createSQLQuery(strUpdate);
			i = qu.executeUpdate();
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

	@Override
	public int getPageCount(Integer id, String name) {
		
		StringBuilder hql = new StringBuilder();
		hql.append("select count(en.id) from Organization en  where 1=1 ");
		
		if(id != null){
			hql.append(" and en.id = '"+id+"'");
		}
		
		if(name != null && !"".equals(name.trim())){
			hql.append(" and en.name like '%"+name+"%'");
		}
		
		List<Object> objs = getSession().createQuery(hql.toString()).list();
		
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		
		return 0;
	}

	@Override
	public List<Organization> getListByPage(Integer id, String name, int page, int size) {
		
		StringBuffer hql = new StringBuffer("from Organization en where 1=1 ");
		
		if(id != null){
			hql.append(" and en.id = '"+id+"'");
		}
		
		if(name != null && !"".equals(name.trim())){
			hql.append(" and en.name like '%"+name+"%'");
		}
		
		Query query = getSession().createQuery(hql.toString()).setFirstResult((page - 1) * size ).setMaxResults(size);
		List<Organization> list = query.list();
		return list;
	}


	@Override
	public List<Organization> getFlist(DetachedCriteria dc) {
		try { 
			Criteria criteria = dc.getExecutableCriteria(getSession());
			@SuppressWarnings("unchecked")
			List<Organization> rs = criteria.list();
			return rs;
		} catch (RuntimeException re) {
			throw re;
		} 
	}


	@Override
	public int getChildPageCount() {
		
		StringBuilder hql = new StringBuilder();
		hql.append("select count(en.id) from Organization en  where en.parentid is not null ");
		
		List<Object> objs = getSession().createQuery(hql.toString()).list();
		
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		
		return 0;
	}

	@Override
	public List<Organization> getChildListByPage(int page, int size) {
		
		StringBuffer hql = new StringBuffer("from Organization en where en.parentid is not null ");
		
		Query query = getSession().createQuery(hql.toString()).setFirstResult((page - 1) * size ).setMaxResults(size);
		List<Organization> list = query.list();
		return list;
	}

	
	
}
