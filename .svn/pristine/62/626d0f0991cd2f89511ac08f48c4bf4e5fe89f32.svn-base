package com.cxgc.front.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.FunctionModularDao;
import com.cxgc.front.model.FunctionModular;
import com.cxgc.front.model.Modular;
import com.cxgc.front.util.DateUtils;



@Repository
public class FunctionModularDaoImpl  extends BaseDao implements FunctionModularDao<Object> {

	@Override
	public List<FunctionModular> getlistByParent(Integer parentId) {
		StringBuffer hql = new StringBuffer("from FunctionModular fm where 1=1 ");
		if(parentId != null){
			hql.append(" and fm.personId="+parentId);
		}else{
			hql.append(" and fm.personId is null");
		}
		
		hql.append(" order by fm.sort asc");
		Query query = getSession().createQuery(hql.toString());
		List<FunctionModular> list = query.list();
		return list;
	}

	@Override
	public FunctionModular findById(Integer id) {
		StringBuffer hql = new StringBuffer("from FunctionModular fm where 1=1 ");
		if(id != null){
			hql.append(" and fm.id="+id);
		}else{
			return null;
		}
		hql.append(" order by fm.sort desc");
		Query query = getSession().createQuery(hql.toString());
		List<FunctionModular> list = query.list();
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public int getCount() {
		StringBuilder sqlBuilder = new StringBuilder();
		sqlBuilder.append("select count(fm.id) from FunctionModular fm where 1=1 ");
		List<Object> objs = getSession().createQuery(sqlBuilder.toString()).list();
		
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		
		return 0;
	}


	
	

}
