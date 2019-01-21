package com.cxgc.front.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cxgc.front.model.Dictionary;
import com.cxgc.front.model.Guestbook;
import com.cxgc.front.model.GuestbookAttr;
import com.cxgc.front.model.GuestbookCase;
import com.cxgc.front.model.GuestbookCtg;
import com.cxgc.front.model.GuestbookExt;
import com.cxgc.front.model.GuestbookReason;
import com.cxgc.front.model.Organization;
import com.cxgc.front.model.User;
import com.cxgc.front.service.DictionaryService;
import com.cxgc.front.service.GuestbookAttrService;
import com.cxgc.front.service.GuestbookCaseService;
import com.cxgc.front.service.GuestbookCtgService;
import com.cxgc.front.service.GuestbookReasonService;
import com.cxgc.front.service.GuestbookService;
import com.cxgc.front.service.OrganizationalService;
import com.cxgc.front.service.UserService;
import com.cxgc.front.util.DateUtils;
import com.cxgc.front.util.ResponseUtils;
import com.cxgc.front.util.StacticVariable;
import com.cxgc.front.util.picProcessUtil;

import net.sf.json.JSONObject;

/**
 * 事件处理
 * @author Administrator
 *
 */
@Controller
public class EventHandlingController {
	
	@Autowired
	private GuestbookService<T> guestbookService;
	
	@Autowired
	private GuestbookAttrService<T> attrService;
	
	@Autowired
	private GuestbookCtgService<T> guestbookCtgService;
	
	@Autowired
	private DictionaryService<T> dictionaryService;
	
	@Autowired
	private OrganizationalService organizationalService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private GuestbookReasonService<T> guestbookReasonService;
	
	@Autowired
	private GuestbookCaseService guestbookCaseService;
	
	/**
	 * 事件处理列表显示
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("cm_event_handling_list")
	public String cm_event_handling_list(HttpServletRequest request, HttpServletResponse response, 
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
		Integer ctgId = request.getParameter("ctgId") != null 
				&& !"".equals(request.getParameter("ctgId").trim()) 
				? Integer.parseInt(request.getParameter("ctgId")) : null;
		
		int totalRecord = guestbookService.getPageCount5(startTime, endTime, complaintNumber, 
				matterCategory, ctgId, user.getId());
		
		if(pageNum <= 0){
			pageNum = 1;
		}
		if(pageNum > (totalRecord + pagesize -1) / pagesize){
			pageNum = (totalRecord + pagesize -1) / pagesize;
		}
		
		List<Guestbook> guestBookList = guestbookService.getListByPage5(startTime, endTime, 
				complaintNumber, matterCategory, ctgId, user.getId(), pageNum, pagesize);
		
		List<Dictionary> matterCategoryList = dictionaryService.getList(null, null, "matterCategory");
		 
		List<Dictionary> assignModalityList = dictionaryService.getList(null, 
				null, "superior_assign_modality");
		
		List<GuestbookCtg> guestbookCtgList = guestbookCtgService.findAll();
		
		model.put("totalPages", (totalRecord + pagesize -1) / pagesize);
		model.put("totalRecord", totalRecord);
		model.put("pageNum", pageNum);
		
		model.put("startTimeTemp", startTimeTemp);
		model.put("endTimeTemp", endTimeTemp);
		model.put("complaintNumber", complaintNumber);
		model.put("matterCategory", matterCategory);
		model.put("ctgId", ctgId);
		model.put("guestBookList", guestBookList);
		model.put("matterCategoryList", matterCategoryList);
		model.put("assignModalityList", assignModalityList);
		model.put("guestbookCtgList", guestbookCtgList);
		
		String res = "eventHandling/eventHandlingList";
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
	@RequestMapping("cm_event_handling_look")
	public String cm_event_handling_look(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		Integer guestbookId = request.getParameter("guestbookId") != null 
				&& !"".equals(request.getParameter("guestbookId").trim()) 
				? Integer.parseInt(request.getParameter("guestbookId")) : null;
				
		Guestbook guestbook = guestbookService.findById(guestbookId);
		
		model.put("guestbook", guestbook);

		getInfo(model, guestbookId);
		
		List<Dictionary> genderList = dictionaryService.getList(null, null, "gender");
		List<Dictionary> politicalFaceList = dictionaryService.getList(null, null, "political_face");
		List<Dictionary> informantGradeList = dictionaryService.getList(null, null, "informantGrade");
		List<Dictionary> matterCategoryList = dictionaryService.getList(null, null, "matterCategory");
		List<Dictionary> levelList = dictionaryService.getList(null, null, "level");
		List<Dictionary> nationList = dictionaryService.getList(null, null, "nation");
		List<Dictionary> educationList = dictionaryService.getList(null, null, "education");
		List<Dictionary> matterPropertyList = dictionaryService.getList(null, null, "matterProperty");
		List<Dictionary> assignModalityList = dictionaryService.getList(null, 
				null, "superior_assign_modality");
		
		model.put("genderList", genderList);
		model.put("politicalFaceList", politicalFaceList);
		model.put("informantGradeList", informantGradeList);
		model.put("matterCategoryList", matterCategoryList);
		model.put("levelList", levelList);
		model.put("nationList", nationList);
		model.put("educationList", educationList);
		model.put("matterPropertyList", matterPropertyList);
		model.put("assignModalityList", assignModalityList);
		
		List<Organization> organizationList = organizationalService.getList(null);
		List<User> userList = userService.getListByOrganizational(guestbook.getExt().getProcessingCompany().getId());
		
		model.put("organizationList", organizationList);
		model.put("userList", userList);
		
		String res = "";
		switch (guestbook.getCtgId().toString()) {
			case "1":
				res = "eventHandling/onlinePetitionLook";
				break;
			case "2":
				res = "eventHandling/visitingRegistrationLook";
				break;
			case "3":
				res = "eventHandling/incomingLetterLook";
				break;
			case "4":
				res = "eventHandling/superiorAssignLook";
				break;
			default:
				res = "eventHandling/eventHandlingList";
				break;
		}
		return res;
		
	}
	
	/**
	 * 信访事件处理
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("cm_event_handling")
	public String cm_event_handling(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		Integer guestbookId = request.getParameter("guestbookId") != null 
				&& !"".equals(request.getParameter("guestbookId").trim()) 
				? Integer.parseInt(request.getParameter("guestbookId")) : null;
				
		Guestbook guestbook = guestbookService.findById(guestbookId);
		List<User> userList = userService.getListByOrganizational(guestbook.getExt().getProcessingCompany().getId());
		
		model.put("guestbook", guestbook);
		model.put("userList", userList);
		
		String res = "eventHandling/eventHandling";
		
		if (guestbook.getStatus() == 10) {
			res = "eventHandling/inHand";
		}
		
		
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
	@RequestMapping("cm_event_handling_save")
	public void cm_event_handling_save(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		Integer guestbookId = request.getParameter("guestbookId") != null && !"".equals(request.getParameter("guestbookId").trim()) ? Integer.parseInt(request.getParameter("guestbookId")) : null;
		Integer status = request.getParameter("status") != null && !"".equals(request.getParameter("status").trim()) ? Integer.parseInt(request.getParameter("status")) : null;
		String reason = request.getParameter("reason");
		Integer processingCompany = request.getParameter("processingCompany") != null && !"".equals(request.getParameter("processingCompany").trim()) ? Integer.parseInt(request.getParameter("processingCompany")) : null;
		Integer processingHead = request.getParameter("processingHead") != null && !"".equals(request.getParameter("processingHead").trim()) ? Integer.parseInt(request.getParameter("processingHead")) : null;
		Date endTime = DateUtils.getStr2Date7(request.getParameter("endTime"));
		
		String fileDocPaths = request.getParameter("fileDocPath");
		String fileMediaPaths = request.getParameter("fileMediaPath");
		String fileVideoPaths= request.getParameter("fileVideoPath");
		String fileImagePaths = request.getParameter("fileImagePath");
		
		String fileDocOriginalName = request.getParameter("fileDocOriginalName");
		String fileMediaOriginalName = request.getParameter("fileMediaOriginalName");
		String fileVideoOriginalName = request.getParameter("fileVideoOriginalName");
		String fileImageOriginalName = request.getParameter("fileImageOriginalName");
		
		JSONObject json = new JSONObject();
		
		// 获取用户对象
		User user = (User)session.getAttribute("user");
		
		Guestbook g = guestbookService.findById(guestbookId);
		g.setStatus(status);
		
		GuestbookReason guestbookReason = new GuestbookReason();
        guestbookReason.setGuestbook(g);
        guestbookReason.setCreateUser(user);
        guestbookReason.setStatus(status);
        guestbookReason.setCreateTime(new Date());
        guestbookReason.setReason(reason);
        GuestbookReason r = guestbookReasonService.save(guestbookReason);
        
        List<GuestbookCase> guestbookCaseList = guestbookCaseService.getCase(guestbookId, 0);
        for (GuestbookCase guestbookCase : guestbookCaseList) {
        	Guestbook follower = guestbookService.findById(guestbookCase.getFollower());
        	follower.setStatus(status);
        	if (status == 6) {
        		follower.setEndTime(endTime);
        	}
        	guestbookService.update(follower);
		}
		
        
		switch (status.toString()) {
			case "6":
				
				g.setEndTime(endTime);
				
				GuestbookExt e6 = g.getExt();
				e6.setProcessingCompany(organizationalService.findById(processingCompany));
				e6.setProcessingHead(userService.findById(processingHead));
				
				Guestbook g6 = guestbookService.save(g, e6);
				
				if(g6!=null && r!=null){
					json.put("success", true);
					json.put("status", 0);
				}else {
					json.put("success", true);
					json.put("status", 1);
				}
				
				break;
			case "9":
				
				ArrayList<GuestbookAttr> list9 = new ArrayList<>();
				
				if(fileDocPaths!=null && !"".equals(fileDocPaths)){
					
					attrService.deleteByList(g.getId(), 9);
					
					String[] fileDocPathTemp = fileDocPaths.split(",");
					String[] fileDocOriginalNameTemp = fileDocOriginalName.split("\\|");
					
					for (int i = 0; i < fileDocPathTemp.length; i++) {
						GuestbookAttr a = new GuestbookAttr();
						a.setGuestbook(g);
						a.setName(fileDocOriginalNameTemp[i]);
						a.setPath(fileDocPathTemp[i]);
						a.setType(9);
						list9.add(a);
						attrService.save(a);
					}
				}
				
				if(fileMediaPaths!=null && !"".equals(fileMediaPaths)){
					
					attrService.deleteByList(g.getId(), 10);
					
					String[] fileMediaPathsTemp = fileMediaPaths.split(",");
					String[] fileMediaOriginalNameTemp = fileMediaOriginalName.split("\\|");
					
					for (int i = 0; i < fileMediaPathsTemp.length; i++) {
						GuestbookAttr a = new GuestbookAttr();
						a.setGuestbook(g);
						a.setName(fileMediaOriginalNameTemp[i]);
						a.setPath(fileMediaPathsTemp[i]);
						a.setType(10);
						list9.add(a);
						attrService.save(a);
					}
				}
				
				if(fileVideoPaths!=null && !"".equals(fileVideoPaths)){
					
					attrService.deleteByList(g.getId(), 11);
					
					String[] fileVideoPathsTemp = fileVideoPaths.split(",");
					String[] fileVideoOriginalNameTemp = fileVideoOriginalName.split("\\|");
					
					for (int i = 0; i < fileVideoPathsTemp.length; i++) {
						GuestbookAttr a = new GuestbookAttr();
						a.setGuestbook(g);
						a.setName(fileVideoOriginalNameTemp[i]);
						a.setPath(fileVideoPathsTemp[i]);
						a.setType(11);
						list9.add(a);
						attrService.save(a);
					}
				}
				
				if(fileImagePaths!=null && !"".equals(fileImagePaths)){
					
					attrService.deleteByList(g.getId(), 12);
					
					String[] fileImagePathsTemp = fileImagePaths.split(",");
					String[] fileImageOriginalNameTemp = fileImageOriginalName.split("\\|");
					
					for (int i = 0; i < fileImagePathsTemp.length; i++) {
						GuestbookAttr a = new GuestbookAttr();
						a.setGuestbook(g);
						a.setName(fileImageOriginalNameTemp[i]);
						a.setPath(fileImagePathsTemp[i]);
						a.setType(12);
						list9.add(a);
						attrService.save(a);
					}
					
				}
				g.setAttachments(list9);
				
				Guestbook g9 = guestbookService.update(g);
				
				if(g9!=null && r!=null){
					json.put("success", true);
					json.put("status", 0);
				}else {
					json.put("success", true);
					json.put("status", 1);
				}
				
				break;
			case "10":
				
				GuestbookExt e10 = g.getExt();
				e10.setProcessingCompany(organizationalService.findById(processingCompany));
				e10.setProcessingHead(userService.findById(processingHead));
				
				Guestbook g10 = guestbookService.save(g, e10);
				
				ArrayList<GuestbookAttr> list10 = new ArrayList<>();
				
				if(fileDocPaths!=null && !"".equals(fileDocPaths)){
					
					attrService.deleteByList(g10.getId(), 5);
					
					String[] fileDocPathTemp = fileDocPaths.split(",");
					String[] fileDocOriginalNameTemp = fileDocOriginalName.split("\\|");
					
					for (int i = 0; i < fileDocPathTemp.length; i++) {
						GuestbookAttr a = new GuestbookAttr();
						a.setGuestbook(g10);
						a.setName(fileDocOriginalNameTemp[i]);
						a.setPath(fileDocPathTemp[i]);
						a.setType(5);
						list10.add(a);
						attrService.save(a);
					}
				}
				
				if(fileMediaPaths!=null && !"".equals(fileMediaPaths)){
					
					attrService.deleteByList(g10.getId(), 6);
					
					String[] fileMediaPathsTemp = fileMediaPaths.split(",");
					String[] fileMediaOriginalNameTemp = fileMediaOriginalName.split("\\|");
					
					for (int i = 0; i < fileMediaPathsTemp.length; i++) {
						GuestbookAttr a = new GuestbookAttr();
						a.setGuestbook(g10);
						a.setName(fileMediaOriginalNameTemp[i]);
						a.setPath(fileMediaPathsTemp[i]);
						a.setType(6);
						list10.add(a);
						attrService.save(a);
					}
				}
				
				if(fileVideoPaths!=null && !"".equals(fileVideoPaths)){
					
					attrService.deleteByList(g10.getId(), 7);
					
					String[] fileVideoPathsTemp = fileVideoPaths.split(",");
					String[] fileVideoOriginalNameTemp = fileVideoOriginalName.split("\\|");
					
					for (int i = 0; i < fileVideoPathsTemp.length; i++) {
						GuestbookAttr a = new GuestbookAttr();
						a.setGuestbook(g10);
						a.setName(fileVideoOriginalNameTemp[i]);
						a.setPath(fileVideoPathsTemp[i]);
						a.setType(7);
						list10.add(a);
						attrService.save(a);
					}
				}
				
				if(fileImagePaths!=null && !"".equals(fileImagePaths)){
					
					attrService.deleteByList(g10.getId(), 8);
					
					String[] fileImagePathsTemp = fileImagePaths.split(",");
					String[] fileImageOriginalNameTemp = fileImageOriginalName.split("\\|");
					
					for (int i = 0; i < fileImagePathsTemp.length; i++) {
						GuestbookAttr a = new GuestbookAttr();
						a.setGuestbook(g10);
						a.setName(fileImageOriginalNameTemp[i]);
						a.setPath(fileImagePathsTemp[i]);
						a.setType(8);
						list10.add(a);
						attrService.save(a);
					}
					
				}
				g10.setAttachments(list10);
				
				Guestbook u10 = guestbookService.update(g10);
				
				if(u10!=null && r!=null){
					json.put("success", true);
					json.put("status", 0);
				}else {
					json.put("success", true);
					json.put("status", 1);
				}
				
				break;
			case "5":
			case "7":
			case "8":
				
				Guestbook g578 = guestbookService.update(g);
				
				if(g578!=null && r!=null){
					json.put("success", true);
					json.put("status", 0);
				}else {
					json.put("success", true);
					json.put("status", 1);
				}
				
				break;
			default:
				
				json.put("success", true);
				json.put("status", 1);
				
				break;
		}
		
		ResponseUtils.renderJson(response, json.toString());
		
	}
	
	/**
	 * 图片列表
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("cm_event_handling_image_list")
	public String cm_event_handling_image_list(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		Integer guestbookId = request.getParameter("guestbookId") != null && !"".equals(request.getParameter("guestbookId").trim()) ? Integer.parseInt(request.getParameter("guestbookId")) : null;
		
		List<GuestbookAttr> picList = attrService.getList(guestbookId, null);
		
		model.put("picList", picList);
			
		String res = "eventHandling/eventHandlingImageList";
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
	@RequestMapping("cm_event_handling_image")
	public String cm_event_handling_image(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		Integer attachmentsId = request.getParameter("attachmentsId") != null && !"".equals(request.getParameter("attachmentsId").trim()) ? Integer.parseInt(request.getParameter("attachmentsId")) : null;
		
		GuestbookAttr guestbookAttr = attrService.findById(attachmentsId);
		
		model.put("guestbookAttr", guestbookAttr);
		
		String res = "eventHandling/eventHandlingImage";
		return res;
	}
	
	/**
	 * 图片识别
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 */
	@RequestMapping("cm_event_handling_image_recognition")
	public void cm_event_handling_image_recognition(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		JSONObject json = new JSONObject();
		
		Integer attachmentsId = request.getParameter("attachmentsId") != null && !"".equals(request.getParameter("attachmentsId").trim()) ? Integer.parseInt(request.getParameter("attachmentsId")) : null;
		
		GuestbookAttr guestbookAttr = attrService.findById(attachmentsId);
		
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
	@RequestMapping("cm_event_handling_image_recognition_update")
	public void cm_event_handling_image_recognition_update(HttpServletRequest request, HttpServletResponse response, 
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
	
	/**
	 * 信息显示
	 * @param model
	 * @param id
	 */
	public void getInfo(ModelMap model,Integer id){
		List<Dictionary> genderList = dictionaryService.getList(null, null, "gender");
		List<Dictionary> nationList = dictionaryService.getList(null, null, "nation");
		List<Dictionary> educationList = dictionaryService.getList(null, null, "education");
		List<Dictionary> politicalFaceList = dictionaryService.getList(null, null, "political_face");
		List<Dictionary> matterPropertyList = dictionaryService.getList(null, null, "matterProperty");
		List<Dictionary> informantGradeList = dictionaryService.getList(null, null, "informantGrade");
		List<Dictionary> matterCategoryList = dictionaryService.getList(null, null, "matterCategory");
		List<Dictionary> levelList = dictionaryService.getList(null, null, "level");
		
		Guestbook g = guestbookService.findById(id);
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
	@RequestMapping("cm_event_handling_processingCompany")
	public void cm_event_handling_processingCompany(HttpServletRequest request, 
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
	@RequestMapping("cm_event_handling_getUserByOrganizational")
	public void cm_event_handling_getUserByOrganizational(HttpServletRequest request, 
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
