package com.cxgc.front.dao;

import java.util.Date;
import java.util.List;

import com.cxgc.front.model.Dictionary;
import com.cxgc.front.model.Guestbook;
import com.cxgc.front.model.GuestbookAttr;
import com.cxgc.front.model.GuestbookExt;
import com.cxgc.front.model.User;

public interface GuestbookAttrDao<T> {
	
	
	public GuestbookAttr save(GuestbookAttr attr);

	public GuestbookAttr update(GuestbookAttr attr);
	
	public GuestbookAttr getByPath(String path);
	
	public GuestbookAttr findById(Integer id);
	
	public List<GuestbookAttr> getList(Integer guestbookId,Integer type);
	
	public int deleteByList(Integer guestbookId,Integer type);
}
