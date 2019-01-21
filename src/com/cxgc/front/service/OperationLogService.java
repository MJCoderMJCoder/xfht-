package com.cxgc.front.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cxgc.front.model.OperationLog;

public interface OperationLogService<T> {
	public List<OperationLog> getListByPage(String s_uName, String s_category, String s_classification, int page,int size);
	
	public int getPageCount(String s_uName, String s_category, String s_classification);
	
	public Integer save(OperationLog Operation);
	
	public int deleteById(Integer id);
	
	public Integer Save_Log(HttpServletRequest request, HttpSession session,String category,String classification,String Describes,String modular,String submodule);
	
}
