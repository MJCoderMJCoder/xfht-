package com.cxgc.front.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.DictionaryDao;
import com.cxgc.front.model.CheckWork;
import com.cxgc.front.model.Dictionary;
import com.cxgc.front.util.DateUtils;
import com.cxgc.front.util.StacticVariable;



@Repository
public class DictionaryDaoImpl  extends BaseDao implements DictionaryDao<Object> {

	@Override
	public Integer save(Dictionary dictionary) {
		Integer count = (Integer)getSession().save(dictionary);
		return count;
	}

	@Override
	public List<Dictionary> getListByPage(String type, int page, int size) {
		
		StringBuffer hql = new StringBuffer("from Dictionary dict where 1=1 ");
		if(type != null && !"".equals(type.trim())){
			hql.append(" and dict.type='"+type+"'");
		}
		
		hql.append(" order by dict.sort desc");
		Query query = getSession().createQuery(hql.toString()).setFirstResult((page - 1) * size ).setMaxResults(size);
		List<Dictionary> list = query.list();
		return list;
	}

	@Override
	public int getPageCount(String type) {
		
		StringBuilder sqlBuilder = new StringBuilder();
		sqlBuilder.append("select count(dict.id) from t_dictionary dict  where 1=1 ");
		if(type != null && !"".equals(type.trim())){
			sqlBuilder.append(" and dict.type='"+type+"'");
		}
		
		List<Object> objs = getSession().createSQLQuery(sqlBuilder.toString()).list();
		
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		
		return 0;
	}

	@Override
	public Dictionary findById(Integer id) {
		if(id == null ){
			return null;
		}
		StringBuffer hql = new StringBuffer("from Dictionary dict where dict.id = " + id );
		hql.append(" order by dict.sort desc");
		Query query = getSession().createQuery(hql.toString());
		List<Dictionary> list = query.list();
		if(list == null || list.size() <= 0){
			return null;
		}
		return list.get(0);
	}

	@Override
	public int update(Dictionary dictionary) {
		int i = 0;
		try {
			getSession().update(dictionary);
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

	@Override
	public List<Dictionary> getList(String name, String value, String type) {

		StringBuilder sqlBuilder = new StringBuilder();
		sqlBuilder.append("from Dictionary dict  where 1=1 ");
		if(name != null && !"".equals(name.trim()) ){
			sqlBuilder.append(" and dict.name = '" + name + "'");	
		}
		if(value != null && !"".equals(value.trim())){
			sqlBuilder.append(" and dict.value = '" + value + "'");	
		}
		if(type != null && !"".equals(type.trim())){
			sqlBuilder.append(" and dict.type = '" + type + "'");	
		}
		sqlBuilder.append(" order by dict.sort asc");
		
		Query query = getSession().createQuery(sqlBuilder.toString());
		List<Dictionary> dictionarys = query.list();
		
		return dictionarys;
	}

	@Override
	public int deleteById(Integer id) {
		int i = 0;
		try {
			String strUpdate = "delete from t_dictionary where id = " + id;
			SQLQuery qu = getSession().createSQLQuery(strUpdate);
			i = qu.executeUpdate();
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

	@Override
	public List<String> getTypeList() {
		StringBuilder sqlBuilder = new StringBuilder();
		
		sqlBuilder.append("select distinct type from t_dictionary order by sort desc");
		SQLQuery qu = (SQLQuery) getSession().createSQLQuery(sqlBuilder.toString());
		@SuppressWarnings("unchecked")
		List<String> lt= qu.list();
		return lt;
	}
	
	

}
