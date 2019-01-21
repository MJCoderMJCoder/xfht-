package com.cxgc.front.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.DictionaryDao;
import com.cxgc.front.dao.GuestbookAttrDao;
import com.cxgc.front.dao.GuestbookDao;
import com.cxgc.front.dao.GuestbookExtDao;
import com.cxgc.front.model.Dictionary;
import com.cxgc.front.model.Guestbook;
import com.cxgc.front.model.GuestbookAttr;
import com.cxgc.front.model.GuestbookExt;
import com.cxgc.front.model.User;
import com.cxgc.front.service.DictionaryService;
import com.cxgc.front.service.GuestbookAttrService;
import com.cxgc.front.service.GuestbookExtService;
import com.cxgc.front.service.GuestbookService;

@Service
@Transactional
public class GuestbookAttrServiceImpl<T> implements GuestbookAttrService<T>{

	@Autowired
	private GuestbookAttrDao<T> dao;
	
	
	@Override
	public GuestbookAttr save(GuestbookAttr attr) {
		
		dao.save(attr);
		return attr;
	}
	@Override
	public GuestbookAttr update(GuestbookAttr attr) {
		
		dao.update(attr);
		return attr;
	}
	@Override
	public GuestbookAttr getByPath(String path) {
		return dao.getByPath(path);
	}
	
	@Override
	public GuestbookAttr findById(Integer id) {
		return dao.findById(id);
	}
	
	@Override
	public List<GuestbookAttr> getList(Integer guestbookId, Integer type) {
		return dao.getList(guestbookId,type);
	}
	
	@Override
	public int deleteByList(Integer guestbookId, Integer type) {
		return dao.deleteByList(guestbookId,type);
	}

	
	
}
