package com.cxgc.front.service;

import java.util.List;

import com.cxgc.front.model.THelpType;

/** 类型专用字段
 * @author Administrator
 *
 */
public interface THelpTypeService {

	public List<THelpType> getRegionsByFid(Integer fid);
	
	
	public THelpType getById(int  id);
	
	public List<THelpType> getList(int pagenumber, int pageCount);
	
}
