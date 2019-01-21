package com.cxgc.front.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cxgc.front.model.THelp;
import com.cxgc.front.model.THelpType;
import com.cxgc.front.model.User;
import com.cxgc.front.service.THelpService;
import com.cxgc.front.service.THelpTypeService;
import com.cxgc.front.util.StacticVariable;

@Controller
public class HelpCenterController {

	@Autowired
	private THelpService thelpservice;
	
	@Autowired
	private THelpTypeService typeservice;
	
	@RequestMapping("/go_helpcenter_{pageindex}")
	public String toBS_content(@PathVariable int pageindex,ModelMap model, HttpServletRequest req, HttpServletResponse res) {
		String[] per=new String[5];//为类型参数保留
		//查询最热帮助
		List<THelp> templist=thelpservice.getHelpByHotDesc(pageindex, StacticVariable.getPageCount());
		//查询父类的type
		List<THelpType>  typelist=typeservice.getRegionsByFid(null);
		model.put("typelist",typelist);
		model.put("helpls", templist); 
		
		
		return "helpcenter/helpcenterlist";
	}
	
	@RequestMapping("/help_list")
	public String toHelp_content(ModelMap model, HttpServletRequest req, HttpServletResponse res) {
		Integer pageNum = req.getParameter("pageNum") != null && !"".equals(req.getParameter("pageNum").trim()) ? Integer.parseInt(req.getParameter("pageNum")) : 1;
		String title=req.getParameter("sectitle")==null?"":req.getParameter("sectitle");
		String cont=req.getParameter("seccont")==null?"":req.getParameter("seccont");
		List<THelpType>  typelist=typeservice.getRegionsByFid(null); 
		String[] type=new String[typelist.size()] ;  
		for(int i=0;i<typelist.size();i++) {
			type[i]=req.getParameter("sec"+typelist.get(i).getId());
		}
		StringBuffer  sql=new StringBuffer(" select  count(id) from THelp where 1=1");
		int totalRecord =thelpservice.getcount(sql.toString()); 
		if(pageNum <= 0){
			pageNum = 1;
		}
		if(pageNum > (totalRecord + StacticVariable.getPageCount() -1) / StacticVariable.getPageCount()){
			pageNum = (totalRecord + StacticVariable.getPageCount() -1) / StacticVariable.getPageCount();
		} 
		model.put("totalPages", (totalRecord + StacticVariable.getPageCount() -1) / StacticVariable.getPageCount());
		model.put("totalRecord", totalRecord);
		model.put("pageNum", pageNum); 
		List<THelp> templist=thelpservice.getTHelpByTypeDesc(pageNum, StacticVariable.getPageCount(),type, title, cont); 
			
		model.put("typelist",typelist);
		model.put("templist", templist); 
		return "helpcenter/helpmanager";
	}
	
	@RequestMapping("/addhelp")
	public ModelAndView addHelp(ModelMap model, HttpServletRequest req, HttpServletResponse res,HttpSession sess,RedirectAttributes attr) {
		ModelAndView mv = new ModelAndView(); 
		List<THelpType>  typelist=typeservice.getRegionsByFid(null);
		String title=req.getParameter("addtitle");
		String con=req.getParameter("addcont");
		String[] type=new String[typelist.size()] ;  
		for(int i=0;i<typelist.size();i++) {
			type[i]=req.getParameter("fat"+typelist.get(i).getId());
		}
		User user=(User) sess.getAttribute("user");
		if(user==null){ 
			 mv.setViewName("redirect:/");
			 attr.addFlashAttribute("sulogin","timeout");
			return mv; 
		}
		THelp temp=new THelp();
		temp.setTitle(title);
		temp.setDatail(con);
		for(int i=0;i<type.length;i++) { 
			switch (i) {
			case 0:
				temp.setType1(type[i]);
				break;
			case 1:
				temp.setType2(type[i]);
				break;
			case 2:
				temp.setType3(type[i]);
				break;
			case 3:
				temp.setType4(type[i]);
				break;
			case 4:
				temp.setType5(type[i]);
				break;  
			}  
		}
		temp.setCuserid(user.getId());
		temp.setCusername(user.getUsername());
		temp.setCreatetime(new Date()); 
		int aaa=thelpservice.saveTHelp(temp);
		if(aaa!=1) {
			mv.setViewName("redirect:help_list");
			attr.addFlashAttribute("sulogin","fail");
		}
		else {
			mv.setViewName("redirect:help_list");
			attr.addFlashAttribute("sulogin","succ");
		} 
		return mv;
	}

	@RequestMapping("/getinfoforupdatehelp")
	public @ResponseBody Map<String, Object> toCheckPass(ModelMap model, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		String helpid = req.getParameter("helpid");
		List<THelpType>  typelist=typeservice.getRegionsByFid(null);	
		THelp temp = thelpservice.getHelpById(Integer.parseInt(helpid));
		map.put("temp", typelist.size());
		for(int i=0;i<typelist.size();i++){
			switch (i) {
			case 0:
				map.put("xgfat1", temp.getType1());
				break;
			case 1:
				map.put("xgfat2", temp.getType2());
				break;
			case 2:
				map.put("xgfat3", temp.getType3());
				break;
			case 3:
				map.put("xgfat4", temp.getType4());
				break;
			case 4:
				map.put("xgfat5", temp.getType5());
				break;
			}
		}		
		map.put("title", temp.getTitle());
		map.put("cont", temp.getDatail());
		map.put("hid", helpid);
		return map;
	}
	
	
	@RequestMapping("/xghelp_{hid}")
	public ModelAndView xgHelp(@PathVariable int hid,ModelMap model, HttpServletRequest req, HttpServletResponse res,HttpSession sess,RedirectAttributes attr) {
		ModelAndView mv = new ModelAndView(); 
		THelp temp=thelpservice.getHelpById(hid);
		 List<THelpType>  typelist=typeservice.getRegionsByFid(null);
		String title=req.getParameter("xgtitle");
		String con=req.getParameter("xgcont"); 
		for(int i=0;i<typelist.size();i++) {
			switch (i) {
			case 0:
				temp.setType1(req.getParameter("xgfat"+(i+1)));
				break;
			case 1:
				temp.setType2(req.getParameter("xgfat"+(i+1)));
				break;
			case 2:
				temp.setType3(req.getParameter("xgfat"+(i+1)));
				break;
			case 3:
				temp.setType4(req.getParameter("xgfat"+(i+1)));
				break;
			case 4:
				temp.setType5(req.getParameter("xgfat"+(i+1)));
				break;  
			}  
		}
		User user=(User) sess.getAttribute("user");
		if(user==null){ 
			 mv.setViewName("redirect:/");
			 attr.addFlashAttribute("sulogin","timeout");
			return mv; 
		}
		temp.setTitle(title);
		temp.setDatail(con);
		temp.setEdituserid(user.getId());
		temp.setEditusername(user.getUsername());
		temp.setEdittime(new Date()); 
		thelpservice.mergeTHelp(temp); 
		mv.setViewName("redirect:help_list");
		attr.addFlashAttribute("sulogin","succ"); 
		return mv;
	}
	
	@RequestMapping("/deletehelp")
	public @ResponseBody Map<String, Object> deleteHelp(ModelMap model, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		String helpid = req.getParameter("helpid");
		THelp temp = thelpservice.getHelpById(Integer.parseInt(helpid));
		int aaa=thelpservice.deleteTHelp(temp); 
		if(aaa!=1) {
			map.put("sta", "fail");
		}
		else
		{
			map.put("sta", "succ");
		}
		return map;
	}
}
