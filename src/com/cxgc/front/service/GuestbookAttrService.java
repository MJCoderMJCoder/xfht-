package com.cxgc.front.service;

import java.util.List;

import com.cxgc.front.model.GuestbookAttr;

public interface GuestbookAttrService<T> {
	public GuestbookAttr save(GuestbookAttr attr);

	public GuestbookAttr update(GuestbookAttr attr);
	
	public GuestbookAttr getByPath(String path);
	
	public GuestbookAttr findById(Integer id);
	
	public List<GuestbookAttr> getList(Integer guestbookId,Integer type);
	
	public int deleteByList(Integer guestbookId,Integer type);
}