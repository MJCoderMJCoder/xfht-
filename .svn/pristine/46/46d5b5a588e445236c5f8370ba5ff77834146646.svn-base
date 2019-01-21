package com.cxgc.front.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.mapping.Array;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.GuestbookCaseDao;
import com.cxgc.front.model.GuestbookCase;
import com.cxgc.front.service.GuestbookCaseService;

@Service
@Transactional
public class GuestbookCaseServiceImpl implements GuestbookCaseService{

	@Autowired
	private GuestbookCaseDao dao;
	
	@Override
	public int saveCase(GuestbookCase obj) {
		// TODO Auto-generated method stub
		return dao.saveCase(obj);
	}

	@Override
	public int deleteCasels(Integer fid, Integer sid) {
		int count=0;
		List<GuestbookCase> temp=new ArrayList<GuestbookCase>();
		DetachedCriteria dc = DetachedCriteria.forClass(GuestbookCase.class); 
		if(sid!=0&&fid==0) { 
			dc.add(Restrictions.sqlRestriction("  follower='"+sid+"'"));
		}
		if(fid!=0&&sid==0) {
			dc.add(Restrictions.sqlRestriction("  leader='"+fid+"'")); 
		}
		temp=dao.getCase(dc);
		if(temp!=null)
		{
			for(int i=0;i<temp.size();i++)
			{
				try {
					dao.deleteCase(temp.get(i));
					 count++;
				} catch (RuntimeException re) {
					count=0;
				} 
		}
		}
		else
		{
			count=0;
		}
		// TODO Auto-generated method stub
		return count;
	}

	@Override
	public int deleteCase(GuestbookCase obj) {
		// TODO Auto-generated method stub
		return dao.deleteCase(obj);
	}
	
	@Override
	public List<GuestbookCase> getCase(Integer fid, Integer sid) {
	DetachedCriteria dc = DetachedCriteria.forClass(GuestbookCase.class); 
	if(sid!=0) {
		dc.add(Restrictions.sqlRestriction("  leader='"+fid+"'"));
		dc.add(Restrictions.sqlRestriction("  follower='"+sid+"'"));
	}
	else {
		dc.add(Restrictions.sqlRestriction("  leader='"+fid+"'"));
		 
	}
	
		return dao.getCase(dc);
	}

}
