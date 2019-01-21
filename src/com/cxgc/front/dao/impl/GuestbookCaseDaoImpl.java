package com.cxgc.front.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.GuestbookCaseDao;
import com.cxgc.front.model.GuestbookCase;

@Repository
public class GuestbookCaseDaoImpl extends BaseDao implements GuestbookCaseDao{

	@Override
	public int saveCase(GuestbookCase obj) {
		try {
			getSession().save(obj);
			return 1;
		} catch (RuntimeException re) { 
			return 0;
			
		}
	}

	@Override
	public int deleteCase(GuestbookCase obj) {
		try {
			getSession().delete(obj);
			return 1;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	@Override
	public List<GuestbookCase> getCase(DetachedCriteria dc) {
		try {
			Criteria criteria = dc.getExecutableCriteria(getSession());
			@SuppressWarnings("unchecked")
			List<GuestbookCase> rs = criteria.list();
			return rs;
		} catch (RuntimeException re) {
			re.printStackTrace();
			return null;
		}
	}

}
