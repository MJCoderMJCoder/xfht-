package com.cxgc.front.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cxgc.front.model.Organization;
import com.cxgc.front.service.OperationLogService;
import com.cxgc.front.service.OrganizationalService;
import com.cxgc.front.service.UserService;
import com.cxgc.front.util.ResponseUtils;

import net.sf.json.JSONObject;

@Controller
public class OrganizationalController {
	
	@Autowired
	private OrganizationalService organizationalService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OperationLogService<T> log;
	
	@RequestMapping("cm_organization_list")
	public String list(ModelMap model, HttpServletRequest request, HttpSession session, 
			HttpServletResponse response) {
		
		return "organization/list";
	}
	
	@RequestMapping("cm_organization_showbyjson")
	public void showByJson(ModelMap model, HttpServletRequest request, HttpSession session, 
			HttpServletResponse response,Integer id){
		JSONObject json = new JSONObject();
		int l1=0;
		StringBuilder sqlBuilder = new StringBuilder();
		
		Organization organization = organizationalService.findById(id);
		
		if (organization != null) {
			sqlBuilder.append("[{\"name\": \""+organization.getName()+"\",");
			sqlBuilder.append("\"code\": \""+organization.getId()+"\",");
			sqlBuilder.append("\"icon\": \"icon-th\",");
			sqlBuilder.append("\"child\": [");
			List<Organization> List1 = organizationalService.getList(id);
			
			if (List1 != null && List1.size() > 0) {
				for(Organization models : List1){
					if(l1!=0){
						sqlBuilder.append(",");
					}
					sqlBuilder.append("{\"name\": \""+models.getName()+"\",");
					sqlBuilder.append("\"code\": \""+models.getId()+"\",");
					sqlBuilder.append("\"icon\": \"icon-minus-sign\",");
					sqlBuilder.append("\"parentCode\": \""+models.getParentid()+"\",");
					sqlBuilder.append("\"child\": [");
					int l2=0;
					List<Organization> List2 = organizationalService.getList(models.getId());
					
					if (List2 != null && List2.size() > 0) {
						for(Organization models2 : List2){
							if(l2!=0){
								sqlBuilder.append(",");
							}
							sqlBuilder.append("{\"name\": \""+models2.getName()+"\",");
							sqlBuilder.append("\"code\": \""+models2.getId()+"\",");
							sqlBuilder.append("\"icon\": \"\",");
							sqlBuilder.append("\"parentCode\": \""+models2.getParentid()+"\",");
							sqlBuilder.append("\"child\": []}");
							l2++;						
						}
					}
					sqlBuilder.append("]}");
					l1++;
				}
			}
			sqlBuilder.append("]}];");
		}
		json.put("status", 0);
		json.put("jsons", sqlBuilder.toString());
		ResponseUtils.renderJson(response, json.toString());
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("cm_organization_save")
	public void save(ModelMap model, HttpServletRequest request, 
			HttpServletResponse response, HttpSession session, Integer id, String addname, 
			String addcode, Integer addparentid, String addcontact, String addmanager,Boolean addinsystem,String addext) {
		JSONObject json = new JSONObject();
		
		if(id ==null){
			//save
			try {
				Organization models = new Organization();
				models.setCode(addcode);
				models.setName(addname);
				models.setContact(addcontact);
				models.setManager(addmanager);
				models.setSort(1);
				models.setParentid(addparentid);
				models.setInsystem(addinsystem);
				models.setExt(addext);
				models.setCreateTime(new Date());
				Organization p_model = organizationalService.findById(addparentid);
				if (p_model != null) {
					models.setPath(p_model.getPath());
				}
				Organization save_model = organizationalService.save(models);
				save_model.setPath(save_model.getPath() + save_model.getId() + ",");
				organizationalService.update(save_model);
				log.Save_Log(request, session, "新增机构", "1", "id="+save_model.getId()+";name="+addname+"增加成功","","");
				json.put("status", 0);
			} catch (Exception e) {
				log.Save_Log(request, session, "新增机构", "2", "name="+addname+";错误:"+e.toString(),"","");
				json.put("status", 2);
			}
		}else{
			//update
			try {
				Organization models = organizationalService.findById(id);
				models.setCode(addcode);
				models.setName(addname);
				models.setContact(addcontact);
				models.setManager(addmanager);
				models.setSort(1);
				models.setParentid(addparentid);
				models.setInsystem(addinsystem);
				models.setExt(addext);
				Organization p_model = organizationalService.findById(addparentid);
				if (p_model != null) {
					models.setPath(p_model.getPath());
				}
				Organization save_model = organizationalService.save(models);
				save_model.setPath(save_model.getPath() + save_model.getId() + ",");
				organizationalService.update(save_model);
				log.Save_Log(request, session, "修改机构", "1", "id="+save_model.getId()+";name="+addname+"修改成功","","");
				json.put("status", 1);
			} catch (Exception e) {
				log.Save_Log(request, session, "修改机构", "2", "id="+id+";name="+addname+";错误:"+e.toString(),"","");
				json.put("status", 3);
			}
		}
		ResponseUtils.renderJson(response, json.toString());
	}
	
	@RequestMapping("cm_organization_edit")
	public void edit(ModelMap model, RedirectAttributes attr, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		JSONObject json = new JSONObject();
		Integer id = request.getParameter("id") != null && !"".equals(request.getParameter("id").trim()) ? Integer.parseInt(request.getParameter("id")) : null;
		if(id == null){
			json.put("status", 1);
			ResponseUtils.renderJson(response, json.toString());
			return ;
		}
		Organization models = organizationalService.findById(id);
		
		if(models == null){
			json.put("status", 1);
			ResponseUtils.renderJson(response, json.toString());
			return ;
		}
		json.put("status", 0);
		json.put("id", models.getId());
		json.put("name", models.getName());
		json.put("code", models.getCode());
		json.put("contact", models.getContact());
		json.put("manager", models.getManager());
		json.put("ext", models.getExt());
		json.put("insystem", models.getInsystem());
		json.put("parentid", models.getParentid());
		String p_name="";
		Organization p_model = organizationalService.findById(models.getParentid());
		
		if(p_model != null){
			p_name=p_model.getName();
		}
		json.put("parentname", p_name);
		
		ResponseUtils.renderJson(response, json.toString());
	}
	
	
	/**
	 * 删除单条数据
	 */
	@RequestMapping("cm_organization_delete")
	public void delete(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		Integer id = request.getParameter("id") != null && !"".equals(request.getParameter("id").trim()) ? Integer.parseInt(request.getParameter("id")) : null;
		try {
			if (id != null) {
				List<Organization> models = organizationalService.getList(id);
				if(models != null && models.size()>0){
					json.put("status", 1);
				}else{
					List<Object[]> totalList = userService.search("", new Long(id), null);
					if(totalList != null && totalList.size()>0){
						json.put("status", 2);
					}else{
						if (organizationalService.deleteById(id) > 0) {
							json.put("status", 0);
							log.Save_Log(request, session, "删除用户", "1", "id="+id+";删除成功","","");
						} else {
							json.put("status", -1);
						}
					}
				}
			} else {
				json.put("status", -1);
			} 
		} catch (Exception e) {
			log.Save_Log(request, session, "删除用户", "2", "id="+id+";错误:"+e.toString(),"","");
			json.put("status", -1);
		}
		ResponseUtils.renderJson(response, json.toString());
	}
	

}
