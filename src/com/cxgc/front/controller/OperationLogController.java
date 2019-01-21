package com.cxgc.front.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cxgc.front.model.OperationLog;
import com.cxgc.front.service.OperationLogService;
import com.cxgc.front.util.ResponseUtils;

import net.sf.json.JSONObject;

@Controller
public class OperationLogController {
	private static int PAGE_COUNT_10 = 10;
	
	@Autowired
	private OperationLogService<T> service;

	@Autowired
	private OperationLogService<T> log;
	
	@RequestMapping("cm_operationLog_list")
	public String list(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		Integer pageNum = request.getParameter("pageNum") != null && !"".equals(request.getParameter("pageNum").trim()) ? Integer.parseInt(request.getParameter("pageNum")) : 1;
		String s_uName = request.getParameter("s_uName");
		String s_category = request.getParameter("s_category");
		String s_classification = request.getParameter("s_classification");
		
		int totalRecord = service.getPageCount(s_uName,s_category,s_classification);
		if(pageNum <= 0){
			pageNum = 1;
		}
		if(pageNum > (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10){
			pageNum = (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10;
		}
		List<OperationLog> operationLogs = service.getListByPage(s_uName,s_category,s_classification, pageNum, PAGE_COUNT_10);
		
		model.put("totalPages", (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10);
		model.put("totalRecord", totalRecord);
		model.put("pageNum", pageNum);

		model.put("action", "cm_operationLog_list");
		model.put("operationLogs", operationLogs);
		model.put("s_uName", s_uName);
		model.put("s_category", s_category);
		model.put("s_classification", s_classification);
		String res = "operationLog/list";
		return res;
	}
	
	@RequestMapping("cm_operationLog_delete")
	public void delete(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		Integer id = request.getParameter("id") != null && !"".equals(request.getParameter("id").trim()) ? Integer.parseInt(request.getParameter("id")) : null;
		try {
			if (id != null) {
				service.deleteById(id);
			}
			json.put("status", 0);
			log.Save_Log(request, session, "删除日志", "1", "id="+id+";删除成功","","");
		} catch (Exception e) {
			json.put("status", -1);
			log.Save_Log(request, session, "删除日志", "2", "id="+id+";错误:"+e.toString(),"","");
			
		}
		ResponseUtils.renderJson(response, json.toString());
	}

	@RequestMapping("cm_operationLog_batchdelete")
	public void batchDelete(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		String[] ids = request.getParameterValues("ids");
		try {
			if (ids != null && ids.length > 0) {
				for (String idStr : ids) {
					Integer id = idStr != null && !"".equals(idStr.trim()) ? Integer.parseInt(idStr) : null;
					if (id != null) {
						service.deleteById(id);
					}
				}
			}
			json.put("status", 0);
			log.Save_Log(request, session, "删除日志", "1", "id="+ids.toString()+";删除成功","","");
		} catch (Exception e) {
			json.put("status", -1);
			log.Save_Log(request, session, "删除日志", "2", "id="+ids.toString()+";错误:"+e.toString(),"","");
		}
		ResponseUtils.renderJson(response, json.toString());
	}
	
	@RequestMapping("cm_operationLog_historyList")
	public String historyList(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		Integer pageNum = request.getParameter("pageNum") != null && !"".equals(request.getParameter("pageNum").trim()) ? Integer.parseInt(request.getParameter("pageNum")) : 1;
		String s_uName = request.getParameter("s_uName");
		String s_category = request.getParameter("s_category");
		
		int totalRecord = service.getPageCount(s_uName,s_category,null);
		if(pageNum <= 0){
			pageNum = 1;
		}
		if(pageNum > (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10){
			pageNum = (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10;
		}
		List<OperationLog> operationLogs = service.getListByPage(s_uName,s_category,null, pageNum, PAGE_COUNT_10);
		
		model.put("totalPages", (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10);
		model.put("totalRecord", totalRecord);
		model.put("pageNum", pageNum);

		model.put("action", "cm_operationLog_list");
		model.put("operationLogs", operationLogs);
		model.put("s_uName", s_uName);
		model.put("s_category", s_category);
		String res = "operationLog/historyList";
		return res;
	}
}
