package com.cxgc.front.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.GuestbookCtgDao;
import com.cxgc.front.model.GuestbookCtg;

@Repository
public class GuestbookCtgDaoImpl extends BaseDao implements GuestbookCtgDao<Object> {

	@Override
	public List<GuestbookCtg> findAll() {
		
		StringBuffer hql = new StringBuffer("from GuestbookCtg en where 1 = 1 ");
		Query query = getSession().createQuery(hql.toString());
		List<GuestbookCtg> list = query.list();
		if(list == null || list.size() <= 0){
			return null;
		}
		return list;
	}

}
