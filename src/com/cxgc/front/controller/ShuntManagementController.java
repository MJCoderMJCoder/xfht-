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

import net.sf.json.JSONObject;

/**
 * 分流管理
 * @author Administrator
 *
 */
@Controller
public class ShuntManagementController {
	
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
	 * 分流处理列表显示
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("cm_shunt_management_list")
	public String cm_shunt_management_list(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, ModelMap model) {
		
		int pagesize = StacticVariable.getPageCount();
		
		Integer pageNum = request.getParameter("pageNum") != null 
				&& !"".equals(request.getParameter("pageNum").trim()) 
				? Integer.parseInt(request.getParameter("pageNum")) : 1;
		String complaintNumber = request.getParameter("complaintNumber");
		String matterCategory = request.getParameter("matterCategory");
		Integer ctgId = request.getParameter("ctgId") != null 
				&& !"".equals(request.getParameter("ctgId").trim()) 
				? Integer.parseInt(request.getParameter("ctgId")) : null;
		
		int totalRecord = guestbookService.getPageCount4(null, null, complaintNumber, 
				matterCategory, ctgId, 2);
		
		if(pageNum <= 0){
			pageNum = 1;
		}
		if(pageNum > (totalRecord + pagesize -1) / pagesize){
			pageNum = (totalRecord + pagesize -1) / pagesize;
		}
		
		List<Guestbook> guestBookList = guestbookService.getListByPage4(null, null, 
				complaintNumber, matterCategory, ctgId, 2, pageNum, pagesize);
		
		List<Dictionary> matterCategoryList = dictionaryService.getList(null, null, "matterCategory");
		 
		List<Dictionary> assignModalityList = dictionaryService.getList(null, 
				null, "superior_assign_modality");
		
		List<GuestbookCtg> guestbookCtgList = guestbookCtgService.findAll();
		
		model.put("totalPages", (totalRecord + pagesize -1) / pagesize);
		model.put("totalRecord", totalRecord);
		model.put("pageNum", pageNum);
		
		model.put("complaintNumber", complaintNumber);
		model.put("matterCategory", matterCategory);
		model.put("ctgId", ctgId);
		model.put("guestBookList", guestBookList);
		model.put("matterCategoryList", matterCategoryList);
		model.put("assignModalityList", assignModalityList);
		model.put("guestbookCtgList", guestbookCtgList);
		
		String res = "shuntManagement/shuntManagementList";
		return res;
	}
	
	/**
	 * 分流处理详细显示
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("cm_shunt_management_check_show")
	public String cm_shunt_management_check_show(HttpServletRequest request, 
			HttpServletResponse response, HttpSession session, ModelMap model) {
		
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
				res = "shuntManagement/onlinePetition";
				break;
			case "2":
				res = "shuntManagement/visitingRegistration";
				break;
			case "3":
				res = "shuntManagement/incomingLetter";
				break;
			case "4":
				res = "shuntManagement/superiorAssign";
				break;
			default:
				res = "shuntManagement/shuntManagementList";
				break;
		}
		return res;
		
	}
	
	/**
	 * 保存
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 */
	@RequestMapping("cm_shunt_management_save")
	public void cm_shunt_management_save(HttpServletRequest request, 
			HttpServletResponse response, HttpSession session, ModelMap model) {
		
		Integer guestbookId = request.getParameter("guestbookId") != null && !"".equals(request.getParameter("guestbookId").trim()) ? Integer.parseInt(request.getParameter("guestbookId")) : null;
		Integer status = request.getParameter("status") != null && !"".equals(request.getParameter("status").trim()) ? Integer.parseInt(request.getParameter("status")) : null;
		String reason = request.getParameter("reason");
		Integer processingCompany = request.getParameter("processingCompany") != null && !"".equals(request.getParameter("processingCompany").trim()) ? Integer.parseInt(request.getParameter("processingCompany")) : null;
		Integer processingHead = request.getParameter("processingHead") != null && !"".equals(request.getParameter("processingHead").trim()) ? Integer.parseInt(request.getParameter("processingHead")) : null;
		Date endTime = DateUtils.getStr2Date7(request.getParameter("endTime"));
		
		JSONObject json = new JSONObject();
		// 获取用户对象
        User user = (User)session.getAttribute("user");
        
        Guestbook g = guestbookService.findById(guestbookId);
        g.setStatus(status);
        g.setEndTime(endTime);
        
        GuestbookReason guestbookReason = new GuestbookReason();
        guestbookReason.setGuestbook(g);
        guestbookReason.setCreateUser(user);
        guestbookReason.setStatus(status);
        guestbookReason.setCreateTime(new Date());
        guestbookReason.setReason(reason);
        GuestbookReason gbr = guestbookReasonService.save(guestbookReason);
        
        List<GuestbookCase> guestbookCaseList = guestbookCaseService.getCase(guestbookId, 0);
        for (GuestbookCase guestbookCase : guestbookCaseList) {
        	Guestbook follower = guestbookService.findById(guestbookCase.getFollower());
        	follower.setStatus(status);
        	follower.setEndTime(endTime);
        	guestbookService.update(follower);
		}
        
        if (status == 3) {
        	GuestbookExt e = g.getExt();
        	e.setProcessingCompany(organizationalService.findById(processingCompany));
        	e.setProcessingHead(userService.findById(processingHead));
        	
        	Guestbook cg = guestbookService.save(g, e);
        	
        	if(cg!=null && gbr!=null){
				json.put("success", true);
				json.put("status", 0);
			}else {
				json.put("success", true);
				json.put("status", 1);
			}
        } else {
        	Guestbook u = guestbookService.update(g);
        	
        	if(u!=null && gbr!=null){
				json.put("success", true);
				json.put("status", 0);
			}else {
				json.put("success", true);
				json.put("status", 1);
			}
        }
		
		ResponseUtils.renderJson(response, json.toString());
		
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
	@RequestMapping("cm_shunt_management_processingCompany")
	public void cm_shunt_management_processingCompany(HttpServletRequest request, 
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
	@RequestMapping("cm_shunt_management_getUserByOrganizational")
	public void cm_shunt_management_getUserByOrganizational(HttpServletRequest request, 
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
