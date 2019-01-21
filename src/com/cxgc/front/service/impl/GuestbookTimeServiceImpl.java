package com.cxgc.front.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.DictionaryDao;
import com.cxgc.front.dao.GuestbookTimeDao;
import com.cxgc.front.dao.GuestbookDao;
import com.cxgc.front.dao.GuestbookExtDao;
import com.cxgc.front.model.Dictionary;
import com.cxgc.front.model.Guestbook;
import com.cxgc.front.model.GuestbookTime;
import com.cxgc.front.model.GuestbookExt;
import com.cxgc.front.model.User;
import com.cxgc.front.service.DictionaryService;
import com.cxgc.front.service.GuestbookTimeService;
import com.cxgc.front.service.GuestbookExtService;
import com.cxgc.front.service.GuestbookService;

@Service
@Transactional
public class GuestbookTimeServiceImpl<T> implements GuestbookTimeService<T>{

	@Autowired
	private GuestbookTimeDao<T> dao;
	
	
	@Override
	public GuestbookTime save(GuestbookTime gt) {
		
		dao.save(gt);
		return gt;
	}
	@Override
	public GuestbookTime update(GuestbookTime gt) {
		
		dao.update(gt);
		return gt;
	}
	
	@Override
	public GuestbookTime findById(Integer id) {
		return dao.findById(id);
	}
	
	@Override
	public List<GuestbookTime> getList(Integer guestbookId, Integer status) {
		return dao.getList(guestbookId,status);
	}
	
}
