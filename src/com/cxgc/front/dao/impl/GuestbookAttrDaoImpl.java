package com.cxgc.front.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.DictionaryDao;
import com.cxgc.front.dao.GuestbookAttrDao;
import com.cxgc.front.dao.GuestbookDao;
import com.cxgc.front.dao.GuestbookExtDao;
import com.cxgc.front.model.CheckWork;
import com.cxgc.front.model.Dictionary;
import com.cxgc.front.model.Guestbook;
import com.cxgc.front.model.GuestbookAttr;
import com.cxgc.front.model.GuestbookExt;
import com.cxgc.front.model.User;
import com.cxgc.front.util.DateUtils;
import com.cxgc.front.util.StacticVariable;



@Repository
public class GuestbookAttrDaoImpl  extends BaseDao implements GuestbookAttrDao<Object> {


	@Override
	public GuestbookAttr save(GuestbookAttr attr) {
		
		getSession().save(attr);
		return attr;
	}

	@Override
	public GuestbookAttr update(GuestbookAttr attr) {
		getSession().update(attr);
		return attr;
	}

	@Override
	public GuestbookAttr getByPath(String path) {
		if(path == null ){
			return null;
		}
		StringBuffer hql = new StringBuffer("from GuestbookAttr en where en.path = " + path );
		Query query = getSession().createQuery(hql.toString());
		List<GuestbookAttr> list = query.list();
		if(list == null || list.size() <= 0){
			return null;
		}
		return list.get(0);
	}

	@Override
	public GuestbookAttr findById(Integer id) {
		
		if(id == null ){
			return null;
		}
		StringBuffer hql = new StringBuffer("from GuestbookAttr en where en.id = " + id );
		Query query = getSession().createQuery(hql.toString());
		List<GuestbookAttr> list = query.list();
		if(list == null || list.size() <= 0){
			return null;
		}
		return list.get(0);
	}

	@Override
	public List<GuestbookAttr> getList(Integer guestbookId, Integer type) {
		StringBuffer hql = new StringBuffer("from GuestbookAttr en where 1=1 ");
		
		if(guestbookId!=null){
			hql.append(" and en.guestbook.id = '"+guestbookId+"'");
		}
		
		if(type!=null){
			hql.append(" and en.type = '"+type+"'");
		}
		
		Query query = getSession().createQuery(hql.toString());
		List<GuestbookAttr> list = query.list();
		return list;
		
	}

	@Override
	public int deleteByList(Integer guestbookId, Integer type) {
		int i = 0;
		try {
			if(guestbookId!=null && type!=null){
				String strUpdate = "delete from jc_guestbook_attachment where guestbook_id = " + guestbookId +" and type = " +type;
				
				SQLQuery qu = getSession().createSQLQuery(strUpdate);
				i = qu.executeUpdate();
			}
			
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}


}
