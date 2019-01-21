package com.cxgc.front.dao;

import java.util.Date;
import java.util.List;

import com.cxgc.front.model.OperationLog;

public interface OperationLogDao<T> {
	
	public List<OperationLog> getListByPage(String s_uName, String s_category, String s_classification, int page,int size);
	
	public int getPageCount(String s_uName, String s_category, String s_classification);
	
	public Integer save(OperationLog Operation);
	
	public int deleteById(Integer id);
}
