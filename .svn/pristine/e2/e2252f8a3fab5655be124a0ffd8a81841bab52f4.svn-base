package com.cxgc.front.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cxgc.front.model.FunctionModular;
import com.cxgc.front.model.RoleModular;
import com.cxgc.front.model.User;

@Controller
public class IndexController {
	
	private String getFunctionModular(List<RoleModular> rms , Integer functionModularId){
		FunctionModular fm = null;
		for(RoleModular rm : rms){
			if(rm.getFunctionModular().getId() == functionModularId){
				fm = rm.getFunctionModular();
				break;
			}
		}
		List<Integer> rmId = new ArrayList<Integer>();
		for(RoleModular rm : rms){
			rmId.add(rm.getFunctionModular().getId());
		}
		if(fm != null && fm.getChilds() != null && fm.getChilds().size() > 0){
			for(FunctionModular fModular : fm.getChilds()){
				if(!rmId.contains(fModular.getId())){
					continue;
				}
				if(fModular.getModuleUrl() == null || "".equals(fModular.getModuleUrl().trim())){
					for(FunctionModular fModular1 : fModular.getChilds()){
						return "redirect:" + fModular1.getModuleUrl().substring(1, fModular1.getModuleUrl().length());
					}
				}else{
					return "redirect:" + fModular.getModuleUrl().substring(1, fModular.getModuleUrl().length());
				}
			}
		}
		return null;
	}
	
	@RequestMapping("cm_petition_manage")
	public String booking(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		String res = "";
		
		User user = (User)session.getAttribute("user");
		if(user==null){
			return "redirect:login";
		}
		
		List<RoleModular> rms = user.getRole().getRoleModulars();
		if(rms != null && rms.size() > 0){
			return getFunctionModular(rms,1);
		}
		
		return res;
	}
	
	@RequestMapping("cm_petition_handle")
	public String entranceExit(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		String res = "";
		
		User user = (User)session.getAttribute("user");
		if(user==null){
			return "redirect:login";
		}
		List<RoleModular> rms = user.getRole().getRoleModulars();
		if(rms != null && rms.size() > 0){
			return getFunctionModular(rms, 2);
		}
		
		return res;
	}

	@RequestMapping("cm_petition_query")
	public String personCheck(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		String res = "";
		
		User user = (User)session.getAttribute("user");
		if(user==null){
			return "redirect:login";
		}
		List<RoleModular> rms = user.getRole().getRoleModulars();
		if(rms != null && rms.size() > 0){
			return getFunctionModular(rms, 3);
		}
		
		return res;
	}

	@RequestMapping("cm_statistical_report")
	public String goods(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		String res = "";
		
		User user = (User)session.getAttribute("user");
		if(user==null){
			return "redirect:login";
		}
		List<RoleModular> rms = user.getRole().getRoleModulars();
		if(rms != null && rms.size() > 0){
			return getFunctionModular(rms, 4);
		}
		
		return res;
	}

	@RequestMapping("cm_task_management")
	public String roomDistribution(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		String res = "";
		
		User user = (User)session.getAttribute("user");
		if(user==null){
			return "redirect:login";
		}
		List<RoleModular> rms = user.getRole().getRoleModulars();
		if(rms != null && rms.size() > 0){
			return getFunctionModular(rms, 5);
		}
		
		return res;
	}

	@RequestMapping("cm_system_setup")
	public String interrogation(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		String res = "";
		
		User user = (User)session.getAttribute("user");
		if(user==null){
			return "redirect:login";
		}
		List<RoleModular> rms = user.getRole().getRoleModulars();
		if(rms != null && rms.size() > 0){
			return getFunctionModular(rms, 6);
		}
		
		return res;
	}

	
	
	
	
}
