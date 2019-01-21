package com.cxgc.front.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.GuestbookReasonDao;
import com.cxgc.front.model.GuestbookReason;

@Repository
public class GuestbookReasonDaoImpl extends BaseDao implements GuestbookReasonDao<Object> {

	@Override
	public GuestbookReason findByGuestbookId(Integer guestbookId) {
		
		if(guestbookId == null ){
			return null;
		}
		
		StringBuffer hql = new StringBuffer("from GuestbookReason en where en.guestbook.id = " + guestbookId );
		Query query = getSession().createQuery(hql.toString());
		List<GuestbookReason> list = query.list();
		
		if(list == null || list.size() <= 0){
			return null;
		}
		
		return list.get(0);
	}

	@Override
	public GuestbookReason save(GuestbookReason guestbookReason) {
		
		getSession().save(guestbookReason);
		return guestbookReason;
		
	}

}
