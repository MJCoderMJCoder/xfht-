package com.cxgc.front.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.GuestbookReasonDao;
import com.cxgc.front.model.GuestbookReason;
import com.cxgc.front.service.GuestbookReasonService;

@Service
@Transactional
public class GuestbookReasonServiceImpl<T> implements GuestbookReasonService<T> {

	@Autowired
	private GuestbookReasonDao<T> dao;
	
	@Override
	public GuestbookReason findByGuestbookId(Integer guestbookId) {
		return dao.findByGuestbookId(guestbookId);
	}

	@Override
	public GuestbookReason save(GuestbookReason guestbookReason) {
		return dao.save(guestbookReason);
	}

}
