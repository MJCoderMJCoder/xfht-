package com.cxgc.front.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.formula.functions.T;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cxgc.front.model.Dictionary;
import com.cxgc.front.model.Guestbook;
import com.cxgc.front.model.GuestbookAttr;
import com.cxgc.front.model.GuestbookExt;
import com.cxgc.front.model.Organization;
import com.cxgc.front.model.User;
import com.cxgc.front.service.DictionaryService;
import com.cxgc.front.service.GuestbookAttrService;
import com.cxgc.front.service.GuestbookService;
import com.cxgc.front.service.OrganizationalService;
import com.cxgc.front.service.UserService;
import com.cxgc.front.util.DateUtils;
import com.cxgc.front.util.NumberUtil;
import com.cxgc.front.util.ResponseUtils;
import com.cxgc.front.util.StacticVariable;
import com.cxgc.front.util.picProcessUtil;

import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import net.sf.json.JSONObject;

/**
 * 网上信访
 * @author Administrator
 *
 */
@Controller
public class OnlinePetitionController {
	
	@Autowired
	private GuestbookService<T> guestbookService;
	
	@Autowired
	private GuestbookAttrService<T> guestbookAttrService;
	
	@Autowired
	private DictionaryService<T> dictionaryService;
	
	@Autowired
	private GuestbookAttrService<T> attrService;
	
	@Autowired
	private OrganizationalService organizationalService;
	
	@Autowired
	private UserService userService;
	
	/**
	 * 网上信访列表
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("cm_online_petition_list")
	public String cm_online_petition_list(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		int pagesize = StacticVariable.getPageCount();
		
		// 获取用户对象
        User user = (User)session.getAttribute("user");
		
		Integer pageNum = request.getParameter("pageNum") != null 
				&& !"".equals(request.getParameter("pageNum").trim()) 
				? Integer.parseInt(request.getParameter("pageNum")) : 1;
		String startTimeTemp = request.getParameter("startTimeTemp");
		String endTimeTemp = request.getParameter("endTimeTemp");
		Date startTime = DateUtils.getStr2Date7(startTimeTemp + " 00:00:00");
		Date endTime = DateUtils.getStr2Date7(endTimeTemp + " 23:59:59");
		String complaintNumber = request.getParameter("complaintNumber");
		String matterCategory = request.getParameter("matterCategory");
		
		int totalRecord = guestbookService.getPageCount3(startTime, endTime, complaintNumber, 
				matterCategory, 1, user.getId());
		
		if(pageNum <= 0){
			pageNum = 1;
		}
		if(pageNum > (totalRecord + pagesize -1) / pagesize){
			pageNum = (totalRecord + pagesize -1) / pagesize;
		}
		
		List<Guestbook> guestBookList = guestbookService.getListByPage3(startTime, endTime, 
				complaintNumber, matterCategory, 1, user.getId(), pageNum, pagesize);
		
		List<Dictionary> matterCategoryList = dictionaryService.getList(null, null, "matterCategory");
		 
		List<Dictionary> assignModalityList = dictionaryService.getList(null, 
				null, "superior_assign_modality");
		
		model.put("totalPages", (totalRecord + pagesize -1) / pagesize);
		model.put("totalRecord", totalRecord);
		model.put("pageNum", pageNum);
		
		model.put("startTimeTemp", startTimeTemp);
		model.put("endTimeTemp", endTimeTemp);
		model.put("complaintNumber", complaintNumber);
		model.put("matterCategory", matterCategory);
		model.put("guestBookList", guestBookList);
		model.put("matterCategoryList", matterCategoryList);
		model.put("assignModalityList", assignModalityList);
		
		String res = "publicVoiceRegister/onlinePetition/onlinePetitionList";
		return res;
	}
	
	/**
	 * 添加跳转
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("cm_online_petition_add")
	public String cm_online_petition_add(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		List<Dictionary> genderList = dictionaryService.getList(null, null, "gender");
		List<Dictionary> politicalFaceList = dictionaryService.getList(null, null, "political_face");
		List<Dictionary> informantGradeList = dictionaryService.getList(null, null, "informantGrade");
		List<Dictionary> matterCategoryList = dictionaryService.getList(null, null, "matterCategory");
		List<Dictionary> levelList = dictionaryService.getList(null, null, "level");
		
		model.put("genderList", genderList);
		model.put("politicalFaceList", politicalFaceList);
		model.put("informantGradeList", informantGradeList);
		model.put("matterCategoryList", matterCategoryList);
		model.put("levelList", levelList);
		
		String complaintNumber = NumberUtil.getRandomCode("xf");
		model.put("complaintNumber", complaintNumber);
		model.put("createTime", DateUtils.getDate2Str7(new Date()));
		
		String res = "publicVoiceRegister/onlinePetition/onlinePetitionAdd";
		return res;
	}
	
	/**
	 * 查看
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("cm_online_petition_look")
	public String cm_online_petition_look(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		Integer guestbookId = request.getParameter("guestbookId") != null 
				&& !"".equals(request.getParameter("guestbookId").trim()) 
				? Integer.parseInt(request.getParameter("guestbookId")) : null;
				
		Guestbook guestbook = guestbookService.findById(guestbookId);	
		
		model.put("guestbook", guestbook);
				
		String res = "publicVoiceRegister/onlinePetition/onlinePetitionLook";
		return res;
	}
	
	/**
	 * 修改跳转
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("cm_online_petition_edit")
	public String cm_online_petition_edit(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		Integer guestbookId = request.getParameter("guestbookId") != null 
				&& !"".equals(request.getParameter("guestbookId").trim()) 
				? Integer.parseInt(request.getParameter("guestbookId")) : null;
				
		Guestbook guestbook = guestbookService.findById(guestbookId);	
		List<Dictionary> genderList = dictionaryService.getList(null, null, "gender");
		List<Dictionary> politicalFaceList = dictionaryService.getList(null, null, "political_face");
		List<Dictionary> informantGradeList = dictionaryService.getList(null, null, "informantGrade");
		List<Dictionary> matterCategoryList = dictionaryService.getList(null, null, "matterCategory");
		List<Dictionary> levelList = dictionaryService.getList(null, null, "level");
		
		model.put("genderList", genderList);
		model.put("politicalFaceList", politicalFaceList);
		model.put("informantGradeList", informantGradeList);
		model.put("matterCategoryList", matterCategoryList);
		model.put("levelList", levelList);
		
		model.put("genderList", genderList);
		model.put("politicalFaceList", politicalFaceList);
		model.put("informantGradeList", informantGradeList);
		model.put("matterCategoryList", matterCategoryList);
		model.put("levelList", levelList);
		model.put("guestbook", guestbook);
		
		List<User> userList = userService.getListByOrganizational(guestbook.getExt().getProcessingCompany().getId());
		
		model.put("userList", userList);
		
		String res = "publicVoiceRegister/onlinePetition/onlinePetitionEdit";
		return res;
	}
	
	/**
	 * 添加、修改保存
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("cm_online_petition_save")
	public void cm_online_petition_save(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		Integer guestbookId = request.getParameter("guestbookId") != null && !"".equals(request.getParameter("guestbookId").trim()) ? Integer.parseInt(request.getParameter("guestbookId")) : null;
		String complaintNumber = request.getParameter("complaintNumber");
		Date createTime = DateUtils.getStr2Date7(request.getParameter("createTime"));
		String informantName = request.getParameter("informantName");
		String informantCardNo = request.getParameter("informantCardNo");
		String informantLevel = request.getParameter("informantLevel");
		String informantpoliticalFace = request.getParameter("informantpoliticalFace");
		String informantPhone = request.getParameter("informantPhone");
		String informantPlace = request.getParameter("informantPlace");
		String title = request.getParameter("title");
		String matterCategory = request.getParameter("matterCategory");
		String matterDetailed = request.getParameter("matterDetailed");
		Boolean reviewOpinions = "1".equals(request.getParameter("reviewOpinions")) ? true : false;
		Boolean accept = "1".equals(request.getParameter("accept")) ? true : false;
		Boolean administrativeReconsideration = "1".equals(request.getParameter("administrativeReconsideration")) ? true : false;
		Boolean publicity = "1".equals(request.getParameter("publicity")) ? true : false;
		String appeals = request.getParameter("appeals");
		String preliminaryOpinion = request.getParameter("preliminaryOpinion");
		Integer processingCompany = request.getParameter("processingCompany") != null && !"".equals(request.getParameter("processingCompany").trim()) ? Integer.parseInt(request.getParameter("processingCompany")) : null;
		Integer processingHead = request.getParameter("processingHead") != null && !"".equals(request.getParameter("processingHead").trim()) ? Integer.parseInt(request.getParameter("processingHead")) : null;
		String reportedName = request.getParameter("reportedName");
		String reportedCompany = request.getParameter("reportedCompany");
		String reportedDuties = request.getParameter("reportedDuties");
		String reportedLevel = request.getParameter("reportedLevel");
		
		String fileDocPaths = request.getParameter("fileDocPath");
		String fileMediaPaths = request.getParameter("fileMediaPath");
		String fileVideoPaths= request.getParameter("fileVideoPath");
		String fileImagePaths = request.getParameter("fileImagePath");
		
		String fileDocOriginalName = request.getParameter("fileDocOriginalName");
		String fileMediaOriginalName = request.getParameter("fileMediaOriginalName");
		String fileVideoOriginalName = request.getParameter("fileVideoOriginalName");
		String fileImageOriginalName = request.getParameter("fileImageOriginalName");
		
		// 获取用户对象
        User user = (User)session.getAttribute("user");
        
		if (guestbookId == null) {
			
			Guestbook g = new Guestbook();
			g.setSiteId(1);
			g.setCtgId(1);
			g.setIp(request.getRemoteAddr());
			g.setCreateTime(createTime);
			g.setChecked(false);
			g.setRecommend(false);
			g.setComplaintNumber(complaintNumber);
			g.setCreateUser(user);
			g.setStatus(1);
			g.setAppeals(appeals);
			g.setPreliminaryOpinion(preliminaryOpinion);
			
			GuestbookExt e = new GuestbookExt();
			e.setInformantName(informantName);
			e.setInformantPhone(informantPhone);
			e.setInformantCardNo(informantCardNo);
			e.setInformantLevel(informantLevel);
			e.setInformantpoliticalFace(informantpoliticalFace);
			e.setInformantPlace(informantPlace);
			e.setReportedName(reportedName);
			e.setReportedCompany(reportedCompany);
			e.setReportedDuties(reportedDuties);
			e.setReportedLevel(reportedLevel);
			e.setMatterCategory(matterCategory);
			e.setProcessingCompany(organizationalService.findById(processingCompany));
			e.setProcessingHead(userService.findById(processingHead));
			e.setTitle(title);
			e.setMatterCategory(matterCategory);
			e.setMatterDetailed(matterDetailed);
			e.setReviewOpinions(reviewOpinions);
			e.setAccept(accept);
			e.setAdministrativeReconsideration(administrativeReconsideration);
			e.setPublicity(publicity);
			
			Guestbook cg = guestbookService.save(g, e);
			
			ArrayList<GuestbookAttr> list = new ArrayList<>();
			
			if(fileDocPaths!=null && !"".equals(fileDocPaths)){
				String[] fileDocPathTemp = fileDocPaths.split(",");
				String[] fileDocOriginalNameTemp = fileDocOriginalName.split("\\|");
				
				for (int i = 0; i < fileDocPathTemp.length; i++) {
					GuestbookAttr a = new GuestbookAttr();
					a.setGuestbook(cg);
					a.setName(fileDocOriginalNameTemp[i]);
					a.setPath(fileDocPathTemp[i]);
					a.setType(1);
					list.add(a);
					attrService.save(a);
				}
			}
			
			if(fileMediaPaths!=null && !"".equals(fileMediaPaths)){
				String[] fileMediaPathsTemp = fileMediaPaths.split(",");
				String[] fileMediaOriginalNameTemp = fileMediaOriginalName.split("\\|");
				
				for (int i = 0; i < fileMediaPathsTemp.length; i++) {
					GuestbookAttr a = new GuestbookAttr();
					a.setGuestbook(cg);
					a.setName(fileMediaOriginalNameTemp[i]);
					a.setPath(fileMediaPathsTemp[i]);
					a.setType(2);
					list.add(a);
					attrService.save(a);
				}
			}
			
			if(fileVideoPaths!=null && !"".equals(fileVideoPaths)){
				String[] fileVideoPathsTemp = fileVideoPaths.split(",");
				String[] fileVideoOriginalNameTemp = fileVideoOriginalName.split("\\|");
				
				for (int i = 0; i < fileVideoPathsTemp.length; i++) {
					GuestbookAttr a = new GuestbookAttr();
					a.setGuestbook(cg);
					a.setName(fileVideoOriginalNameTemp[i]);
					a.setPath(fileVideoPathsTemp[i]);
					a.setType(3);
					list.add(a);
					attrService.save(a);
				}
			}
			
			if(fileImagePaths!=null && !"".equals(fileImagePaths)){
				String[] fileImagePathsTemp = fileImagePaths.split(",");
				String[] fileImageOriginalNameTemp = fileImageOriginalName.split("\\|");
				
				for (int i = 0; i < fileImagePathsTemp.length; i++) {
					GuestbookAttr a = new GuestbookAttr();
					a.setGuestbook(cg);
					a.setName(fileImageOriginalNameTemp[i]);
					a.setPath(fileImagePathsTemp[i]);
					a.setType(4);
					list.add(a);
					attrService.save(a);
				}
				
			}
			cg.setAttachments(list);
			
			Guestbook u = guestbookService.update(cg);
			
			JSONObject json = new JSONObject();
			
			if(u!=null){
				json.put("success", true);
				json.put("status", 0);
			}else {
				json.put("success", true);
				json.put("status", 1);

			}
			
			ResponseUtils.renderJson(response, json.toString());
		} else {
			
			Guestbook g = guestbookService.findById(guestbookId);
			g.setSiteId(1);
			g.setCtgId(1);
			g.setIp(request.getRemoteAddr());
			g.setCreateTime(createTime);
			g.setChecked(false);
			g.setRecommend(false);
			g.setComplaintNumber(complaintNumber);
			g.setCreateUser(user);
			g.setAppeals(appeals);
			g.setPreliminaryOpinion(preliminaryOpinion);
			
			GuestbookExt e = g.getExt();
			e.setInformantName(informantName);
			e.setInformantPhone(informantPhone);
			e.setInformantCardNo(informantCardNo);
			e.setInformantLevel(informantLevel);
			e.setInformantpoliticalFace(informantpoliticalFace);
			e.setInformantPlace(informantPlace);
			e.setReportedName(reportedName);
			e.setReportedDuties(reportedDuties);
			e.setReportedLevel(reportedLevel);
			e.setMatterCategory(matterCategory);
			e.setProcessingCompany(organizationalService.findById(processingCompany));
			e.setProcessingHead(userService.findById(processingHead));
			e.setTitle(title);
			e.setMatterCategory(matterCategory);
			e.setMatterDetailed(matterDetailed);
			e.setReviewOpinions(reviewOpinions);
			e.setAccept(accept);
			e.setAdministrativeReconsideration(administrativeReconsideration);
			e.setPublicity(publicity);
			
			Guestbook cg = guestbookService.save(g, e);
			
			ArrayList<GuestbookAttr> list = new ArrayList<>();
			
			if(fileDocPaths!=null && !"".equals(fileDocPaths)){
				
				attrService.deleteByList(cg.getId(), 1);
				
				String[] fileDocPathTemp = fileDocPaths.split(",");
				String[] fileDocOriginalNameTemp = fileDocOriginalName.split("\\|");
				
				for (int i = 0; i < fileDocPathTemp.length; i++) {
					GuestbookAttr a = new GuestbookAttr();
					a.setGuestbook(cg);
					a.setName(fileDocOriginalNameTemp[i]);
					a.setPath(fileDocPathTemp[i]);
					a.setType(1);
					list.add(a);
					attrService.save(a);
				}
			}
			
			if(fileMediaPaths!=null && !"".equals(fileMediaPaths)){
				
				attrService.deleteByList(cg.getId(), 2);
				
				String[] fileMediaPathsTemp = fileMediaPaths.split(",");
				String[] fileMediaOriginalNameTemp = fileMediaOriginalName.split("\\|");
				
				for (int i = 0; i < fileMediaPathsTemp.length; i++) {
					GuestbookAttr a = new GuestbookAttr();
					a.setGuestbook(cg);
					a.setName(fileMediaOriginalNameTemp[i]);
					a.setPath(fileMediaPathsTemp[i]);
					a.setType(2);
					list.add(a);
					attrService.save(a);
				}
			}
			
			if(fileVideoPaths!=null && !"".equals(fileVideoPaths)){
				
				attrService.deleteByList(cg.getId(), 3);
				
				String[] fileVideoPathsTemp = fileVideoPaths.split(",");
				String[] fileVideoOriginalNameTemp = fileVideoOriginalName.split("\\|");
				
				for (int i = 0; i < fileVideoPathsTemp.length; i++) {
					GuestbookAttr a = new GuestbookAttr();
					a.setGuestbook(cg);
					a.setName(fileVideoOriginalNameTemp[i]);
					a.setPath(fileVideoPathsTemp[i]);
					a.setType(3);
					list.add(a);
					attrService.save(a);
				}
			}
			
			if(fileImagePaths!=null && !"".equals(fileImagePaths)){
				
				attrService.deleteByList(cg.getId(), 4);
				
				String[] fileImagePathsTemp = fileImagePaths.split(",");
				String[] fileImageOriginalNameTemp = fileImageOriginalName.split("\\|");
				
				for (int i = 0; i < fileImagePathsTemp.length; i++) {
					GuestbookAttr a = new GuestbookAttr();
					a.setGuestbook(cg);
					a.setName(fileImageOriginalNameTemp[i]);
					a.setPath(fileImagePathsTemp[i]);
					a.setType(4);
					list.add(a);
					attrService.save(a);
				}
				
			}
			cg.setAttachments(list);
			
			Guestbook u = guestbookService.update(cg);
			
			JSONObject json = new JSONObject();
			
			if(u!=null){
				json.put("success", true);
				json.put("status", 0);
			}else {
				json.put("success", true);
				json.put("status", 1);

			}
			
			ResponseUtils.renderJson(response, json.toString());
			
		}
	}
	
	/**
	 * 删除
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("cm_online_petition_delete")
	public void cm_online_petition_delete(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model, Integer id) {

		JSONObject json = new JSONObject();
		Guestbook guestbook = guestbookService.findById(id);
		guestbook.setStatus(0);
		Guestbook g = guestbookService.update(guestbook);
		if (g == null) {
			json.put("success", false);
			json.put("status", 1);
		} else {
			json.put("success", true);
			json.put("status", 0);
		}

        ResponseUtils.renderHtml(response, json.toString());
	}
	
	/**
	 * 提交审核
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("cm_online_petition_check")
	public void cm_online_petition_check(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		JSONObject json = new JSONObject();
		Integer guestbookId = request.getParameter("guestbookId") != null && !"".equals(request.getParameter("guestbookId").trim()) ? Integer.parseInt(request.getParameter("guestbookId")) : null;
		Guestbook g = guestbookService.findById(guestbookId);
		
		if (g.getExt() == null) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		
		GuestbookExt e = g.getExt();
		
		if (g.getComplaintNumber() == null || "".equals(g.getComplaintNumber().trim())) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (g.getCreateTime() == null) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getTitle() == null || "".equals(e.getTitle().trim())) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getMatterCategory() == null || "".equals(e.getMatterCategory().trim())) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getMatterDetailed() == null || "".equals(e.getMatterDetailed().trim())) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getReviewOpinions() == null) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getAccept() == null) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getAdministrativeReconsideration() == null) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getPublicity() == null) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (g.getAppeals() == null || "".equals(g.getAppeals().trim())) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (g.getPreliminaryOpinion() == null || "".equals(g.getPreliminaryOpinion().trim())) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getProcessingCompany() == null) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getProcessingHead() == null) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getReportedName() == null || "".equals(e.getReportedName().trim())) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getReportedCompany() == null || "".equals(e.getReportedCompany().trim())) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getReportedLevel() == null || "".equals(e.getReportedLevel().trim())) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getReportedDuties() == null || "".equals(e.getReportedDuties().trim())) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		g.setStatus(2);
		Guestbook guestbook = guestbookService.update(g);
		if (guestbook == null) {
			json.put("success", false);
			json.put("status", 2);
			ResponseUtils.renderHtml(response, json.toString());
			return;
		} else {
			json.put("success", true);
			json.put("status", 0);
			ResponseUtils.renderHtml(response, json.toString());
			return;
		}
        
	}
	
	/**
	 * 图片列表
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("cm_online_petition_image_list")
	public String cm_online_petition_image_list(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		Integer guestbookId = request.getParameter("guestbookId") != null && !"".equals(request.getParameter("guestbookId").trim()) ? Integer.parseInt(request.getParameter("guestbookId")) : null;
		
		List<GuestbookAttr> picList = attrService.getList(guestbookId, 4);
		
		model.put("picList", picList);
		
		String res = "publicVoiceRegister/onlinePetition/onlinePetitionImageList";
		return res;
	}
	
	/**
	 * 单个图片识别页面
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("cm_online_petition_image")
	public String cm_online_petition_image(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		Integer attachmentsId = request.getParameter("attachmentsId") != null && !"".equals(request.getParameter("attachmentsId").trim()) ? Integer.parseInt(request.getParameter("attachmentsId")) : null;
		
		GuestbookAttr guestbookAttr = guestbookAttrService.findById(attachmentsId);
		
		model.put("guestbookAttr", guestbookAttr);
		
		String res = "publicVoiceRegister/onlinePetition/onlinePetitionImage";
		return res;
	}
	
	/**
	 * 图片识别
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 */
	@RequestMapping("cm_online_petition_image_recognition")
	public void cm_online_petition_image_recognition(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		JSONObject json = new JSONObject();
		
		Integer attachmentsId = request.getParameter("attachmentsId") != null && !"".equals(request.getParameter("attachmentsId").trim()) ? Integer.parseInt(request.getParameter("attachmentsId")) : null;
		
		GuestbookAttr guestbookAttr = guestbookAttrService.findById(attachmentsId);
		
		String tempName = guestbookAttr.getPath();
		if (tempName.indexOf("/static/upload/portraitImages/") != -1) {
			String name = tempName.split("/portraitImages/")[1];
			String pix = FilenameUtils.getExtension(name).toLowerCase(Locale.ENGLISH);
			String realPath = request.getSession().getServletContext().getRealPath("/") + 
					"static\\upload\\portraitImages";
			try {
				String word = picProcessUtil.getWord(realPath, name, pix);
				System.out.println(word);
				json.put("success", true);
				json.put("status", 0);
				json.put("word", word);
				ResponseUtils.renderHtml(response, json.toString());
				return;
			} catch (Exception e) {
				e.printStackTrace();
				json.put("success", false);
				json.put("status", 1);
				ResponseUtils.renderHtml(response, json.toString());
				return;
			}
		} else {
			json.put("success", false);
			json.put("status", 2);
			ResponseUtils.renderHtml(response, json.toString());
			return;
		}
		
	}
	
	/**
	 * 保存从图片中识别出来的文字
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 */
	@RequestMapping("cm_online_petition_image_recognition_update")
	public void cm_online_petition_image_recognition_update(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		JSONObject json = new JSONObject();
		
		Integer attachmentsId = request.getParameter("attachmentsId") != null && !"".equals(request.getParameter("attachmentsId").trim()) ? Integer.parseInt(request.getParameter("attachmentsId")) : null;
		String content = request.getParameter("content");
		
		GuestbookAttr guestbookAttr = guestbookAttrService.findById(attachmentsId);
		guestbookAttr.setImageRecognition(content);
		guestbookAttr = guestbookAttrService.update(guestbookAttr);
		
		if (guestbookAttr != null) {
			json.put("success", true);
			json.put("status", 0);
			ResponseUtils.renderHtml(response, json.toString());
			return;
		} else {
			json.put("success", false);
			json.put("status", 1);
			ResponseUtils.renderHtml(response, json.toString());
			return;
		}
		
	}
	
	/**
	 * 导入显示
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("cm_online_petition_import_show")
	public String cm_online_petition_import_show(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		List<Dictionary> assignModalityList = dictionaryService.getList(null, 
				null, "superior_assign_modality");
		
		model.put("assignModalityList", assignModalityList);
		
		String res = "publicVoiceRegister/onlinePetition/onlinePetitionImport";
		return res;
	}
	
	/**
	 * 压缩包上传
	 * @param request
	 * @param response
	 * @param model
	 * @throws JSONException
	 */
	@RequestMapping(value = "cm_online_petition_file_upload", method = RequestMethod.POST)
    public void cm_online_petition_file_upload(@RequestParam("fileDoc") MultipartFile file,
    		HttpServletRequest request,HttpServletResponse response, ModelMap model) {
        
        JSONObject json = new JSONObject();
        long now = new Date().getTime();
        
	     // 文件保存路径  
	    String imagePath = request.getSession().getServletContext().getRealPath("/") 
	    		+ "/static/upload/onlinePetitionImport/" + now + "/";
	    if (!new File(imagePath).exists()) {
			new File(imagePath).mkdirs();
		}
        
        String fileName="";
        
		//上传文件不能为空
		if(file.getSize()==0){
			json.put("success", true);
			json.put("status", 1);
			ResponseUtils.renderHtml(response, json.toString());
			return;
		}
		String origName = file.getOriginalFilename();
		fileName += FilenameUtils.getName(origName);
		//后缀名
		String pix = FilenameUtils.getExtension(origName).toLowerCase(Locale.ENGLISH);
        if(!"zip".equalsIgnoreCase(pix)){
            json.put("success", true);
            json.put("status", 2);
            ResponseUtils.renderHtml(response, json.toString());
            return;
        }
        
		String newFileName = new Date().getTime() + "." + FilenameUtils.getExtension(origName).toLowerCase(Locale.ENGLISH);
        try {
        	// 转存文件  
			file.transferTo(new File(imagePath + newFileName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
        
        json.put("success", true);
        json.put("status", 0);
        json.put("fileUrl", "/static/upload/onlinePetitionImport/" + now + "/" + newFileName);
        json.put("fileName", fileName);
    		
        ResponseUtils.renderHtml(response, json.toString());
    }
	
	/**
	 * 导入保存
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("cm_online_petition_import")
	public void cm_online_petition_import(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		JSONObject json = new JSONObject();
		long now = new Date().getTime();
		// 获取用户对象
        User user = (User)session.getAttribute("user");
        String imagePath = request.getSession().getServletContext().getRealPath("/") + "/static/upload/portraitImages/";  
	    if (!new File(imagePath).exists()) {
			new File(imagePath).mkdirs();
		}
		
		String fileDocPaths = request.getParameter("fileDocPath");
		
		String filePath = request.getSession().getServletContext().getRealPath("/") + fileDocPaths;
		String allFilePath = filePath.substring(0, filePath.lastIndexOf("/") + 1) + now + "/";
		try {
			ZipFile zipFile = new ZipFile(filePath);
			zipFile.setFileNameCharset("GBK");
			if (zipFile.isEncrypted()) {
				zipFile.setPassword("yhtd0451");
			}
			zipFile.extractAll(allFilePath);
		} catch (ZipException e) {
			e.printStackTrace();
			json.put("success", true);
			json.put("status", 1);
			ResponseUtils.renderHtml(response, json.toString());
			return;
		}
		
		File allFile = new File(allFilePath);
		
		List<File> excelFileList = new ArrayList<File>();
		findFile(allFile, new String[]{"xls", "xlsx"}, excelFileList);
		if (excelFileList != null && excelFileList.size() == 1) {
			File excelFile = excelFileList.get(0);
			try {
				InputStream stream = new FileInputStream(excelFile);

				String pix = excelFile.getName().split("\\.")[1];
				Workbook wb = null;
				if ("xls".equals(pix)) {
					wb = new HSSFWorkbook(stream);
				} else if ("xlsx".equals(pix)) {
					wb = new XSSFWorkbook(stream);
				}
				
				stream.close();
				int newCount = 0;
				String[] str = {"序号", "案件编号", "信访人", "来访类型", "案件类型", "上访时间", "案件状态", "姓名", "性别", 
						"年龄", "民族", "身份证号", "文化程度", "居住地址", "政治面貌", "手机", "负责单位", "负责人", 
						"来访性质", "上访层次", "来访人数", "所属问题", "反应问题及诉求", "初步处理意见", "接待人", "被举报人单位", 
						"被举报人姓名", "被举报人性别", "被举报人职务", "被举报人级别", "标题", "问题细类", "是否有符合意见书", 
						"法院是否受理", "是否已经行政复议", "是否允许公开", "是否为重复信件", "来访代表", "举报人级别", "ID", 
						"负责人ID", "负责单位ID"};
				for (int i = 0; i < wb.getNumberOfSheets(); i++) {
					for (Row row : wb.getSheetAt(i)) {
						if (newCount < 2) {
							newCount++;
							continue;
						} 
						if (newCount == 2) {
							boolean flag = false;
							for (int j = 0; j < str.length; j++) {
								if (row.getCell(j) != null) {
									row.getCell(j).setCellType(Cell.CELL_TYPE_STRING);
									if (!row.getCell(j).getStringCellValue().trim().equals(str[j])) {
										flag = true;
									}
								} else {
									flag = true;
								}
								if (flag) {
									json.put("success", false);
									json.put("status", 3);
									ResponseUtils.renderHtml(response, json.toString());
									return;
								}
							}
							newCount++;
							continue;
						}
						
						Integer guestbookId = null;
						String complaintNumber = null;
						Date createTime = null;
						String informantName = null;
						String informantCardNo = null;
						String informantLevel = null;
						String informantpoliticalFace = null;
						String informantPhone = null;
						String informantPlace = null;
						String title = null;
						String matterCategory = null;
						String matterDetailed = null;
						Boolean reviewOpinions = null;
						Boolean accept = null;
						Boolean administrativeReconsideration = null;
						Boolean publicity = null;
						String appeals = null;
						String preliminaryOpinion = null;
						Integer processingCompany = null;
						Integer processingHead = null;
						String reportedName = null;
						String reportedCompany = null;
						String reportedDuties = null;
						String reportedLevel = null;
						
						if (row.getCell(3) != null) {
							row.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
							if (!"网上信访".equals(row.getCell(3).getStringCellValue().trim())) {
								continue;
							}
						}
						
						if (row.getCell(1) != null) {
							row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
							complaintNumber = row.getCell(1).getStringCellValue().trim();
						}
						if (row.getCell(5) != null) {
							row.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
							createTime = DateUtils.getStr2Date7(row.getCell(5).getStringCellValue().trim());
						}
						if (row.getCell(7) != null) {
							row.getCell(7).setCellType(Cell.CELL_TYPE_STRING);
							informantName = row.getCell(7).getStringCellValue().trim();
						}
						if (row.getCell(11) != null) {
							row.getCell(11).setCellType(Cell.CELL_TYPE_STRING);
							informantCardNo = row.getCell(11).getStringCellValue().trim();
						}
						if (row.getCell(13) != null) {
							row.getCell(13).setCellType(Cell.CELL_TYPE_STRING);
							informantPlace = row.getCell(13).getStringCellValue().trim();
						}
						if (row.getCell(14) != null) {
							row.getCell(14).setCellType(Cell.CELL_TYPE_STRING);
							informantpoliticalFace = row.getCell(14).getStringCellValue().trim();
						}
						if (row.getCell(15) != null) {
							row.getCell(15).setCellType(Cell.CELL_TYPE_STRING);
							informantPhone = row.getCell(15).getStringCellValue().trim();
						}
						if (row.getCell(21) != null) {
							row.getCell(21).setCellType(Cell.CELL_TYPE_STRING);
							matterCategory = row.getCell(21).getStringCellValue().trim();
						}
						if (row.getCell(22) != null) {
							row.getCell(22).setCellType(Cell.CELL_TYPE_STRING);
							appeals = row.getCell(22).getStringCellValue().trim();
						}
						if (row.getCell(23) != null) {
							row.getCell(23).setCellType(Cell.CELL_TYPE_STRING);
							preliminaryOpinion = row.getCell(23).getStringCellValue().trim();
						}
						if (row.getCell(41) != null) {
							row.getCell(41).setCellType(Cell.CELL_TYPE_STRING);
							processingCompany = Integer.parseInt(row.getCell(41).getStringCellValue().trim());
						}
						if (row.getCell(40) != null) {
							row.getCell(40).setCellType(Cell.CELL_TYPE_STRING);
							processingHead = Integer.parseInt(row.getCell(40).getStringCellValue().trim());
						}
						if (row.getCell(26) != null) {
							row.getCell(26).setCellType(Cell.CELL_TYPE_STRING);
							reportedName = row.getCell(26).getStringCellValue().trim();
						}
						if (row.getCell(25) != null) {
							row.getCell(25).setCellType(Cell.CELL_TYPE_STRING);
							reportedCompany = row.getCell(25).getStringCellValue().trim();
						}
						if (row.getCell(28) != null) {
							row.getCell(28).setCellType(Cell.CELL_TYPE_STRING);
							reportedDuties = row.getCell(28).getStringCellValue().trim();
						}
						if (row.getCell(29) != null) {
							row.getCell(29).setCellType(Cell.CELL_TYPE_STRING);
							reportedLevel = row.getCell(29).getStringCellValue().trim();
						}
						if (row.getCell(38) != null) {
							row.getCell(38).setCellType(Cell.CELL_TYPE_STRING);
							informantLevel = row.getCell(38).getStringCellValue().trim();
						}
						if (row.getCell(30) != null) {
							row.getCell(30).setCellType(Cell.CELL_TYPE_STRING);
							title = row.getCell(30).getStringCellValue().trim();
						}
						if (row.getCell(31) != null) {
							row.getCell(31).setCellType(Cell.CELL_TYPE_STRING);
							matterDetailed = row.getCell(31).getStringCellValue().trim();
						}
						if (row.getCell(32) != null) {
							row.getCell(32).setCellType(Cell.CELL_TYPE_STRING);
							if ("是".equals(row.getCell(32).getStringCellValue().trim())) {
								reviewOpinions = true;
							} else if ("否".equals(row.getCell(32).getStringCellValue().trim())) {
								reviewOpinions = false;
							}
						}
						if (row.getCell(33) != null) {
							row.getCell(33).setCellType(Cell.CELL_TYPE_STRING);
							if ("是".equals(row.getCell(33).getStringCellValue().trim())) {
								accept = true;
							} else if ("否".equals(row.getCell(33).getStringCellValue().trim())) {
								accept = false;
							}
						}
						if (row.getCell(34) != null) {
							row.getCell(34).setCellType(Cell.CELL_TYPE_STRING);
							if ("是".equals(row.getCell(34).getStringCellValue().trim())) {
								administrativeReconsideration = true;
							} else if ("否".equals(row.getCell(34).getStringCellValue().trim())) {
								administrativeReconsideration = false;
							}
						}
						if (row.getCell(35) != null) {
							row.getCell(35).setCellType(Cell.CELL_TYPE_STRING);
							if ("是".equals(row.getCell(35).getStringCellValue().trim())) {
								publicity = true;
							} else if ("否".equals(row.getCell(35).getStringCellValue().trim())) {
								publicity = false;
							}
						}
						if (row.getCell(39) != null) {
							row.getCell(39).setCellType(Cell.CELL_TYPE_STRING);
							guestbookId = Integer.parseInt(row.getCell(39).getStringCellValue().trim());
						}
						
						Guestbook g = new Guestbook();
						g.setSiteId(1);
						g.setCtgId(1);
						g.setIp(request.getRemoteAddr());
						g.setCreateTime(createTime);
						g.setChecked(false);
						g.setRecommend(false);
						g.setComplaintNumber(complaintNumber);
						g.setCreateUser(user);
						g.setStatus(1);
						g.setAppeals(appeals);
						g.setPreliminaryOpinion(preliminaryOpinion);
						
						GuestbookExt e = new GuestbookExt();
						e.setInformantName(informantName);
						e.setInformantPhone(informantPhone);
						e.setInformantCardNo(informantCardNo);
						e.setInformantLevel(informantLevel);
						e.setInformantpoliticalFace(informantpoliticalFace);
						e.setInformantPlace(informantPlace);
						e.setReportedName(reportedName);
						e.setReportedCompany(reportedCompany);
						e.setReportedDuties(reportedDuties);
						e.setReportedLevel(reportedLevel);
						e.setMatterCategory(matterCategory);
						e.setProcessingCompany(organizationalService.findById(processingCompany));
						e.setProcessingHead(userService.findById(processingHead));
						e.setTitle(title);
						e.setMatterCategory(matterCategory);
						e.setMatterDetailed(matterDetailed);
						e.setReviewOpinions(reviewOpinions);
						e.setAccept(accept);
						e.setAdministrativeReconsideration(administrativeReconsideration);
						e.setPublicity(publicity);
						
						Guestbook cg = guestbookService.save(g, e);
						
						if (cg == null) {
							json.put("success", true);
							json.put("status", 4);
							ResponseUtils.renderHtml(response, json.toString());
							return;
						}
						
						ArrayList<GuestbookAttr> list = new ArrayList<>();
						
						List<File> docFileList = new ArrayList<File>();
						findFile(allFile, new String[]{"word", "txt", "pdf"}, docFileList);
						if(docFileList != null && docFileList.size() > 0){
							for (File file : docFileList) {
								
								if (file.getAbsoluteFile().toString().indexOf("/" + guestbookId + "/") == -1) {
									continue;
								}
								
								String newFileName = new Date().getTime() + "." + FilenameUtils.getExtension(file.getName()).toLowerCase(Locale.ENGLISH);
								
							    // 输入流
								InputStream in = new FileInputStream(file);   
							    // 1K的数据缓冲
							    byte[] bs = new byte[1024];
							    // 读取到的数据长度
							    int len;
							    // 输出的文件流
							    OutputStream os = new FileOutputStream(imagePath + newFileName);
							    // 开始读取 
								while ((len = in.read(bs)) != -1) {
								  os.write(bs, 0, len);
								} 
							    // 完毕，关闭所有链接
							    os.close();
							    in.close();
								
								GuestbookAttr a = new GuestbookAttr();
								a.setGuestbook(cg);
								a.setName(file.getName());
								a.setPath("/static/upload/portraitImages/"+newFileName);
								a.setType(1);
								list.add(a);
								attrService.save(a);
							}
						}
						
						List<File> mediaFileList = new ArrayList<File>();
						findFile(allFile, new String[]{"wav", "mp3"}, mediaFileList);
						if(mediaFileList != null && mediaFileList.size() > 0){
							for (File file : mediaFileList) {
								
								if (file.getAbsoluteFile().toString().indexOf("/" + guestbookId + "/") == -1) {
									continue;
								}
								
								String newFileName = new Date().getTime() + "." + FilenameUtils.getExtension(file.getName()).toLowerCase(Locale.ENGLISH);
								
							    // 输入流
								InputStream in = new FileInputStream(file);   
							    // 1K的数据缓冲
							    byte[] bs = new byte[1024];
							    // 读取到的数据长度
							    int len;
							    // 输出的文件流
							    OutputStream os = new FileOutputStream(imagePath + newFileName);
							    // 开始读取 
								while ((len = in.read(bs)) != -1) {
								  os.write(bs, 0, len);
								} 
							    // 完毕，关闭所有链接
							    os.close();
							    in.close();
								
								GuestbookAttr a = new GuestbookAttr();
								a.setGuestbook(cg);
								a.setName(file.getName());
								a.setPath("/static/upload/portraitImages/"+newFileName);
								a.setType(2);
								list.add(a);
								attrService.save(a);
							}
						}
						
						List<File> videoFileList = new ArrayList<File>();
						findFile(allFile, new String[]{"mp4", "wmv", "avi"}, videoFileList);
						if(videoFileList != null && videoFileList.size() > 0){
							for (File file : videoFileList) {
								
								if (file.getAbsoluteFile().toString().indexOf("/" + guestbookId + "/") == -1) {
									continue;
								}
								
								String newFileName = new Date().getTime() + "." + FilenameUtils.getExtension(file.getName()).toLowerCase(Locale.ENGLISH);
								
							    // 输入流
								InputStream in = new FileInputStream(file);   
							    // 1K的数据缓冲
							    byte[] bs = new byte[1024];
							    // 读取到的数据长度
							    int len;
							    // 输出的文件流
							    OutputStream os = new FileOutputStream(imagePath + newFileName);
							    // 开始读取 
								while ((len = in.read(bs)) != -1) {
								  os.write(bs, 0, len);
								} 
							    // 完毕，关闭所有链接
							    os.close();
							    in.close();
								
								GuestbookAttr a = new GuestbookAttr();
								a.setGuestbook(cg);
								a.setName(file.getName());
								a.setPath("/static/upload/portraitImages/"+newFileName);
								a.setType(3);
								list.add(a);
								attrService.save(a);
							}
						}
						
						List<File> imageFileList = new ArrayList<File>();
						findFile(allFile, new String[]{"png", "jpg", "bmp"}, imageFileList);
						if(imageFileList != null && imageFileList.size() > 0){
							for (File file : imageFileList) {
								
								if (file.getAbsoluteFile().toString().indexOf("/" + guestbookId + "/") == -1) {
									continue;
								}
								
								String newFileName = new Date().getTime() + "." + FilenameUtils.getExtension(file.getName()).toLowerCase(Locale.ENGLISH);
								
							    // 输入流
								InputStream in = new FileInputStream(file);   
							    // 1K的数据缓冲
							    byte[] bs = new byte[1024];
							    // 读取到的数据长度
							    int len;
							    // 输出的文件流
							    OutputStream os = new FileOutputStream(imagePath + newFileName);
							    // 开始读取 
								while ((len = in.read(bs)) != -1) {
								  os.write(bs, 0, len);
								} 
							    // 完毕，关闭所有链接
							    os.close();
							    in.close();
								
								GuestbookAttr a = new GuestbookAttr();
								a.setGuestbook(cg);
								a.setName(file.getName());
								a.setPath("/static/upload/portraitImages/"+newFileName);
								a.setType(4);
								list.add(a);
								attrService.save(a);
							}
						}
						
						cg.setAttachments(list);
						
						Guestbook u = guestbookService.update(cg);
						
						if(u != null){
							json.put("success", true);
							json.put("status", 0);
							ResponseUtils.renderHtml(response, json.toString());
							return;
						} else {
							json.put("success", true);
							json.put("status", 4);
							ResponseUtils.renderHtml(response, json.toString());
							return;
						}
					}
					
					if (newCount < 2) {
						json.put("success", false);
						json.put("status", 3);
						ResponseUtils.renderHtml(response, json.toString());
						return;
					}
					
				}
			} catch (Exception e) {
				e.printStackTrace();
				json.put("success", true);
				json.put("status", 4);
				ResponseUtils.renderHtml(response, json.toString());
				return;
			}
		} else {
			json.put("success", true);
			json.put("status", 2);
			ResponseUtils.renderHtml(response, json.toString());
			return;
		}
	}
	
	/**
	 * 返回文件夹中所有指定后缀的文件
	 * @param file
	 * @return
	 */
	private void findFile(File file, String[] prefixs, List<File> fileList) {
		// 判断是否是文件
		if (file.isFile()) {
			String fileName = file.getName();
			for (String prefix : prefixs) {
				if (prefix.equals(fileName.substring(fileName.lastIndexOf(".") + 1))) {
					fileList.add(file);
				}
			}
		// 否则如果它是一个目录
		} else if (file.isDirectory()) {
			// 声明目录下所有的文件 files[]
			File[] files = file.listFiles();
			// 遍历目录下所有的文件
			for (int i = 0; i < files.length; i++) {
				// 把每个文件用这个方法进行迭代
				this.findFile(files[i], prefixs, fileList);
			}
		}
	}
	
	/**
	 * 案件负责单位
	 * 下拉分页显示
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param pageNumber 当前页数
	 * @param pageSize 每页显示数据条数
	 */
	@RequestMapping("cm_online_petition_processingCompany")
	public void cm_online_petition_processingCompany(HttpServletRequest request, 
			HttpServletResponse response, HttpSession session, ModelMap model, Integer pageNumber, 
			Integer pageSize, Integer id, String name) {
		
		int totalRecord = organizationalService.getPageCount(id, name);
		
		List<Organization> organizationList = organizationalService.getListByPage(id, name, pageNumber, pageSize);
		
		String str = "{";
		str = str + "\"values\":{" 
				+ "\"gridResult\":{"
				+ "\"pageSize\":\"" + pageSize + "\","
				+ "\"pageNumber\":\"" + pageNumber + "\","
				+ "\"totalRow\":\"" + totalRecord + "\","
				+ "\"totalPage\":\"" + (totalRecord % pageSize == 0 ? totalRecord / pageSize : totalRecord / pageSize + 1) + "\","
				+ "\"list\": [";
		for (Organization organization : organizationList) {
			str = str + "{\"id\": \"" + organization.getId() + "\","
					+ "\"name\": \"" + organization.getName() + "\"},";
		}
		if (organizationList != null && organizationList.size() > 0) {
			str = str.substring(0, str.length() - 1);
		}
		str = str + "]}}}";
		
		JSONObject json = new JSONObject(str);
		
		ResponseUtils.renderHtml(response, json.toString());
	}
	
	/**
	 * 部门用户联动
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param organizationid
	 */
	@RequestMapping("cm_online_petition_getUserByOrganizational")
	public void cm_online_petition_getUserByOrganizational(HttpServletRequest request, 
			HttpServletResponse response, HttpSession session, ModelMap model, Integer organizationid) {
		
		List<User> userList = userService.getListByOrganizational(organizationid);
		
		String str = "{\"userList\": [";
		for (User user : userList) {
			str = str + "{\"id\": \"" + user.getId() + "\","
					+ "\"name\": \"" + user.getDescription() + "\"},";
		}
		if (userList != null && userList.size() > 0) {
			str.substring(0, str.length() - 1);
		}
		str = str + "]}";
		
		JSONObject json = new JSONObject(str);
		
		ResponseUtils.renderHtml(response, json.toString());
		
	}
	
}
