package com.cxgc.front.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cxgc.front.model.FunctionModular;
import com.cxgc.front.model.Modular;
import com.cxgc.front.model.Role;
import com.cxgc.front.model.RoleModular;
import com.cxgc.front.model.RolePermission;
import com.cxgc.front.service.FunctionModularService;
import com.cxgc.front.service.ModularService;
import com.cxgc.front.service.OperationLogService;
import com.cxgc.front.service.RoleModularService;
import com.cxgc.front.service.RolePermissionService;
import com.cxgc.front.service.RoleService;
import com.cxgc.front.service.UserService;
import com.cxgc.front.util.ResponseUtils;

import net.sf.json.JSONObject;

@Controller
public class RoleController {

	private static int PAGE_COUNT_10 = 10;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private ModularService mservice;

	@Autowired
	private FunctionModularService funtionModularService;
	
	@Autowired
	private UserService userervice;
	
	@Autowired
	private RolePermissionService rolePermissionService;
	
	@Autowired
	private OperationLogService<T> log;
	
	@Autowired
	private RoleModularService roleModularService;
	
	@RequestMapping("cm_role_list")
	public String list(ModelMap model, HttpServletRequest request, 
			HttpServletResponse response, HttpSession session,String s_name) {
		Integer pageNum = request.getParameter("pageNum") != null && !"".equals(request.getParameter("pageNum").trim()) ? Integer.parseInt(request.getParameter("pageNum")) : 0;
		Integer totalRecord = 0;
		totalRecord = roleService.getCount(s_name);
		
		if(pageNum <= 0){
			pageNum = 1;
		}
		if(pageNum > (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10){
			pageNum = (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10;
		}
		List<Role> roles = roleService.searchByPage(s_name, pageNum, PAGE_COUNT_10);
		
		model.put("totalPages", (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10);
		model.put("totalRecord", totalRecord);
		model.put("pageNum", pageNum);
		model.put("action", "cm_role_list");
		model.put("roles", roles);
		model.put("s_name", s_name);
		
		//查询菜单
		StringBuffer stbsql=new StringBuffer();
		stbsql.append("    1=1 and parentId=0  "); 
		StringBuffer stbsql2=new StringBuffer();
		stbsql2.append("   1=1 and parentId<>0  "); 
		List<Modular> plist = mservice.getlist(stbsql.toString());//菜单栏父类
		List<Modular> sList = mservice.getlist(stbsql2.toString());//菜单栏子类 
		List<FunctionModular> functionModulars = funtionModularService.getlistByParent(null);
		//页面返回值
		model.put("modular_f", plist);
		model.put("modular_list", sList);
		model.put("functionModulars", functionModulars);
		model.put("modularsize", funtionModularService.getCount() + 1);
		
		return "role/list";
	}

	@RequestMapping("cm_role_save")
	public void saveRole(ModelMap model, HttpServletRequest request, 
			HttpServletResponse response, HttpSession session) {
		String roleName = request.getParameter("addName");
		String describe = request.getParameter("adddescribe");
		String[] permissionIds = request.getParameterValues("addJurisdiction");
		
		List<Integer> perIds = new ArrayList<Integer>();
		for(String permissionId : permissionIds){
			Integer pId =permissionId != null && !"".equals(permissionId) ?Integer.parseInt(permissionId):0;
			perIds.add(pId);
		}

		JSONObject json = new JSONObject();
		try{
			List<Role> username = roleService.getList(roleName,Long.parseLong("0"));
			if(username != null && username.size() > 0){
				json.put("status", 2);
				ResponseUtils.renderJson(response, json.toString());
				return;
			}
			Role role = new Role();
			role.setRoleName(roleName);
			role.setIp(request.getRemoteAddr());
			role.setLastModifyTime(new Date());
			role.setdescribe(describe);

			Set<RolePermission> set = new HashSet<RolePermission>();
			List<RoleModular> roleModulars = new ArrayList<RoleModular>();
			if(perIds != null && perIds.size() > 0){
				Collections.sort(perIds);  
				for(Integer pId : perIds){
					RoleModular rm = new RoleModular();
					//Integer pId =permissionId != null && !"".equals(permissionId) ?Integer.parseInt(permissionId):0;
					if(pId == 0){
						continue;
					}
					FunctionModular fm = funtionModularService.findById(pId);

					rm.setRole(role);
					rm.setFunctionModular(fm);
					/*Modular modular = mservice.findById(pId);
					if(modular != null){
						RolePermission rp = new RolePermission();
						rp.setRole(role);
						rp.setModularUrl(modular.getModuleurl());
						rp.setModularQx("ALL");
						rp.setModularId(modular.getId());
						set.add(rp);
					}*/
					roleModulars.add(rm);
					
				}
//				role.setRolePermissions(set);
				role.setRoleModulars(roleModulars);
			}
			
			Role Saverole = roleService.save(role);
			json.put("status", 0);
			json.put("success", true);
			log.Save_Log(request, session, "新增角色", "1", "id="+Saverole.getId()+";RoleName="+roleName,"","");
		}catch(Exception e){
			e.printStackTrace();
			json.put("status", 1);
			log.Save_Log(request, session, "新增角色", "2", "username="+roleName+";错误:"+e.toString(),"","");
		}
		ResponseUtils.renderJson(response, json.toString());
	}
	
	@RequestMapping("cm_role_edit")
	public void editRole(ModelMap model, HttpServletRequest request, 
			HttpServletResponse response, HttpSession session) {
		String id = request.getParameter("id");
		Long roleId = id != null && !"".equals(id) ? Long.parseLong(id) : null;
		
		JSONObject json = new JSONObject();
		try{
			
			Role role = roleService.findById(roleId);
			
			/*String rolePermission = "";
			String con = "";
			
			for(RolePermission per : role.getRolePermissions()){
				rolePermission += con + per.getModularId();
				con = ",";
			}*/

			String functionModularIds = "";
			String con = "";
			for(RoleModular rm : role.getRoleModulars()){
				functionModularIds += con + rm.getFunctionModular().getId();
				con = ",";
			}

			json.put("id", role.getId());
			json.put("roleName", role.getRoleName());
			json.put("describe", role.getdescribe());
//			json.put("rolePermission", rolePermission);
			json.put("functionModularIds", functionModularIds);
			json.put("status", 0);
			json.put("success", true);
		}catch(Exception e){
			e.printStackTrace();
			json.put("status", 1);
		}
		ResponseUtils.renderJson(response, json.toString());
	}
	
	@RequestMapping("cm_role_update")
	public void updateRole(ModelMap model, HttpServletRequest request, 
			HttpServletResponse response, HttpSession session) {
		String id = request.getParameter("id");
		String roleName = request.getParameter("editName");
		String describe = request.getParameter("editdescribe");
		String permissionCon = request.getParameter("editJurisdiction");
		String[] permissionIds = request.getParameterValues("editJurisdiction");
		
		List<Integer> perIds = new ArrayList<Integer>();
		for(String permissionId : permissionIds){
			Integer pId =permissionId != null && !"".equals(permissionId) ?Integer.parseInt(permissionId):0;
			perIds.add(pId);
		}
		
		JSONObject json = new JSONObject();
		try{
			if(id == null){
				json.put("status", 1);
				ResponseUtils.renderJson(response, json.toString());
				return ;
			}
			List<Role> username = roleService.getList(roleName,Long.parseLong(id));
			if(username != null && username.size() > 0){
				json.put("status", 2);
				ResponseUtils.renderJson(response, json.toString());
				return;
			}
			
			roleModularService.deleteByRoleId(Integer.parseInt(id));
			//rolePermissionService.deleteById(Long.parseLong(id));
			//String[] permission = permissionCon.split(",");
			Role role = roleService.findById(Long.parseLong(id));
			role.setRoleName(roleName);
			role.setIp(request.getRemoteAddr());
			role.setLastModifyTime(new Date());
			role.setdescribe(describe);

			List<RoleModular> roleModulars = new ArrayList<RoleModular>();
			if(perIds != null && perIds.size() > 0){
				Collections.sort(perIds);  
				for(Integer pId : perIds){
					RoleModular rm = new RoleModular();
					//Integer pId =permissionId != null && !"".equals(permissionId) ?Integer.parseInt(permissionId):0;
					if(pId == 0){
						continue;
					}
					FunctionModular fm = funtionModularService.findById(pId);
					rm.setRole(role);
					rm.setFunctionModular(fm);
					roleModulars.add(rm);
					
				}
//				role.setRolePermissions(set);
				role.setRoleModulars(roleModulars);
			}
			/*Set<RolePermission> set = new HashSet<RolePermission>();
			if(permissionIds != null){
				for(String permissionId : permissionIds){
					Integer pId =permissionId != null && !"".equals(permissionId) ?Integer.parseInt(permissionId):0;
					if(pId == 0){
						continue;
					}
					Modular modular = mservice.findById(pId);
					if(modular != null){
						RolePermission rp = new RolePermission();
						rp.setRole(role);
						rp.setModularUrl(modular.getModuleurl());
						rp.setModularQx("ALL");
						rp.setModularId(modular.getId());
						set.add(rp);
					}
				}
				role.setRolePermissions(set);
			}*/
			
			roleService.update(role);
			json.put("status", 0);
			json.put("success", true);
			log.Save_Log(request, session, "修改角色", "1", "id="+id+";RoleName="+roleName,"","");
		}catch(Exception e){
			e.printStackTrace();
			json.put("status", 1);
			log.Save_Log(request, session, "修改角色", "2", "id="+id+";username="+roleName+";错误:"+e.toString(),"","");
		}
		ResponseUtils.renderJson(response, json.toString());
	}
	
	/*删除单条数据*/
	@RequestMapping("cm_role_delete")
	public void deleteRole(ModelMap model, HttpServletRequest request, 
			HttpServletResponse response, HttpSession session) {
		JSONObject json = new JSONObject();
		String id = request.getParameter("id");
		try{
			if(id == null){
				json.put("status", 1);
				ResponseUtils.renderJson(response, json.toString());
				return ;
			}
			List<Object[]> users = userervice.search("",null,Long.parseLong(id));
			if(users != null && users.size()>0){
				json.put("status", 2);
				ResponseUtils.renderJson(response, json.toString());
				return;
			}
			
			rolePermissionService.deleteById(Long.parseLong(id));
			roleService.deleteById(Integer.parseInt(id));
			json.put("status", 0);
			json.put("success", true);
			log.Save_Log(request, session, "删除角色", "1", "id="+id+";删除成功","","");
		}catch(Exception e){
			e.printStackTrace();
			json.put("status", 3);
			json.put("success", false);
			log.Save_Log(request, session, "删除角色", "2", "id="+id+";错误:"+e.toString(),"","");
		}
		ResponseUtils.renderJson(response, json.toString());
	}

	/*批量删除*/
	@RequestMapping("cm_role_batchdelete")
	public void batchDelete(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		int i = 0;
		String[] ids = request.getParameterValues("ids");
		JSONObject json = new JSONObject();
		if (ids != null && ids.length > 0) {
			for (String id : ids) {
				List<Object[]> users = userervice.search("",null,Long.parseLong(id));
				if(users != null && users.size()>0){
					
				}else{
					rolePermissionService.deleteById(Long.parseLong(id));
					i = i + roleService.deleteById(Integer.parseInt(id));
				}
			}
		}
		if (i > 0) {
			if(i==ids.length){
				json.put("success", true);
				json.put("status", 0);
				ResponseUtils.renderHtml(response, json.toString());
			}else{
				json.put("success", true);
				json.put("status", 1);
				ResponseUtils.renderHtml(response, json.toString());
			}
			log.Save_Log(request, session, "删除角色", "1", "ids="+ids.toString()+";删除成功","","");
			return;
		} else {
			json.put("success", false);
			json.put("status", 3);
			log.Save_Log(request, session, "删除角色", "2", "ids="+ids.toString()+";删除失败","","");
			ResponseUtils.renderHtml(response, json.toString());
			return;
		}
	}
}