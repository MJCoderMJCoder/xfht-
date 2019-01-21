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
import com.cxgc.front.util.ResponseUtils;
import com.cxgc.front.util.StacticVariable;
import com.cxgc.front.util.picProcessUtil;

import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import net.sf.json.JSONObject;

/**
 * 上级交办
 * @author Administrator
 *
 */
@Controller
public class SuperiorAssignController {
	
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
	 * 上级交办列表
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("cm_superior_assign_list")
	public String cm_superior_assign_list(HttpServletRequest request, HttpServletResponse response, 
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
		String assignNumber = request.getParameter("assignNumber");
		String assignCompany = request.getParameter("assignCompany");
		String assignModality = request.getParameter("assignModality");
		String matterCategory = request.getParameter("matterCategory");
		
		int totalRecord = guestbookService.getPageCount1(startTime, endTime, assignNumber, assignCompany, 
				assignModality, matterCategory, 4, user.getId());
		
		if(pageNum <= 0){
			pageNum = 1;
		}
		if(pageNum > (totalRecord + pagesize -1) / pagesize){
			pageNum = (totalRecord + pagesize -1) / pagesize;
		}
		
		List<Guestbook> guestBookList = guestbookService.getListByPage1(startTime, endTime, assignNumber, 
				assignCompany, assignModality, matterCategory, 4, user.getId(), pageNum, pagesize);
		
		List<Dictionary> matterCategoryList = dictionaryService.getList(null, null, "matterCategory");
		 
		List<Dictionary> assignModalityList = dictionaryService.getList(null, 
				null, "superior_assign_modality");
		
		model.put("totalPages", (totalRecord + pagesize -1) / pagesize);
		model.put("totalRecord", totalRecord);
		model.put("pageNum", pageNum);
		
		model.put("startTimeTemp", startTimeTemp);
		model.put("endTimeTemp", endTimeTemp);
		model.put("assignNumber", assignNumber);
		model.put("assignCompany", assignCompany);
		model.put("assignModality", assignModality);
		model.put("matterCategory", matterCategory);
		model.put("guestBookList", guestBookList);
		model.put("matterCategoryList", matterCategoryList);
		model.put("assignModalityList", assignModalityList);
		
		String res = "publicVoiceRegister/superiorAssign/superiorAssignList";
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
	@RequestMapping("cm_superior_assign_add")
	public String cm_superior_assign_add(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		List<Dictionary> assignModalityList = dictionaryService.getList(null, 
				null, "superior_assign_modality");
		List<Dictionary> genderList = dictionaryService.getList(null, null, "gender");
		List<Dictionary> nationList = dictionaryService.getList(null, null, "nation");
		List<Dictionary> educationList = dictionaryService.getList(null, null, "education");
		List<Dictionary> politicalFaceList = dictionaryService.getList(null, null, "political_face");
		List<Dictionary> matterPropertyList = dictionaryService.getList(null, null, "matterProperty");
		List<Dictionary> informantGradeList = dictionaryService.getList(null, null, "informantGrade");
		List<Dictionary> matterCategoryList = dictionaryService.getList(null, null, "matterCategory");
		List<Dictionary> levelList = dictionaryService.getList(null, null, "level");
		
		model.put("assignModalityList", assignModalityList);
		model.put("genderList", genderList);
		model.put("nationList", nationList);
		model.put("educationList", educationList);
		model.put("politicalFaceList", politicalFaceList);
		model.put("matterPropertyList", matterPropertyList);
		model.put("informantGradeList", informantGradeList);
		model.put("matterCategoryList", matterCategoryList);
		model.put("levelList", levelList);
		
		String res = "publicVoiceRegister/superiorAssign/superiorAssignAdd";
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
	@RequestMapping("cm_superior_assign_look")
	public String cm_superior_assign_look(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		Integer guestbookId = request.getParameter("guestbookId") != null 
				&& !"".equals(request.getParameter("guestbookId").trim()) 
				? Integer.parseInt(request.getParameter("guestbookId")) : null;
				
		Guestbook guestbook = guestbookService.findById(guestbookId);	
		
		model.put("guestbook", guestbook);
				
		String res = "publicVoiceRegister/superiorAssign/superiorAssignLook";
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
	@RequestMapping("cm_superior_assign_edit")
	public String cm_superior_assign_edit(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		Integer guestbookId = request.getParameter("guestbookId") != null 
				&& !"".equals(request.getParameter("guestbookId").trim()) 
				? Integer.parseInt(request.getParameter("guestbookId")) : null;
				
		Guestbook guestbook = guestbookService.findById(guestbookId);	
		List<Dictionary> assignModalityList = dictionaryService.getList(null, 
				null, "superior_assign_modality");
		List<Dictionary> genderList = dictionaryService.getList(null, null, "gender");
		List<Dictionary> nationList = dictionaryService.getList(null, null, "nation");
		List<Dictionary> educationList = dictionaryService.getList(null, null, "education");
		List<Dictionary> politicalFaceList = dictionaryService.getList(null, null, "political_face");
		List<Dictionary> matterPropertyList = dictionaryService.getList(null, null, "matterProperty");
		List<Dictionary> informantGradeList = dictionaryService.getList(null, null, "informantGrade");
		List<Dictionary> matterCategoryList = dictionaryService.getList(null, null, "matterCategory");
		List<Dictionary> levelList = dictionaryService.getList(null, null, "level");
		
		model.put("assignModalityList", assignModalityList);
		model.put("genderList", genderList);
		model.put("nationList", nationList);
		model.put("educationList", educationList);
		model.put("politicalFaceList", politicalFaceList);
		model.put("matterPropertyList", matterPropertyList);
		model.put("informantGradeList", informantGradeList);
		model.put("matterCategoryList", matterCategoryList);
		model.put("levelList", levelList);
		model.put("guestbook", guestbook);
		
		List<User> userList = userService.getListByOrganizational(guestbook.getExt().getProcessingCompany().getId());
		
		model.put("userList", userList);
		
		String res = "publicVoiceRegister/superiorAssign/superiorAssignEdit";
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
	@RequestMapping("cm_superior_assign_save")
	public void cm_superior_assign_save(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		Integer guestbookId = request.getParameter("guestbookId") != null && !"".equals(request.getParameter("guestbookId").trim()) ? Integer.parseInt(request.getParameter("guestbookId")) : null;
		String assignNumber = request.getParameter("assignNumber");
		String assignPerson = request.getParameter("assignPerson");
		String assignPersonPost = request.getParameter("assignPersonPost");
		String assignCompany = request.getParameter("assignCompany");
		String assignModality = request.getParameter("assignModality");
		String preserver = request.getParameter("preserver");
		String place = request.getParameter("place");
		String complaintNumber = request.getParameter("complaintNumber");
		Date createTime = DateUtils.getStr2Date7(request.getParameter("createTime"));
		String informantName = request.getParameter("informantName");
		Integer informantSex = request.getParameter("informantSex") != null && !"".equals(request.getParameter("informantSex").trim()) ? Integer.parseInt(request.getParameter("informantSex")) : null;
		Integer informantAge = request.getParameter("informantAge") != null && !"".equals(request.getParameter("informantAge").trim()) ? Integer.parseInt(request.getParameter("informantAge")) : null;
		String informantNation = request.getParameter("informantNation");
		String informantCardNo = request.getParameter("informantCardNo");
		String informantEducation = request.getParameter("informantEducation");
		String informantPlace = request.getParameter("informantPlace");
		String informantpoliticalFace = request.getParameter("informantpoliticalFace");
		String informantPhone = request.getParameter("informantPhone");
		String matterCategory = request.getParameter("matterCategory");
		String matterProperty = request.getParameter("matterProperty");
		String informantGrade = request.getParameter("informantGrade");
		Integer peopleCount = request.getParameter("peopleCount") != null && !"".equals(request.getParameter("peopleCount").trim()) ? Integer.parseInt(request.getParameter("peopleCount")) : null;
		String leader = request.getParameter("leader");
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
			g.setCtgId(4);
			g.setIp(request.getRemoteAddr());
			g.setCreateTime(createTime);
			g.setChecked(false);
			g.setRecommend(false);
			g.setComplaintNumber(complaintNumber);
			g.setCreateUser(user);
			g.setStatus(1);
			g.setPeopleCount(peopleCount);
			g.setLeader(leader);
			g.setAppeals(appeals);
			g.setPreliminaryOpinion(preliminaryOpinion);
			
			GuestbookExt e = new GuestbookExt();
			e.setInformantName(informantName);
			e.setInformantNation(informantNation);
			e.setInformantSex(informantSex);
			e.setInformantPhone(informantPhone);
			e.setInformantCardNo(informantCardNo);
			e.setInformantpoliticalFace(informantpoliticalFace);
			e.setInformantPlace(informantPlace);
			e.setReportedName(reportedName);
			e.setReportedCompany(reportedCompany);
			e.setReportedDuties(reportedDuties);
			e.setReportedLevel(reportedLevel);
			e.setMatterCategory(matterCategory);
			e.setInformantAge(informantAge);
			e.setInformantEducation(informantEducation);
			e.setProcessingCompany(organizationalService.findById(processingCompany));
			e.setProcessingHead(userService.findById(processingHead));
			e.setInformantGrade(informantGrade);
			e.setMatterProperty(matterProperty);
			e.setAssignNumber(assignNumber);
			e.setAssignPerson(assignPerson);
			e.setAssignPersonPost(assignPersonPost);
			e.setAssignCompany(assignCompany);
			e.setAssignModality(assignModality);
			e.setPreserver(preserver);
			e.setPlace(place);
			
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
			g.setCtgId(4);
			g.setIp(request.getRemoteAddr());
			g.setCreateTime(createTime);
			g.setChecked(false);
			g.setRecommend(false);
			g.setComplaintNumber(complaintNumber);
			g.setCreateUser(user);
			g.setPeopleCount(peopleCount);
			g.setLeader(leader);
			g.setAppeals(appeals);
			g.setPreliminaryOpinion(preliminaryOpinion);
			
			GuestbookExt e = g.getExt();
			e.setInformantName(informantName);
			e.setInformantNation(informantNation);
			e.setInformantSex(informantSex);
			e.setInformantPhone(informantPhone);
			e.setInformantCardNo(informantCardNo);
			e.setInformantpoliticalFace(informantpoliticalFace);
			e.setInformantPlace(informantPlace);
			e.setReportedName(reportedName);
			e.setReportedCompany(reportedCompany);
			e.setReportedDuties(reportedDuties);
			e.setReportedLevel(reportedLevel);
			e.setMatterCategory(matterCategory);
			e.setInformantAge(informantAge);
			e.setInformantEducation(informantEducation);
			e.setProcessingCompany(organizationalService.findById(processingCompany));
			e.setProcessingHead(userService.findById(processingHead));
			e.setInformantGrade(informantGrade);
			e.setMatterProperty(matterProperty);
			e.setAssignNumber(assignNumber);
			e.setAssignPerson(assignPerson);
			e.setAssignPersonPost(assignPersonPost);
			e.setAssignCompany(assignCompany);
			e.setAssignModality(assignModality);
			e.setPreserver(preserver);
			e.setPlace(place);
			
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
	@RequestMapping("cm_superior_assign_delete")
	public void cm_superior_assign_delete(HttpServletRequest request, HttpServletResponse response, 
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
	@RequestMapping("cm_superior_assign_check")
	public void cm_superior_assign_check(HttpServletRequest request, HttpServletResponse response, 
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
		
		if (e.getAssignNumber() == null || "".equals(e.getAssignNumber().trim())) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getAssignPerson() == null || "".equals(e.getAssignPerson().trim())) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getAssignPersonPost() == null || "".equals(e.getAssignPersonPost().trim())) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getAssignCompany() == null || "".equals(e.getAssignCompany().trim())) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getAssignModality() == null || "".equals(e.getAssignModality().trim())) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
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
		if (e.getMatterCategory() == null || "".equals(e.getMatterCategory().trim())) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getMatterProperty() == null || "".equals(e.getMatterProperty().trim())) {
			json.put("success", false);
	        json.put("status", 1);
	        ResponseUtils.renderHtml(response, json.toString());
	        return;
		}
		if (e.getInformantGrade() == null || "".equals(e.getInformantGrade().trim())) {
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
	@RequestMapping("cm_superior_assign_image_list")
	public String cm_superior_assign_image_list(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		Integer guestbookId = request.getParameter("guestbookId") != null && !"".equals(request.getParameter("guestbookId").trim()) ? Integer.parseInt(request.getParameter("guestbookId")) : null;
		
		List<GuestbookAttr> picList = attrService.getList(guestbookId, 4);
		
		model.put("picList", picList);
		
		String res = "publicVoiceRegister/superiorAssign/superiorAssignImageList";
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
	@RequestMapping("cm_superior_assign_image")
	public String cm_superior_assign_image(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		Integer attachmentsId = request.getParameter("attachmentsId") != null && !"".equals(request.getParameter("attachmentsId").trim()) ? Integer.parseInt(request.getParameter("attachmentsId")) : null;
		
		GuestbookAttr guestbookAttr = guestbookAttrService.findById(attachmentsId);
		
		model.put("guestbookAttr", guestbookAttr);
		
		String res = "publicVoiceRegister/superiorAssign/superiorAssignImage";
		return res;
	}
	
	/**
	 * 图片识别
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 */
	@RequestMapping("cm_superior_assign_image_recognition")
	public void cm_superior_assign_image_recognition(HttpServletRequest request, HttpServletResponse response, 
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
	@RequestMapping("cm_superior_assign_image_recognition_update")
	public void cm_superior_assign_image_recognition_update(HttpServletRequest request, HttpServletResponse response, 
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
	@RequestMapping("cm_superior_assign_import_show")
	public String cm_superior_assign_import_show(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		List<Dictionary> assignModalityList = dictionaryService.getList(null, 
				null, "superior_assign_modality");
		
		model.put("assignModalityList", assignModalityList);
		
		String res = "publicVoiceRegister/superiorAssign/superiorAssignImport";
		return res;
	}
	
	/**
	 * 压缩包上传
	 * @param request
	 * @param response
	 * @param model
	 * @throws JSONException
	 */
	@RequestMapping(value = "cm_superior_assign_file_upload", method = RequestMethod.POST)
    public void cm_superior_assign_file_upload(@RequestParam("fileDoc") MultipartFile file,
    		HttpServletRequest request,HttpServletResponse response, ModelMap model) {
        
        JSONObject json = new JSONObject();
        long now = new Date().getTime();
        
	     // 文件保存路径  
	    String imagePath = request.getSession().getServletContext().getRealPath("/") 
	    		+ "/static/upload/superiorAssignImport/" + now + "/";
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
        json.put("fileUrl", "/static/upload/superiorAssignImport/" + now + "/" + newFileName);
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
	@RequestMapping("cm_superior_assign_import")
	public void cm_superior_assign_import(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		JSONObject json = new JSONObject();
		long now = new Date().getTime();
		// 获取用户对象
        User user = (User)session.getAttribute("user");
        String imagePath = request.getSession().getServletContext().getRealPath("/") + "/static/upload/portraitImages/";  
	    if (!new File(imagePath).exists()) {
			new File(imagePath).mkdirs();
		}
		
		String assignNumber = request.getParameter("assignNumber");
		String assignPerson = request.getParameter("assignPerson");
		String assignPersonPost = request.getParameter("assignPersonPost");
		String assignCompany = request.getParameter("assignCompany");
		String assignModality = request.getParameter("assignModality");
		String preserver = request.getParameter("preserver");
		String place = request.getParameter("place");
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
						Integer informantSex = null;
						Integer informantAge = null;
						String informantNation = null;
						String informantCardNo = null;
						String informantEducation = null;
						String informantPlace = null;
						String informantpoliticalFace = null;
						String informantPhone = null;
						String matterCategory = null;
						String matterProperty = null;
						String informantGrade = null;
						Integer peopleCount = null;
						String leader = null;
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
							if (!"上级交办".equals(row.getCell(3).getStringCellValue().trim())) {
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
						if (row.getCell(8) != null) {
							row.getCell(8).setCellType(Cell.CELL_TYPE_STRING);
							if ("男".equals(row.getCell(8).getStringCellValue().trim())) {
								informantSex = 1;
							} else if ("女".equals(row.getCell(8).getStringCellValue().trim())) {
								informantSex = 0;
							}
						}
						if (row.getCell(9) != null) {
							row.getCell(9).setCellType(Cell.CELL_TYPE_STRING);
							informantAge = Integer.parseInt(row.getCell(9).getStringCellValue().trim());
						}
						if (row.getCell(10) != null) {
							row.getCell(10).setCellType(Cell.CELL_TYPE_STRING);
							informantNation = row.getCell(10).getStringCellValue().trim();
						}
						if (row.getCell(11) != null) {
							row.getCell(11).setCellType(Cell.CELL_TYPE_STRING);
							informantCardNo = row.getCell(11).getStringCellValue().trim();
						}
						if (row.getCell(12) != null) {
							row.getCell(12).setCellType(Cell.CELL_TYPE_STRING);
							informantEducation = row.getCell(12).getStringCellValue().trim();
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
						if (row.getCell(18) != null) {
							row.getCell(18).setCellType(Cell.CELL_TYPE_STRING);
							matterProperty = row.getCell(18).getStringCellValue().trim();
						}
						if (row.getCell(19) != null) {
							row.getCell(19).setCellType(Cell.CELL_TYPE_STRING);
							informantGrade = row.getCell(19).getStringCellValue().trim();
						}
						if (row.getCell(20) != null) {
							row.getCell(20).setCellType(Cell.CELL_TYPE_STRING);
							peopleCount = Integer.parseInt(row.getCell(20).getStringCellValue().trim());
						}
						if (row.getCell(37) != null) {
							row.getCell(37).setCellType(Cell.CELL_TYPE_STRING);
							leader = row.getCell(37).getStringCellValue().trim();
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
						if (row.getCell(39) != null) {
							row.getCell(39).setCellType(Cell.CELL_TYPE_STRING);
							guestbookId = Integer.parseInt(row.getCell(39).getStringCellValue().trim());
						}
						
						Guestbook g = new Guestbook();
						g.setSiteId(1);
						g.setCtgId(4);
						g.setIp(request.getRemoteAddr());
						g.setCreateTime(createTime);
						g.setChecked(false);
						g.setRecommend(false);
						g.setComplaintNumber(complaintNumber);
						g.setCreateUser(user);
						g.setStatus(1);
						g.setPeopleCount(peopleCount);
						g.setLeader(leader);
						g.setAppeals(appeals);
						g.setPreliminaryOpinion(preliminaryOpinion);
						
						GuestbookExt e = new GuestbookExt();
						e.setInformantName(informantName);
						e.setInformantNation(informantNation);
						e.setInformantSex(informantSex);
						e.setInformantPhone(informantPhone);
						e.setInformantCardNo(informantCardNo);
						e.setInformantpoliticalFace(informantpoliticalFace);
						e.setInformantPlace(informantPlace);
						e.setReportedName(reportedName);
						e.setReportedCompany(reportedCompany);
						e.setReportedDuties(reportedDuties);
						e.setReportedLevel(reportedLevel);
						e.setMatterCategory(matterCategory);
						e.setInformantAge(informantAge);
						e.setInformantEducation(informantEducation);
						e.setProcessingCompany(organizationalService.findById(processingCompany));
						e.setProcessingHead(userService.findById(processingHead));
						e.setInformantGrade(informantGrade);
						e.setMatterProperty(matterProperty);
						e.setAssignNumber(assignNumber);
						e.setAssignPerson(assignPerson);
						e.setAssignPersonPost(assignPersonPost);
						e.setAssignCompany(assignCompany);
						e.setAssignModality(assignModality);
						e.setPreserver(preserver);
						e.setPlace(place);
						
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
	@RequestMapping("cm_superior_assign_processingCompany")
	public void cm_superior_assign_processingCompany(HttpServletRequest request, 
			HttpServletResponse response, HttpSession session, ModelMap model, Integer pageNumber, 
			Integer pageSize, Integer id, String name) {
		
		int totalRecord = organizationalService.getChildPageCount();
		
		List<Organization> organizationList = organizationalService.getChildListByPage(pageNumber, pageSize);
		
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
	@RequestMapping("cm_superior_assign_getUserByOrganizational")
	public void cm_superior_assign_getUserByOrganizational(HttpServletRequest request, 
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
