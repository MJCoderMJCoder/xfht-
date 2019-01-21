package com.cxgc.front.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.ModularDao;
import com.cxgc.front.model.Modular;
import com.cxgc.front.service.ModularService;


 
@Service
@Transactional
public class ModularServiceImpl implements ModularService {

	@Autowired
	public ModularDao dao;
	
	
	@Override
	public List<Modular> getlist(String sql) { 
		DetachedCriteria dc = DetachedCriteria.forClass(Modular.class);
		dc.add(Restrictions.sqlRestriction(sql));
		// TODO Auto-generated method stub
		return dao.getList(dc);
	}

	@Override
	public Modular findById(int id){
		return dao.findById(id);
	}
}
