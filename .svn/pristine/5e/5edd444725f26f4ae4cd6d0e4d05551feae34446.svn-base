package com.cxgc.front.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.THelpDao;
import com.cxgc.front.model.THelp;

@Repository
public class THelpDaoImpl  extends BaseDao implements THelpDao{

	protected final Logger log = Logger.getLogger(THelpDaoImpl.class);
	
	@Override
	public THelp getHelpById(int helpid) {
		log.debug("into THelpDaoImpl_findById : ");
		try {
			THelp objReturn = (THelp) getSession().get(THelp.class, helpid);
			log.debug("out THelpDaoImpl_findById : success");
			return objReturn;
		} catch (RuntimeException re) {
			log.error("out THelpDaoImpl_findById : ex_", re);
			throw re;
		}
	}

	@Override
	public THelp mergeTHelp(THelp obj) {
		log.debug("into THelpDaoImpl_merge : ");
		try {
			THelp objReturn = (THelp) getSession().merge(obj);
			log.debug("out THelpDaoImpl_merge : success");
			return objReturn;
		} catch (RuntimeException re) {
			log.error("out THelpDaoImpl_merge : ex_", re);
			throw re;
		}
	}

	@Override
	public int saveTHelp(THelp obj) {
		log.debug("into THelpDaoImpl_save : ");
		try {
			getSession().save(obj);
			log.debug("out THelpDaoImpl_save : success");
			return 1;

		} catch (RuntimeException re) {
			log.error("out THelpDaoImpl_save : ex_", re);
			throw re;
		}
	}

	@Override
	public int deleteTHelp(THelp obj) {
		log.debug("into THelpDaoImpl_delete : ");
		try {
			getSession().delete(obj);
			log.debug("out THelpDaoImpl_delete : success");
			return 1;

		} catch (RuntimeException re) {
			log.error("out THelpDaoImpl_delete : ex_", re);
			throw re;
		}
	}

	@Override
	public List<THelp> getListBySearch(int pageindex, int pageNumber,DetachedCriteria dc) {
		log.debug("into THelpDaoImpl_getHelpByHotDesc : ");
		try {
			Criteria criteria = dc.getExecutableCriteria(getSession());
			criteria.setFirstResult((pageindex - 1)* pageNumber);
			criteria.setMaxResults(pageNumber);
			@SuppressWarnings("unchecked")
			List<THelp> rs = criteria.list();
			log.debug("out THelpDaoImpl_getHelpByHotDesc : success");
			return rs;
		} catch (RuntimeException re) {
			log.error("out THelpDaoImpl_getHelpByHotDesc : ex_", re);
			throw re;
		}
	}

	@Override
	public int addReadNum(int helpid) {
		log.debug("into THelpDaoImpl_addReadNum : ");
		String sql = "update  t_help set readcount = readcount+1 where id=" + helpid;
		SQLQuery sqly = getSession().createSQLQuery(sql);
		int i = sqly.executeUpdate();
		log.error("out THelpDaoImpl_addReadNum : success ");
		return i;
	}

	@Override
	public int getcount(String sql) { 
		int count=((Long)getSession().createQuery(sql.toString()).uniqueResult()).intValue();
		return count;
	}

}
