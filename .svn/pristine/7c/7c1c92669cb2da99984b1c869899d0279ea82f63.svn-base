package com.cxgc.front.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.THelpTypeDao;
import com.cxgc.front.model.THelpType;
import com.cxgc.front.service.THelpTypeService;

@Service
@Transactional
public class THelpTypeServiceImpl implements THelpTypeService {

	@Autowired
	private THelpTypeDao dao;
	
	@Override
	public List<THelpType> getRegionsByFid(Integer fid) {
		// TODO Auto-generated method stub
		return dao.getRegionsByFid(fid);
	}

	@Override
	public THelpType getById(int id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}

	@Override
	public List<THelpType> getList(int pagenumber, int pageCount) {
		 
		DetachedCriteria dc = DetachedCriteria.forClass(THelpType.class);
		dc.add(Restrictions.sqlRestriction("  1=1 "));
		List<THelpType> temp = dao.getList(pagenumber, pageCount, dc);
		if (temp != null && temp.size() > 0) {
			return temp;
		} else {
			return null;
		}
	}

	
}
