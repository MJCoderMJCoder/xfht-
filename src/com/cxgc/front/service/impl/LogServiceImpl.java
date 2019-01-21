package com.cxgc.front.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.LogDao;
import com.cxgc.front.model.TAttendanceLog;
import com.cxgc.front.service.LogService;

@Service
@Transactional
public class LogServiceImpl implements LogService{

	@Autowired
	private LogDao dao;
	
	@Override
	public int savelog(TAttendanceLog log) {
		// TODO Auto-generated method stub
		return dao.savelog(log);
	}

	@Override
	public List<TAttendanceLog> getList(int pagenumber, int pageCount, String sql) {
		DetachedCriteria dc = DetachedCriteria.forClass(TAttendanceLog.class);
		dc.add(Restrictions.sqlRestriction(" "+sql+" order by whendo desc  "));
		List<TAttendanceLog> temp = dao.getList(pagenumber, pageCount, dc);
		if (temp != null && temp.size() > 0) {
			 
			return temp;
		} else {
			 
			return null;
		}
	}

}
