package com.cxgc.front.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cxgc.front.model.Guestbook;
import com.cxgc.front.model.GuestbookCase;
import com.cxgc.front.model.User;
import com.cxgc.front.service.GuestbookCaseService;
import com.cxgc.front.service.GuestbookService;
import com.cxgc.front.util.StacticVariable;

/** 案件处理Controller
 * @author Hitdy
 *
 */
@Controller
public class CaseController {
 
	
	@Autowired
	private GuestbookService<T> guestService;
	
	@Autowired
	private GuestbookCaseService caseservice;
	
	@RequestMapping("cm_case_association")
	public ModelAndView getXfList(ModelMap model, HttpServletRequest req, HttpServletResponse res, HttpSession sess,
			RedirectAttributes attr,String informantName,String informantCardNo,String createTime_star,
			String createTime_end,String complaintNumber,String reportedName) { 
		int pagesize = StacticVariable.getPageCount();
		ModelAndView mv = new ModelAndView();
		User user = (User) sess.getAttribute("user");
		if (user == null) {
			mv.setViewName("redirect:/");
			attr.addFlashAttribute("sulogin", "timeout");
			return mv;
		}
		else
		{ 
			
			
			Integer pageNum = req.getParameter("pageNum") != null && !"".equals(req.getParameter("pageNum").trim()) ? Integer.parseInt(req.getParameter("pageNum")) : 1;
			
			String ctg = req.getParameter("ctgId");
			Integer ctgId=null;
			if(ctg != null && !"==请选择==".equals(ctg)){
				ctgId = Integer.parseInt(ctg);
			}
			int totalRecord = guestService.getPageCount(informantName, informantCardNo, createTime_star, createTime_end, complaintNumber, null, ctgId, null,reportedName,2);
			if(pageNum <= 0){
				pageNum = 1;
			}
			if(pageNum > (totalRecord + pagesize -1) / pagesize){
				pageNum = (totalRecord + pagesize -1) / pagesize;
			}
			List<Guestbook> GuestList = guestService.getListByPage(informantName, informantCardNo, createTime_star, createTime_end, complaintNumber, null, ctgId, null,reportedName,2, pageNum, pagesize);
			
			model.put("totalPages", (totalRecord + pagesize -1) / pagesize);
			model.put("totalRecord", totalRecord);
			model.put("pageNum", pageNum); 
			model.put("GuestList", GuestList);
			model.put("informantName", informantName);
			model.put("informantCardNo", informantCardNo);
			model.put("createTime_star", createTime_star);
			model.put("createTime_end", createTime_end);
			model.put("complaintNumber", complaintNumber);
			model.put("reportedName", reportedName);
			model.put("ctgId", ctgId);
			mv.setViewName("petitionhandle/caselist");
			return mv;
		}
		
	}

	@RequestMapping("cm_getcaselist_{xfid}")
	public ModelAndView getcaseList(ModelMap model,@PathVariable int xfid, HttpServletRequest req, HttpServletResponse res, HttpSession sess,
			RedirectAttributes attr,String createTime_star,String createTime_end,String reportedName) { 
		int pagesize = StacticVariable.getPageCount();
		ModelAndView mv = new ModelAndView();
		User user = (User) sess.getAttribute("user");
		if (user == null) {
			mv.setViewName("redirect:/");
			attr.addFlashAttribute("sulogin", "timeout");
			return mv;
		}
		else
		{ 
			
			List<GuestbookCase> casedls=caseservice.getCase(xfid, 0);
			Integer pageNum = req.getParameter("pageNum") != null && !"".equals(req.getParameter("pageNum").trim()) ? Integer.parseInt(req.getParameter("pageNum")) : 1;
			 
			int totalRecord = guestService.getPageCountNoxfid(null, null, createTime_star, createTime_end, null, null, null, null,reportedName,2,xfid);
			if(pageNum <= 0){
				pageNum = 1;
			}
			if(pageNum > (totalRecord + pagesize -1) / pagesize){
				pageNum = (totalRecord + pagesize -1) / pagesize;
			}
			List<Guestbook> GuestList = guestService.getListByPageNoXf(null, null, createTime_star, createTime_end, null, null, null, null,reportedName,2, pageNum, pagesize,xfid);
			
			model.put("totalPages", (totalRecord + pagesize -1) / pagesize);
			model.put("totalRecord", totalRecord);
			model.put("pageNum", pageNum); 
			model.put("GuestList", GuestList); 
			model.put("createTime_star", createTime_star);
			model.put("createTime_end", createTime_end); 
			model.put("reportedName", reportedName); 
			model.put("xfid", xfid); 
			model.put("casedls", casedls);
			mv.setViewName("petitionhandle/seccaselist");
			return mv;
		} 
	}
	
	
	@RequestMapping("docase_{xfid}")
	public ModelAndView caseDo(ModelMap model,@PathVariable int xfid, HttpServletRequest req, HttpServletResponse res, HttpSession sess,RedirectAttributes attr) { 
		ModelAndView mv = new ModelAndView();
		User user = (User) sess.getAttribute("user");
		if (user == null) {
			mv.setViewName("redirect:/");
			attr.addFlashAttribute("sulogin", "timeout");
			return mv;
		}
		else { 
			List<GuestbookCase> casedls=caseservice.getCase(xfid, 0);
			for(int i=0;i<casedls.size();i++) {
				caseservice.deleteCase(casedls.get(i));
			}
			
			String[] caseno=req.getParameterValues("c1"); 
			for(int i=0;i<caseno.length;i++){
				GuestbookCase  temp=new GuestbookCase();
				temp.setLearer(xfid);
				temp.setFollower(Integer.parseInt(caseno[i]));
				if(caseservice.saveCase(temp)==0){
					mv.setViewName("redirect:/cm_getcaselist_"+xfid);
					return mv;
				 }
			} 
			model.put("xfid", xfid); 
			mv.setViewName("redirect:/cm_getcaselist_"+xfid);
			attr.addFlashAttribute("sulogin","suss"); 
			return mv;
		}
		
	}
	
	
}
