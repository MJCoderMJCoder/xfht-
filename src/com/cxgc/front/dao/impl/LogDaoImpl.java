package com.cxgc.front.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.LogDao;
import com.cxgc.front.model.TAttendanceLog;

@Repository
public class LogDaoImpl extends BaseDao implements LogDao{

	protected final Logger log = Logger.getLogger(LogDaoImpl.class);
	
	@Override
	public int savelog(TAttendanceLog obj) {
		log.debug("into LogDaoImpl_save : ");
		try {
			getSession().save(obj);
			log.debug("out LogDaoImpl_save : success");
			return 1;

		} catch (RuntimeException re) {
			log.error("out LogDaoImpl_save : ex_", re);
			throw re;
		}
	}

	@Override
	public List<TAttendanceLog> getList(int pagenumber, int pageCount, DetachedCriteria dc) {
		log.debug("into LogDaoImpl_getList : ");
		try {
			Criteria criteria = dc.getExecutableCriteria(getSession());
			criteria.setFirstResult((pagenumber - 1)* pageCount);
			criteria.setMaxResults(pageCount);
			@SuppressWarnings("unchecked")
			List<TAttendanceLog> rs = criteria.list();
			log.debug("out LogDaoImpl_getList : success");
			return rs;
		} catch (RuntimeException re) {
			log.error("out LogDaoImpl_getList : ex_", re);
			throw re;
		}
	}

}
