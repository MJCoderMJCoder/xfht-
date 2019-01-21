package com.cxgc.front.service;

import com.cxgc.front.model.GuestbookReason;

public interface GuestbookReasonService<T> {

	public GuestbookReason findByGuestbookId(Integer guestbookId);
	
	public GuestbookReason save(GuestbookReason guestbookReason);
	
}
