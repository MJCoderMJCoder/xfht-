package com.cxgc.front.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.DictionaryDao;
import com.cxgc.front.dao.GuestbookDao;
import com.cxgc.front.dao.GuestbookExtDao;
import com.cxgc.front.model.Dictionary;
import com.cxgc.front.model.Guestbook;
import com.cxgc.front.model.GuestbookExt;
import com.cxgc.front.model.User;
import com.cxgc.front.service.DictionaryService;
import com.cxgc.front.service.GuestbookExtService;
import com.cxgc.front.service.GuestbookService;

@Service
@Transactional
public class GuestbookExtServiceImpl<T> implements GuestbookExtService<T>{

	@Autowired
	private GuestbookExtDao<T> dao;
	
	
	@Override
	public GuestbookExt save(GuestbookExt ext, Guestbook guestbook) {
		
		guestbook.setExt(ext);
		ext.setGuestbook(guestbook);
		dao.save(ext);
		return ext;
	}
	@Override
	public GuestbookExt update(GuestbookExt ext) {
		dao.update(ext);
		return ext;
	}

	
	
}
