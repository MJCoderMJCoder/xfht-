package com.cxgc.front.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.IOADao;
import com.cxgc.front.service.IOAService;

@Service
@Transactional
public class OAServiceImpl<T> implements IOAService<T>  {

	private static Logger logger = Logger.getLogger(OAServiceImpl.class);
	@Autowired
	private IOADao oaDao;

	

	@Override
	public int do_update(String sql) {
		// TODO Auto-generated method stub
		return oaDao.do_update(sql);
	}



	@Override
	public List do_sql(String sql) {
		// TODO Auto-generated method stub
		return oaDao.do_sql(sql);
	}
	
	
}
