package com.cxgc.front.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.GuestbookCtgDao;
import com.cxgc.front.model.GuestbookCtg;
import com.cxgc.front.service.GuestbookCtgService;

@Service
@Transactional
public class GuestbookCtgServiceImpl<T> implements GuestbookCtgService<T> {

	@Autowired
	private GuestbookCtgDao<T> dao;
	
	@Override
	public List<GuestbookCtg> findAll() {
		return dao.findAll();
	}

}
