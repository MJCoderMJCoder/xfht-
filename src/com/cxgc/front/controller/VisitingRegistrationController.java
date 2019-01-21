package com.cxgc.front.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.ss.formula.functions.T;
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
import com.cxgc.front.model.User;
import com.cxgc.front.service.DictionaryService;
import com.cxgc.front.service.GuestbookAttrService;
import com.cxgc.front.service.GuestbookExtService;
import com.cxgc.front.service.GuestbookService;
import com.cxgc.front.service.OperationLogService;
import com.cxgc.front.service.OrganizationalService;
import com.cxgc.front.service.UserService;
import com.cxgc.front.util.NumberUtil;
import com.cxgc.front.util.ResponseUtils;
import com.cxgc.front.util.picProcessUtil;

import net.sf.json.JSONObject;

@Controller
public class VisitingRegistrationController {

	private static int PAGE_COUNT_10 = 10;
	
	@Autowired
	private GuestbookService<T> service;
	
	@Autowired
	private DictionaryService<T> dictionaryService;
	
	@Autowired
	private GuestbookAttrService<T> attrService;
	
	@Autowired
	private GuestbookExtService<T> extService;
	
	@Autowired
	private OrganizationalService organizationalService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OperationLogService<T> logService;
	
	@RequestMapping("cm_visitingRegistration_list1")
	public String list(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException{
		
		// 获取用户对象
        User user = (User)session.getAttribute("user");
        
        List<Dictionary> matterCategoryList = dictionaryService.getList(null, null, "matterCategory");
        
		Integer pageNum = request.getParameter("pageNum") != null && !"".equals(request.getParameter("pageNum").trim()) ? Integer.parseInt(request.getParameter("pageNum")) : 1;
		String informantName = request.getParameter("informantName");
		String informantCardNo = request.getParameter("informantCardNo");
		String complaintNumber = request.getParameter("complaintNumber");
		String matterCategory = request.getParameter("matterCategory");

		String startTimeTemp = request.getParameter("startTime");
		String endTimeTemp = request.getParameter("endTime");
		
		int totalRecord = service.getPageCount2(informantName, informantCardNo, startTimeTemp, endTimeTemp, complaintNumber, matterCategory, 2, user.getId(),null);
		
		if(pageNum <= 0){
			pageNum = 1;
		}
		if(pageNum > (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10){
			pageNum = (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10;
		}
		
		List<Guestbook> guestBookList = service.getListByPage2(informantName, informantCardNo, startTimeTemp, endTimeTemp, complaintNumber, matterCategory, 2, user.getId(), null,pageNum, PAGE_COUNT_10);
		
		model.put("totalPages", (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10);
		model.put("totalRecord", totalRecord);
		model.put("pageNum", pageNum);
		
		model.put("startTime", startTimeTemp);
		model.put("endTime", endTimeTemp);
		model.put("informantName", informantName);
		model.put("informantCardNo", informantCardNo);
		model.put("complaintNumber", complaintNumber);
		model.put("matterCategory", matterCategory);
		model.put("guestBookList", guestBookList);
		model.put("matterCategoryList", matterCategoryList);

		String res = "publicVoiceRegister/visitingRegistration/list";
		return res;
	}
	
	/**
	 * 来访登记添加页
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping("cm_visitingRegistration_add1")
	public String add(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		
		List<Dictionary> genderList = dictionaryService.getList(null, null, "gender");
		List<Dictionary> nationList = dictionaryService.getList(null, null, "nation");
		List<Dictionary> educationList = dictionaryService.getList(null, null, "education");
		List<Dictionary> politicalFaceList = dictionaryService.getList(null, null, "political_face");
		List<Dictionary> matterPropertyList = dictionaryService.getList(null, null, "matterProperty");
		List<Dictionary> informantGradeList = dictionaryService.getList(null, null, "informantGrade");
		List<Dictionary> matterCategoryList = dictionaryService.getList(null, null, "matterCategory");
		List<Dictionary> levelList = dictionaryService.getList(null, null, "level");
		
		
		model.put("genderList", genderList);
		model.put("nationList", nationList);
		model.put("educationList", educationList);
		model.put("politicalFaceList", politicalFaceList);
		model.put("matterPropertyList", matterPropertyList);
		model.put("informantGradeList", informantGradeList);
		model.put("matterCategoryList", matterCategoryList);
		model.put("levelList", levelList);
		
		String res = "publicVoiceRegister/visitingRegistration/add";
		return res;
	}
	
	
	/**
	 * 保存
	 * @param request
	 * @param response
	 * @param model
	 * @throws JSONException
	 * @throws IOException
	 */
	@RequestMapping(value = "cm_visitingRegistration_save", method = RequestMethod.POST)
	public void save(HttpServletRequest request,HttpSession session,
			HttpServletResponse response, ModelMap model) throws JSONException,
			IOException {
		JSONObject json = new JSONObject();
		
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
		String abnormalBehavior = request.getParameter("abnormalBehavior");
		String appeals = request.getParameter("appeals");
		String preliminaryOpinion = request.getParameter("preliminaryOpinion");
		Integer processingCompany = request.getParameter("processingCompany") != null && !"".equals(request.getParameter("processingCompany").trim()) ? Integer.parseInt(request.getParameter("processingCompany")) : null;
		Integer processingHead = request.getParameter("processingHead") != null && !"".equals(request.getParameter("processingHead").trim()) ? Integer.parseInt(request.getParameter("processingHead")) : null;
		Boolean satisfied = "1".equals(request.getParameter("satisfied")) ? true : false;
		String receptionist = request.getParameter("receptionist");
		String reportedName = request.getParameter("reportedName");
		Integer reportedSex = request.getParameter("reportedSex") != null && !"".equals(request.getParameter("reportedSex").trim()) ? Integer.parseInt(request.getParameter("reportedSex")) : null;
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
		
		String randomCode = NumberUtil.getRandomCode("xf");
		
		// 获取用户对象
        User user = (User)session.getAttribute("user");
		
		Guestbook g = new Guestbook();
		g.setSiteId(1);
		g.setCtgId(2);
		g.setIp(request.getRemoteAddr());
		g.setCreateTime(new Date());
		g.setChecked(false);
		g.setRecommend(false);
		g.setComplaintNumber(randomCode);
		g.setCreateUser(user);
		g.setStatus(1);
		g.setPeopleCount(peopleCount);
		g.setLeader(leader);
		g.setReceptionist(receptionist);
		g.setAppeals(appeals);
		g.setPreliminaryOpinion(preliminaryOpinion);
		g.setSatisfied(satisfied);
		
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
		e.setReportedSex(reportedSex);
		e.setReportedDuties(reportedDuties);
		e.setReportedLevel(reportedLevel);
		e.setMatterCategory(matterCategory);
		e.setInformantAge(informantAge);
		e.setInformantEducation(informantEducation);
		e.setProcessingCompany(organizationalService.findById(processingCompany));
		e.setProcessingHead(userService.findById(processingHead));
		e.setInformantGrade(informantGrade);
		e.setAbnormalBehavior(abnormalBehavior);
		e.setMatterProperty(matterProperty);
		
		Guestbook cg = service.save(g, e);
		
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
		
		Guestbook u = service.update(cg);
		
		
		if(u!=null){
			json.put("success", true);
			json.put("status", 0);
			json.put("complaintNumber",randomCode);
			logService.Save_Log(request, session, "新增来访登记", "1", "id="+u.getId()+" 增加成功","","");
		}else {
			json.put("success", true);
			json.put("status", 1);

		}
		
		ResponseUtils.renderJson(response, json.toString());
	}
	
	/**
	 * 来访登记详细页
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping("cm_visitingRegistration_detailed1")
	public String detailed(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		

		Integer id = request.getParameter("id") != null && !"".equals(request.getParameter("id").trim()) ? Integer.parseInt(request.getParameter("id")) : null;
		
		model.put("guestbookId", id);
		
		String res = "publicVoiceRegister/visitingRegistration/detailed";
		return res;
	}
	
	/**
	 * 修改
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping("cm_visitingRegistration_edit1")
	public String edit(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		
		Integer id = request.getParameter("id") != null && !"".equals(request.getParameter("id").trim()) ? Integer.parseInt(request.getParameter("id")) : null;
		
		model.put("guestbookId", id);
		
		String res = "publicVoiceRegister/visitingRegistration/edit";
		return res;
	}
	
	
	/**
	 * 修改状态
	 * @param request
	 * @param session
	 * @param response
	 * @param model
	 * @throws JSONException
	 * @throws IOException
	 */
	@RequestMapping(value = "cm_visitingRegistration_updateBook1", method = RequestMethod.POST)
	public void updateBook(HttpServletRequest request,HttpSession session,
			HttpServletResponse response, ModelMap model) throws JSONException,
			IOException {
			
			JSONObject json = new JSONObject();
			
			Integer id = request.getParameter("id") != null && !"".equals(request.getParameter("id").trim()) ? Integer.parseInt(request.getParameter("id")) : null;
			Integer status = request.getParameter("status") != null && !"".equals(request.getParameter("status").trim()) ? Integer.parseInt(request.getParameter("status")) : null;
			
			Guestbook g = service.findById(id);
			g.setStatus(status);
			Guestbook newBook = service.update(g);
			
			if(newBook!=null){
				json.put("success", true);
				json.put("status", 0);
				if(status==0){
					logService.Save_Log(request, session, "来访登记删除", "1", "id="+newBook.getId()+" 删除成功","","");
				}else{
					logService.Save_Log(request, session, "来访登记状态变更", "1", "id="+newBook.getId()+" 状态变更为:"+status,"","");
				}
			}else{
				json.put("success", true);
				json.put("status", 1);
			}
		ResponseUtils.renderJson(response, json.toString());
	}
	
	public void getInfo(ModelMap model,Integer id){
		List<Dictionary> genderList = dictionaryService.getList(null, null, "gender");
		List<Dictionary> nationList = dictionaryService.getList(null, null, "nation");
		List<Dictionary> educationList = dictionaryService.getList(null, null, "education");
		List<Dictionary> politicalFaceList = dictionaryService.getList(null, null, "political_face");
		List<Dictionary> matterPropertyList = dictionaryService.getList(null, null, "matterProperty");
		List<Dictionary> informantGradeList = dictionaryService.getList(null, null, "informantGrade");
		List<Dictionary> matterCategoryList = dictionaryService.getList(null, null, "matterCategory");
		List<Dictionary> levelList = dictionaryService.getList(null, null, "level");
		
		Guestbook g = service.findById(id);
		List<GuestbookAttr> docList = attrService.getList(g.getId(), 1);
		List<GuestbookAttr> mediaList = attrService.getList(g.getId(), 2);
		List<GuestbookAttr> videoList = attrService.getList(g.getId(), 3);
		List<GuestbookAttr> picList = attrService.getList(g.getId(), 4);
		
		model.put("g", g);
		model.put("docList",docList );
		model.put("mediaList", mediaList);
		model.put("videoList", videoList);
		model.put("picList", picList);
		
		model.put("genderList", genderList);
		model.put("nationList", nationList);
		model.put("educationList", educationList);
		model.put("politicalFaceList", politicalFaceList);
		model.put("matterPropertyList", matterPropertyList);
		model.put("informantGradeList", informantGradeList);
		model.put("matterCategoryList", matterCategoryList);
		model.put("levelList", levelList);
		
		List<User> userList = userService.getListByOrganizational(g.getExt().getProcessingCompany().getId());
		
		model.put("userList", userList);
	}
	
	
	
	@RequestMapping(value = "cm_visitingRegistration_update", method = RequestMethod.POST)
	public void update(HttpServletRequest request,HttpSession session,
			HttpServletResponse response, ModelMap model) throws JSONException,
			IOException {
		JSONObject json = new JSONObject();
		
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
		String abnormalBehavior = request.getParameter("abnormalBehavior");
		String appeals = request.getParameter("appeals");
		String preliminaryOpinion = request.getParameter("preliminaryOpinion");
		Integer processingCompany = request.getParameter("processingCompany") != null && !"".equals(request.getParameter("processingCompany").trim()) ? Integer.parseInt(request.getParameter("processingCompany")) : null;
		Integer processingHead = request.getParameter("processingHead") != null && !"".equals(request.getParameter("processingHead").trim()) ? Integer.parseInt(request.getParameter("processingHead")) : null;
		Boolean satisfied = "1".equals(request.getParameter("satisfied")) ? true : false;
		String receptionist = request.getParameter("receptionist");
		String reportedName = request.getParameter("reportedName");
		Integer reportedSex = request.getParameter("reportedSex") != null && !"".equals(request.getParameter("reportedSex").trim()) ? Integer.parseInt(request.getParameter("reportedSex")) : null;
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
		
		Integer guestbookId = request.getParameter("guestbookId") != null && !"".equals(request.getParameter("guestbookId").trim()) ? Integer.parseInt(request.getParameter("guestbookId")) : null;
		
        Guestbook g = service.findById(guestbookId);
        GuestbookExt e = g.getExt();
        
		g.setIp(request.getRemoteAddr());
		g.setPeopleCount(peopleCount);
		g.setLeader(leader);
		g.setReceptionist(receptionist);
		g.setAppeals(appeals);
		g.setPreliminaryOpinion(preliminaryOpinion);
		g.setSatisfied(satisfied);
		
		e.setInformantName(informantName);
		e.setInformantNation(informantNation);
		e.setInformantSex(informantSex);
		e.setInformantPhone(informantPhone);
		e.setInformantCardNo(informantCardNo);
		e.setInformantpoliticalFace(informantpoliticalFace);
		e.setInformantPlace(informantPlace);
		e.setReportedName(reportedName);
		e.setReportedCompany(reportedCompany);
		e.setReportedSex(reportedSex);
		e.setReportedDuties(reportedDuties);
		e.setReportedLevel(reportedLevel);
		e.setMatterCategory(matterCategory);
		e.setInformantAge(informantAge);
		e.setInformantEducation(informantEducation);
		e.setProcessingCompany(organizationalService.findById(processingCompany));
		e.setProcessingHead(userService.findById(processingHead));
		e.setInformantGrade(informantGrade);
		e.setAbnormalBehavior(abnormalBehavior);
		e.setMatterProperty(matterProperty);
		
		Guestbook cg = service.update(g);
		extService.update(e);
		
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
		
		Guestbook u = service.update(cg);
		
		
		if(u!=null){
			json.put("success", true);
			json.put("status", 0);
			logService.Save_Log(request, session, "来访登记修改", "1", "id="+u.getId()+" 修改成功","","");
		}else {
			json.put("success", true);
			json.put("status", 1);

		}
		
		ResponseUtils.renderJson(response, json.toString());
	}
	
	/**
	 * 图片列表
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping("cm_visitingRegistration_picList")
	public String picList(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session,Integer id){
		
		getInfo(model, id);
		
		String res = "publicVoiceRegister/visitingRegistration/picList";
		return res;
	}
	
	/**
	 * 图片识别
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 * @param attrId
	 * @return
	 */
	@RequestMapping("cm_visitingRegistration_distinguish")
	public String distinguish(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session,Integer attrId){
		
		GuestbookAttr guestbookAttr = attrService.findById(attrId);
		model.put("guestbookAttr", guestbookAttr);
		
		String res = "publicVoiceRegister/visitingRegistration/distinguish";
		return res;
	}
	
	/**
	 * 图片处理
	 * @param request
	 * @param session
	 * @param response
	 * @param model
	 * @throws JSONException
	 * @throws IOException
	 */
	@RequestMapping(value = "cm_visitingRegistration_recognition", method = RequestMethod.POST)
	public void recognition(HttpServletRequest request,HttpSession session,
			HttpServletResponse response, ModelMap model) throws JSONException,
			IOException {
			
		JSONObject json = new JSONObject();
		
		Integer attrId = request.getParameter("attrId") != null && !"".equals(request.getParameter("attrId").trim()) ? Integer.parseInt(request.getParameter("attrId")) : null;
		
		GuestbookAttr g = attrService.findById(attrId);
		
		String pix = FilenameUtils.getExtension(g.getName()).toLowerCase(Locale.ENGLISH);
		
		String[] tempName = g.getPath().split("/");
		String imageName=tempName[tempName.length-1];
		
		
		String realPath = request.getSession().getServletContext().getRealPath("/");
		realPath=realPath.replaceAll("\\\\", "/");
		String imagePath = realPath + "static/upload/portraitImages/";  
		
		
		try {
			String word = picProcessUtil.getWord(imagePath, imageName, pix);
			json.put("success", true);
			json.put("status", 0);
			json.put("word", word);
		} catch (Exception e) {
			json.put("success", true);
			json.put("status", 1);
			e.printStackTrace();
		}
		
		ResponseUtils.renderJson(response, json.toString());
	}
	
	/**
	 * 更新附件表识别字段
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 */
	@RequestMapping("cm_visitingRegistration_recognition_update")
	public void cm_superior_assign_image_recognition_update(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		JSONObject json = new JSONObject();
		
		Integer attachmentsId = request.getParameter("attachmentsId") != null && !"".equals(request.getParameter("attachmentsId").trim()) ? Integer.parseInt(request.getParameter("attachmentsId")) : null;
		String content = request.getParameter("content");
		
		
		GuestbookAttr guestbookAttr = attrService.findById(attachmentsId);
		guestbookAttr.setImageRecognition(content);
		guestbookAttr = attrService.update(guestbookAttr);
		
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
	
	
}
