package com.cxgc.front.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.ModularDao;
import com.cxgc.front.model.Modular;
import com.cxgc.front.model.Role;

@Repository
public class ModularDaoImpl extends BaseDao implements ModularDao {
	
	protected final Logger log = Logger.getLogger(ModularDaoImpl.class);
	
	public List<Modular> getList(DetachedCriteria dc ){ 
		try {
			Criteria criteria = dc.getExecutableCriteria(getSession()); 
			@SuppressWarnings("unchecked")
			List<Modular> rs = criteria.list();
			log.debug("out ModularDaoImpl_getList : success");
			return rs;
		} catch (RuntimeException re) {
			log.error("out ModularDaoImpl_getList : ex_", re);
			throw re;
		}
	}
	
	@Override
	public Modular findById(int id){
		try { 
			StringBuffer hql = new StringBuffer("from Modular bean where 1=1");
			if(id > 0){
				hql.append(" and bean.id = " + id);
			}
			hql.append(" order by bean.id asc");
			Query query = getSession().createQuery(hql.toString());
			List<Modular> list = query.list();
			if(list != null && list.size() > 0){
				return list.get(0);
			}
		} catch (RuntimeException re) {
			return null;
		}
		return null;
	}
}
