package com.cxgc.front.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.DictionaryDao;
import com.cxgc.front.dao.GuestbookDao;
import com.cxgc.front.dao.GuestbookExtDao;
import com.cxgc.front.model.CheckWork;
import com.cxgc.front.model.Dictionary;
import com.cxgc.front.model.Guestbook;
import com.cxgc.front.model.GuestbookExt;
import com.cxgc.front.model.User;
import com.cxgc.front.util.DateUtils;
import com.cxgc.front.util.StacticVariable;



@Repository
public class GuestbookExtDaoImpl  extends BaseDao implements GuestbookExtDao<Object> {

	@Override
	public GuestbookExt findById(Integer id) {
		if(id == null ){
			return null;
		}
		StringBuffer hql = new StringBuffer("from GuestbookExt en where en.id = " + id );
		Query query = getSession().createQuery(hql.toString());
		List<GuestbookExt> list = query.list();
		if(list == null || list.size() <= 0){
			return null;
		}
		return list.get(0);
	}

	@Override
	public GuestbookExt save(GuestbookExt ext) {
		getSession().save(ext);
		return ext;
	}

	@Override
	public GuestbookExt update(GuestbookExt ext) {
		getSession().update(ext);
		return ext;
	}

	@Override
	public int deleteById(Integer id) {
		int i = 0;
		try {
			String strUpdate = "delete from jc_guestbook_ext where id = " + id;
			SQLQuery qu = getSession().createSQLQuery(strUpdate);
			i = qu.executeUpdate();
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

}
