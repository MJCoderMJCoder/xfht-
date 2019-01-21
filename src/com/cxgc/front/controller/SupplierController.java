package com.cxgc.front.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


import org.springframework.web.bind.annotation.RequestMethod;

import com.cxgc.front.model.Guestbook;
import com.cxgc.front.model.Supplier;
import com.cxgc.front.model.SupplierScope;
import com.cxgc.front.model.User;
import com.cxgc.front.service.OperationLogService;
import com.cxgc.front.service.SupplierService;
import com.cxgc.front.service.supplierScopeService;
import com.cxgc.front.service.impl.supplierScopeServiceimpl;
import com.cxgc.front.util.ResponseUtils;


@Controller
             
public class SupplierController {
	private static int PAGE_COUNT_10 = 10;
	@Autowired
	private SupplierService<T> service;
	
	@Autowired
	private supplierScopeService scopeService;
	
	@Autowired
	private OperationLogService<T> logService;
	
	
	@RequestMapping("cm_visitingRegistration_list")
	public String list(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		System.out.println("12312132123132123131231231221");
		// 获取用户对象
        User user = (User)session.getAttribute("user");
        //供应商范围下拉列表
        List<SupplierScope> caidanList = scopeService.getList();
        
		Integer pageNum = request.getParameter("pageNum") != null && !"".equals(request.getParameter("pageNum").trim()) ? Integer.parseInt(request.getParameter("pageNum")) : 1;
		
		String supplier_name = request.getParameter("supplier_name");
		String supplier_category = request.getParameter("caidanList");//获取下拉菜单

		
		/*****分页*******/
		int totalRecord = service.getPageCount(supplier_name, supplier_category);
		
		if(pageNum <= 0){
			pageNum = 1;
		}
		if(pageNum > (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10){
			pageNum = (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10;
		}
		//*******************
		List<Supplier> guestBookList = service.getListByPage(supplier_name, supplier_category ,pageNum, PAGE_COUNT_10);
		
		model.put("totalPages", (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10);
		model.put("totalRecord", totalRecord);
		model.put("pageNum", pageNum);
		/************/
		
		model.put("supplier_name", supplier_name);
		model.put("guestBookList", guestBookList);//列表
		model.put("caidanList", caidanList);//下拉菜单放入
		//model.put("supplier_category", supplier_category);
		String res = "publicVoiceRegister/visitingRegistration/list";
		return res;
	}
	

	/**
	 * 详情页
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping("cm_visitingRegistration_detailed")
	public String detailed(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		

		Integer id = request.getParameter("id") != null && !"".equals(request.getParameter("id").trim()) ? Integer.parseInt(request.getParameter("id")) : null;
		
		model.put("guestbookId", id);
		
		String res = "publicVoiceRegister/visitingRegistration/gongyingshangxx";
		return res;
	}
	
	/**
	 * 打分页面
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping("cm_visitingRegistration_edit")
	public String edit(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		
		Integer id = request.getParameter("id") != null && !"".equals(request.getParameter("id").trim()) ? Integer.parseInt(request.getParameter("id")) : null;
		
		model.put("guestbookId", id);
		
		String res = "publicVoiceRegister/visitingRegistration/edit";
		return res;
	}
	/**
	 * 登添加页
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping("cm_visitingRegistration_add")
	public String add(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		
		 List<SupplierScope> genderList = scopeService.getList();
		model.put("genderList", genderList);
		
		String res = "publicVoiceRegister/visitingRegistration/add";
		return res;
	}
	/**
	 * 删除供应商
	 * @param request
	 * @param session
	 * @param response
	 * @param model
	 * @throws JSONException
	 * @throws IOException
	 */
	@RequestMapping(value = "cm_visitingRegistration_updateBook", method = RequestMethod.POST)
	public void updateBook(HttpServletRequest request,HttpSession session,
			HttpServletResponse response, ModelMap model) throws JSONException,
			IOException {
			JSONObject json = new JSONObject();
			
			Integer id = request.getParameter("id") != null && !"".equals(request.getParameter("id").trim()) ? Integer.parseInt(request.getParameter("id")) : null;
			Integer status = request.getParameter("status") != null && !"".equals(request.getParameter("status").trim()) ? Integer.parseInt(request.getParameter("status")) : null;
			
			int g = service.findById(id);
			if(g==0){
				json.put("status", 0);
			}else{
				json.put("status", 1);
			}
			
			System.out.println(status);
		ResponseUtils.renderJson(response, json.toString());
	}
	
	
}
