package com.cxgc.front.dao;

import java.util.List;

import com.cxgc.front.model.GuestbookTime;

public interface GuestbookTimeDao<T> {
	
	
	public GuestbookTime save(GuestbookTime gt);

	public GuestbookTime update(GuestbookTime gt);
	
	public GuestbookTime findById(Integer id);
	
	public List<GuestbookTime> getList(Integer guestbookId,Integer status);
	
}
