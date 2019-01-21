package com.cxgc.front.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.FaceDBDao;
import com.cxgc.front.model.FaceDB;



@Repository
public class FaceDBDaoImpl  extends BaseDao implements FaceDBDao<Object> {

	@Override
	public List<FaceDB> getListByName(String name){
		StringBuffer hql = new StringBuffer("from FaceDB fdb where 1=1 ");
		if(name != null && !"".equals(name.trim())){
			hql.append(" and fdb.name='"+name+"'");
		}
		
		hql.append(" order by fdb.sort asc");
		Query query = getSession().createQuery(hql.toString());
		List<FaceDB> list = query.list();
		return list;
		
	}

	@Override
	public FaceDB findById(Integer id){
		StringBuffer hql = new StringBuffer("from FaceDB fdb where 1=1 ");
		
		if(id == null ){
			return null;
		}
		hql.append(" and fdb.id="+id+"");
		
		hql.append(" order by fdb.sort asc");
		Query query = getSession().createQuery(hql.toString());
		List<FaceDB> list = query.list();
		if( list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<FaceDB> getByType(Integer type, int page, int size) {
		StringBuffer hql = new StringBuffer("from FaceDB fdb where 1=1 ");
		
		if(type != null ){
			hql.append(" and fdb.type="+type+"");
		}
		
		hql.append(" order by fdb.sort asc");
		Query query = getSession().createQuery(hql.toString()).setFirstResult((page - 1) * size ).setMaxResults(size);
		List<FaceDB> list = query.list();
		return list;
	}

	@Override
	public FaceDB save(FaceDB faceDB) {
		getSession().save(faceDB);
		return faceDB;
	}

	@Override
	public int getPageCount(Integer type) {
		StringBuilder sqlBuilder = new StringBuilder();
		sqlBuilder.append("select count(fdb.id) from t_facedb fdb  where 1=1 ");
		if(type != null ){
			sqlBuilder.append(" and fdb.type="+type+"");
		}
		
		List<Object> objs = getSession().createSQLQuery(sqlBuilder.toString()).list();
		
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		
		return 0;
	}

	@Override
	public FaceDB update(FaceDB faceDB) {
		getSession().update(faceDB);
		return faceDB;
	}

	@Override
	public int deleteById(Integer id) {
		int i = 0;
		try {
			String strUpdate = "delete from t_facedb where id = " + id;
			SQLQuery qu = getSession().createSQLQuery(strUpdate);
			i = qu.executeUpdate();
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

	@Override
	public int getPersonCountByFaceDB(Integer id) {
		StringBuilder sqlBuilder = new StringBuilder();
		sqlBuilder.append("select count(per.id) from t_person per  where 1=1 ");
		if(id != null ){
			sqlBuilder.append(" and per.db_id="+id+"");
		}
		
		List<Object> objs = getSession().createSQLQuery(sqlBuilder.toString()).list();
		
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		return 0;
	}
	

}
