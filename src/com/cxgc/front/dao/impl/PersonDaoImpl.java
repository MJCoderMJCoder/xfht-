package com.cxgc.front.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.PersonDao;
import com.cxgc.front.model.Person;



@Repository
public class PersonDaoImpl  extends BaseDao implements PersonDao<Object> {

	@Override
	public Person save(Person person) {
		getSession().save(person);
		return person;
	}

	@Override
	public List<Person> getListByPage(String name, Integer faceDBId, int page, int size) {
		
		StringBuffer hql = new StringBuffer("from Person per where 1=1 ");
		if(name != null && !"".equals(name.trim())){
			hql.append(" and per.name like '%"+name+"%'");
		}
		if(faceDBId != null ){
			hql.append(" and per.faceDB.id = " + faceDBId );
		}
		hql.append(" order by per.id desc");
		Query query = getSession().createQuery(hql.toString()).setFirstResult((page - 1) * size ).setMaxResults(size);
		List<Person> list = query.list();
		return list;
	}

	@Override
	public int getPageCount(String name, Integer faceDBId) {
		
		StringBuilder sqlBuilder = new StringBuilder();
		sqlBuilder.append("select count(per.id) from t_person per  where 1=1 ");
		if(name != null && !"".equals(name.trim())){
			sqlBuilder.append(" and per.name like '%"+name+"%'");
		}
		if(faceDBId != null){
			sqlBuilder.append(" and per.db_id=" + faceDBId);
		}
		
		List<Object> objs = getSession().createSQLQuery(sqlBuilder.toString()).list();
		
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		
		return 0;
	}

	@Override
	public Person findById(Integer id) {
		if(id == null ){
			return null;
		}
		StringBuffer hql = new StringBuffer("from Person per where per.id = " + id );
		hql.append(" order by per.id desc");
		Query query = getSession().createQuery(hql.toString());
		List<Person> list = query.list();
		if(list == null || list.size() <= 0){
			return null;
		}
		return list.get(0);
	}

	@Override
	public int update(Person dictionary) {
		int i = 0;
		try {
			getSession().update(dictionary);
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

	@Override
	public List<Person> getList(String name, String value, String type) {

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
		List<Person> dictionarys = query.list();
		
		return dictionarys;
	}

	@Override
	public int deleteById(Integer id) {
		int i = 0;
		try {
			String strUpdate = "delete from t_person where id = " + id;
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
