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

import com.cxgc.front.model.Dictionary;
import com.cxgc.front.service.DictionaryService;
import com.cxgc.front.util.ResponseUtils;

import net.sf.json.JSONObject;

@Controller
public class DictionaryController {

	private static int PAGE_COUNT_10 = 10;
	
	@Autowired
	private DictionaryService<T> service;
	
	@RequestMapping("cm_dictionary_list")
	public String list(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		Integer pageNum = request.getParameter("pageNum") != null && !"".equals(request.getParameter("pageNum").trim()) ? Integer.parseInt(request.getParameter("pageNum")) : 1;
		String type = request.getParameter("type");
		List<String> typeList = service.getTypeList();

		int totalRecord = service.getPageCount(type);
		if(pageNum <= 0){
			pageNum = 1;
		}
		if(pageNum > (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10){
			pageNum = (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10;
		}
		List<Dictionary> dictionarys = service.getListByPage(type, pageNum, PAGE_COUNT_10);
		
		model.put("totalPages", (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10);
		model.put("totalRecord", totalRecord);
		model.put("pageNum", pageNum);

		model.put("action", "cm_dictionary_list");
		model.put("dictionarys", dictionarys);
		model.put("typeList", typeList);
		model.put("type", type);
		String res = "dictionary/list";
		return res;
	}
	
	@RequestMapping("cm_dictionary_delete")
	public void delete(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		Integer id = request.getParameter("id") != null && !"".equals(request.getParameter("id").trim()) ? Integer.parseInt(request.getParameter("id")) : null;
		if(id != null){
			service.deleteById(id);
		}
		json.put("status", 0);
		ResponseUtils.renderJson(response, json.toString());
	}

	@RequestMapping("cm_dictionary_batchdelete")
	public void batchDelete(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		String[] ids = request.getParameterValues("ids");
		if(ids != null && ids.length > 0){
			for(String idStr : ids){
				Integer id = idStr != null && !"".equals(idStr.trim()) ? Integer.parseInt(idStr) : null;
				if(id != null){
					service.deleteById(id);
				}
			}
		}
		json.put("status", 0);
		ResponseUtils.renderJson(response, json.toString());
	}
	
	@RequestMapping("cm_dictionary_save")
	public void save(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		String name = request.getParameter("addName");
		String value = request.getParameter("addValue");
		String type = request.getParameter("addType");
		Integer sort = request.getParameter("addSort") != null && !"".equals(request.getParameter("addSort").trim()) ? Integer.parseInt(request.getParameter("addSort")) : 10;
		
		
		List<Dictionary> dictionaries = service.getList(name, value, type);
		if(dictionaries != null && dictionaries.size() > 0){
			json.put("status", 1);
			ResponseUtils.renderJson(response, json.toString());
			return;
		}
		
		Dictionary dictionary = new Dictionary();
		dictionary.setName(name);
		dictionary.setValue(value);
		dictionary.setType(type);
		dictionary.setSort(sort);
		service.save(dictionary);
		
		json.put("status", 0);
		ResponseUtils.renderJson(response, json.toString());
	}
	
	@RequestMapping("cm_dictionary_edit")
	public void edit(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		Integer id = request.getParameter("id") != null && !"".equals(request.getParameter("id").trim()) ? Integer.parseInt(request.getParameter("id")) : null;
		if(id == null){
			json.put("status", 1);
			ResponseUtils.renderJson(response, json.toString());
			return ;
		}
		Dictionary dictionary = service.findById(id);
		if(dictionary == null){
			json.put("status", 1);
			ResponseUtils.renderJson(response, json.toString());
			return ;
		}
		json.put("status", 0);
		json.put("id", dictionary.getId());
		json.put("name", dictionary.getName());
		json.put("value", dictionary.getValue());
		json.put("type", dictionary.getType());
		json.put("sort", dictionary.getSort());
		ResponseUtils.renderJson(response, json.toString());
	}
	
	@RequestMapping("cm_dictionary_update")
	public void update(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		Integer id = request.getParameter("editId") != null && !"".equals(request.getParameter("editId").trim()) ? Integer.parseInt(request.getParameter("editId")) : null;
		String name = request.getParameter("editName");
		String value = request.getParameter("editValue");
		String type = request.getParameter("editType");
		Integer sort = request.getParameter("editSort") != null && !"".equals(request.getParameter("editSort").trim()) ? Integer.parseInt(request.getParameter("editSort")) : 10;
		
		List<Dictionary> dictionaries = service.getList(name, value, type);
		if(dictionaries != null && dictionaries.size() > 0){
			json.put("status", 2);
			ResponseUtils.renderJson(response, json.toString());
			return;
		}
		
		if(id == null){
			json.put("status", 1);
			ResponseUtils.renderJson(response, json.toString());
			return ;
		}
		Dictionary dictionary = service.findById(id);
		if(dictionary == null){
			json.put("status", 1);
			ResponseUtils.renderJson(response, json.toString());
			return ;
		}
		dictionary.setName(name);
		dictionary.setValue(value);
		dictionary.setType(type);
		dictionary.setSort(sort);
		json.put("status", service.update(dictionary));
		
		ResponseUtils.renderJson(response, json.toString());
	}
	
	
}
