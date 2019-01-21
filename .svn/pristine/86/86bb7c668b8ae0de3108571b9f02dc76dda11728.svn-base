package com.cxgc.front.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.OperationLogDao;
import com.cxgc.front.model.Dictionary;
import com.cxgc.front.model.OperationLog;

@Repository
public class OperationLogDaoImpl extends BaseDao implements OperationLogDao<Object> {
	
	@Override
	public List<OperationLog> getListByPage(String s_uName, String s_category, String s_classification, int page,int size) {
		
		StringBuffer hql = new StringBuffer("from OperationLog op where 1=1 ");
		if(s_uName != null && !"".equals(s_uName.trim())){
			hql.append(" and op.userId.description like '%"+s_uName+"%'");
		}
		if(s_category != null && !"".equals(s_category.trim())){
			hql.append(" and op.category like '%"+s_category+"%'");
		}
		if(s_classification != null && !"".equals(s_classification.trim())){
			if(s_classification.equals("0")){
				hql.append(" and op.classification = '登录日志'");
			}else if(s_classification.equals("1")){
				hql.append(" and op.classification = '操作日志'");
			}else if(s_classification.equals("2")){
				hql.append(" and op.classification = '错误日志'");
			}
		}
		
		hql.append(" order by op.id desc");
		Query query = getSession().createQuery(hql.toString()).setFirstResult((page - 1) * size ).setMaxResults(size);
		List<OperationLog> list = query.list();
		return list;
	}
	
	@Override
	public Integer save(OperationLog operationLog) {
		Integer count = (Integer)getSession().save(operationLog);
		return count;
	}

	@Override
	public int getPageCount(String s_uName, String s_category, String s_classification) {
		StringBuilder sqlBuilder = new StringBuilder();
		sqlBuilder.append("from OperationLog op where 1=1 ");
		if(s_uName != null && !"".equals(s_uName.trim())){
			sqlBuilder.append(" and op.userId.description like '%"+s_uName+"%'");
		}
		if(s_category != null && !"".equals(s_category.trim())){
			sqlBuilder.append(" and op.category like '%"+s_category+"%'");
		}
		if(s_classification != null && !"".equals(s_classification.trim())){
			if(s_classification.equals("0")){
				sqlBuilder.append(" and op.classification = '登录日志'");
			}else if(s_classification.equals("1")){
				sqlBuilder.append(" and op.classification = '操作日志'");
			}else if(s_classification.equals("2")){
				sqlBuilder.append(" and op.classification = '错误日志'");
			}
		}
		
		List<Object> objs = getSession().createQuery(sqlBuilder.toString()).list();
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : objs.size();
		}
		
		return 0;
	}

	@Override
	public int deleteById(Integer id) {
		int i = 0;
		try {
			String strUpdate = "delete from t_operationLog where id = " + id;
			SQLQuery qu = getSession().createSQLQuery(strUpdate);
			i = qu.executeUpdate();
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}
	
	
}
