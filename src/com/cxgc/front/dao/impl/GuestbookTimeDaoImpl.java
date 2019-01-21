package com.cxgc.front.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.GuestbookTimeDao;
import com.cxgc.front.model.GuestbookTime;



@Repository
public class GuestbookTimeDaoImpl  extends BaseDao implements GuestbookTimeDao<Object> {


	@Override
	public GuestbookTime save(GuestbookTime gt) {
		
		getSession().save(gt);
		return gt;
	}

	@Override
	public GuestbookTime update(GuestbookTime gt) {
		getSession().update(gt);
		return gt;
	}

	@Override
	public GuestbookTime findById(Integer id) {
		
		if(id == null ){
			return null;
		}
		StringBuffer hql = new StringBuffer("from GuestbookTime en where en.id = " + id );
		Query query = getSession().createQuery(hql.toString());
		List<GuestbookTime> list = query.list();
		if(list == null || list.size() <= 0){
			return null;
		}
		return list.get(0);
	}

	@Override
	public List<GuestbookTime> getList(Integer guestbookId, Integer status) {
		StringBuffer hql = new StringBuffer("from GuestbookTime en where 1=1 ");
		
		if(guestbookId!=null){
			hql.append(" and en.guestbook.id = '"+guestbookId+"'");
		}
		
		if(status!=null){
			hql.append(" and en.status = '"+status+"'");
		}
		
		Query query = getSession().createQuery(hql.toString());
		List<GuestbookTime> list = query.list();
		return list;
		
	}

}
