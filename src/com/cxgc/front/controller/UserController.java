package com.cxgc.front.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Base64;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cxgc.front.model.Dictionary;
import com.cxgc.front.model.FaceDB;
import com.cxgc.front.model.Organization;
import com.cxgc.front.model.Person;
import com.cxgc.front.model.Role;
import com.cxgc.front.model.User;
import com.cxgc.front.service.DictionaryService;
import com.cxgc.front.service.FaceDBService;
import com.cxgc.front.service.OperationLogService;
import com.cxgc.front.service.OrganizationalService;
import com.cxgc.front.service.PersonService;
import com.cxgc.front.service.RoleService;
import com.cxgc.front.service.UserRolesService;
import com.cxgc.front.service.UserService;
import com.cxgc.front.util.Md5PwdEncoder;
import com.cxgc.front.util.PageUtil;
import com.cxgc.front.util.ResponseUtils;
import com.cxgc.front.util.StacticVariable;

import net.sf.json.JSONObject;

@Controller
public class UserController {
	private static int PAGE_COUNT_10 = 10;
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrganizationalService organizationalService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private UserRolesService userRolesService;
	
	@Autowired
	private OperationLogService<T> log;
	
	@Autowired
	private DictionaryService<T> dictionaryService;
	
	/*查询列表*/
	@RequestMapping("cm_user_list")
	public String list(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		
		List<Dictionary> genderList = dictionaryService.getList(null, null, "gender");
		List<Organization> organizationList = organizationalService.getList(null);
		
		Integer pageNum = request.getParameter("pageNum") != null && !"".equals(request.getParameter("pageNum").trim()) ? Integer.parseInt(request.getParameter("pageNum")) : 1;
		
		String description = request.getParameter("s_description");
		String username = request.getParameter("s_username");
		String IDNumber = request.getParameter("s_IDNumber");
		String telephone = request.getParameter("s_telephone");
		Integer sex = request.getParameter("s_sex") != null && !"".equals(request.getParameter("s_sex").trim()) ? Integer.parseInt(request.getParameter("s_sex")) : null;
		Integer roleid = request.getParameter("s_role") != null && !"".equals(request.getParameter("s_role").trim()) ? Integer.parseInt(request.getParameter("s_role")) : null;
		Integer organization = request.getParameter("s_organization") != null && !"".equals(request.getParameter("s_organization").trim()) ? Integer.parseInt(request.getParameter("s_organization")) : null;
		
		int totalRecord = userService.getPageCount(description, username, IDNumber, sex, telephone, roleid, organization);
		
		if(pageNum <= 0){
			pageNum = 1;
		}
		if(pageNum > (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10){
			pageNum = (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10;
		}
		
		List<User> list = userService.getListByPage(description, username, IDNumber, sex, telephone, roleid, organization, pageNum, PAGE_COUNT_10);
		
		model.put("totalPages", (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10);
		model.put("totalRecord", totalRecord);
		model.put("pageNum", pageNum);

		model.put("userList", list);
		
		model.put("s_description", description);
		model.put("s_username", username);
		model.put("s_IDNumber", IDNumber);
		model.put("s_sex", sex);
		model.put("s_telephone", telephone);
		model.put("s_role", roleid);
		model.put("s_organization", organization);
		
		model.put("genderList",genderList);
		model.put("organizationList",organizationList);
		model.put("roleList", roleService.findAll());
		
		
		return "user/list";
	}
	
	/*删除单条数据*/
	@RequestMapping("cm_user_delete")
	public void delete(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		String id = request.getParameter("id");
		try {
			if (id != null) {
				//userRolesService.deleteByUserId(Long.parseLong(id));
				if (userService.deleteById(Long.parseLong(id)) > 0) {
					json.put("status", 0);
				} else {
					json.put("status", -1);
				}
			} else {
				json.put("status", -1);
			} 
			log.Save_Log(request, session, "删除用户", "1", "id="+id+";删除成功","","");
		} catch (Exception e) {
			log.Save_Log(request, session, "删除用户", "2", "id="+id+";错误:"+e.toString(),"","");
			json.put("status", -1);
		}
		ResponseUtils.renderJson(response, json.toString());
	}

	/*批量删除*/
	@RequestMapping("cm_user_batchdelete")
	public void batchDelete(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		int i = 0;
		String[] ids = request.getParameterValues("ids");
		JSONObject json = new JSONObject();
		if (ids != null && ids.length > 0) {
			for (String id : ids) {
				//userRolesService.deleteByUserId(Long.parseLong(id));
				i = i + userService.deleteById(Long.parseLong(id));
			}
		}
		if (i > 0) {
			json.put("success", true);
			json.put("status", 0);
			log.Save_Log(request, session, "删除用户", "1", "ids="+ids.toString()+";删除成功","","");
			ResponseUtils.renderHtml(response, json.toString());
			return;
		} else {
			json.put("success", false);
			json.put("status", 1);
			log.Save_Log(request, session, "删除用户", "2", "ids="+ids.toString()+";删除失败","","");
			ResponseUtils.renderHtml(response, json.toString());
			return;
		}
	}
	
	@RequestMapping("cm_user_addimage_upload")
	public void addfileUpload(ModelMap model, HttpServletRequest request, 
			HttpServletResponse response, HttpSession session) throws Exception {
		
		JSONObject json = new JSONObject();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request; 
		MultipartFile file= multipartRequest.getFile("addfile");
		//上传文件不能为空
		if(file.getSize()==0){
			json.put("success", false);
			json.put("status", 1);
			ResponseUtils.renderHtml(response, json.toString());
			return;
		}
		//上传文件不能超过50K
		if(file.getSize()>1024*1024*5){
			json.put("success", false);
			json.put("status", 2);
			ResponseUtils.renderHtml(response, json.toString());
			return;
		}
		
		String fileName = file.getOriginalFilename();
		//后缀名
		String pix = FilenameUtils.getExtension(fileName).toLowerCase(Locale.ENGLISH);
        if(!"jpg".equalsIgnoreCase(pix) && !"bmp".equalsIgnoreCase(pix) && !"png".equalsIgnoreCase(pix)){
            json.put("success", false);
            json.put("status", 3);
            ResponseUtils.renderHtml(response, json.toString());
            return;
        }
		String newFileName = new Date().getTime() + "." + pix;
		// 文件保存路径  
        String imagePath = request.getSession().getServletContext().getRealPath("/") + "/static/upload/portraitImages/";  
        if (!new File(imagePath).exists()) {
			new File(imagePath).mkdirs();
		}
        // 转存文件  
        file.transferTo(new File(imagePath + newFileName)); 
        json.put("success", true);
        json.put("status", 0);
        json.put("path", imagePath + newFileName);
        json.put("imagePath", "/static/upload/portraitImages/"+newFileName);
        ResponseUtils.renderHtml(response, json.toString());
        return;
	}
	
	@RequestMapping("cm_user_editimage_upload")
	public void editfileUpload(ModelMap model, HttpServletRequest request, 
			HttpServletResponse response, HttpSession session) throws Exception {
		
		JSONObject json = new JSONObject();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request; 
		MultipartFile file= multipartRequest.getFile("editfile");
		//上传文件不能为空
		if(file.getSize()==0){
			json.put("success", false);
			json.put("status", 1);
			ResponseUtils.renderHtml(response, json.toString());
			return;
		}
		//上传文件不能超过50K
		if(file.getSize()>1024*1024*5){
			json.put("success", false);
			json.put("status", 2);
			ResponseUtils.renderHtml(response, json.toString());
			return;
		}
		
		String fileName = file.getOriginalFilename();
		//后缀名
		String pix = FilenameUtils.getExtension(fileName).toLowerCase(Locale.ENGLISH);
        if(!"jpg".equalsIgnoreCase(pix) && !"bmp".equalsIgnoreCase(pix) && !"png".equalsIgnoreCase(pix)){
            json.put("success", false);
            json.put("status", 3);
            ResponseUtils.renderHtml(response, json.toString());
            return;
        }
		String newFileName = new Date().getTime() + "." + pix;
		// 文件保存路径  
        String imagePath = request.getSession().getServletContext().getRealPath("/") + "/static/upload/portraitImages/";  
        if (!new File(imagePath).exists()) {
			new File(imagePath).mkdirs();
		}
        // 转存文件  
        file.transferTo(new File(imagePath + newFileName)); 
        json.put("success", true);
        json.put("status", 0);
        json.put("path", imagePath + newFileName);
        json.put("imagePath", "/static/upload/portraitImages/"+newFileName);
        ResponseUtils.renderHtml(response, json.toString());
        return;
	}
	
	/*保存*/
	@RequestMapping("cm_user_save")
	public void save(ModelMap model, HttpServletRequest request, 
			HttpServletResponse response, HttpSession session, Long id, String addusername, 
			String addtelephone, String addemail, String addpassword,  Long addrole, 
			Integer addorganization, Boolean addenabled, String adddescription,Integer addsex,String addIDNumber,String addposition,String addfilePath) {
		JSONObject json = new JSONObject();
		
		try {
			List<User> username = userService.getList(addusername, "", Long.parseLong("0"));
			if (username != null && username.size() > 0) {
				json.put("status", 1);
				ResponseUtils.renderJson(response, json.toString());
				return;
			}
			List<User> IDNumber = userService.getList("",addIDNumber,Long.parseLong("0"));
			if(IDNumber != null && IDNumber.size() > 0){
				json.put("status", 1);
				ResponseUtils.renderJson(response, json.toString());
				return;
			}
			User user = new User();
			user.setUsername(addusername);
			String password = Md5PwdEncoder.encodePassword(addpassword, "");
			user.setPassword(password);
			user.setDescription(adddescription);
			user.setEmail(addemail);
			user.setEnabled(addenabled);
			user.setIDNumber(addIDNumber);
			user.setPosition(addposition);
			user.setIssystemaccount(false);
			user.setSex(dictionaryService.findById(addsex));
			user.setTelephone(addtelephone);
			user.setImage(addfilePath);
			user.setOrganization(organizationalService.findById(addorganization));
			user.setRole(roleService.findById(addrole));
			
			User SaveUser = userService.save(user);
			log.Save_Log(request, session, "新增用户", "1", "id="+SaveUser.getId()+";username="+addusername,"","");
			json.put("status", 0);
		} catch (Exception e) {
			log.Save_Log(request, session, "新增用户", "2", "username="+addusername+";错误:"+e.toString(),"","");
			json.put("status", 2);
		}
		ResponseUtils.renderJson(response, json.toString());
	}
	
	@RequestMapping("cm_user_edit")
	public void edit(ModelMap model, RedirectAttributes attr, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		JSONObject json = new JSONObject();
		Integer id = request.getParameter("id") != null && !"".equals(request.getParameter("id").trim()) ? Integer.parseInt(request.getParameter("id")) : null;
		if(id == null){
			json.put("status", 1);
			ResponseUtils.renderJson(response, json.toString());
			return ;
		}
		User user = userService.findById(id);
		if(user == null){
			json.put("status", 1);
			ResponseUtils.renderJson(response, json.toString());
			return ;
		}
		
		json.put("status", 0);
		json.put("id", user.getId());
		json.put("username", user.getUsername());
		json.put("description", user.getDescription());
		json.put("IDNumber", user.getIDNumber());
		json.put("sex", user.getSex().getId());
		json.put("organization", user.getOrganization().getId());
		json.put("role", user.getRole().getId());
		json.put("position", user.getPosition());
		json.put("enabled", user.getEnabled()?"1":"0");
		json.put("telephone", user.getTelephone());
		json.put("email", user.getEmail());
		json.put("imagePath", user.getImage());
		ResponseUtils.renderJson(response, json.toString());
	}
	
	/**
	 * 修改用户数据
	 */
	@RequestMapping("cm_user_update")
	public void update(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session, 
			Integer editId, String edittelephone, String editemail, String editpassword,  Long editrole, 
			Integer editorganization, Boolean editenabled, String editdescription,Integer editsex,String editIDNumber,String editposition,String editfilePath) {
		JSONObject json = new JSONObject();

		if (editId == null) {
			json.put("status", 1);
			ResponseUtils.renderJson(response, json.toString());
			return;
		}
		User user = userService.findById(editId);
		try {
			if (user == null) {
				json.put("status", 1);
				ResponseUtils.renderJson(response, json.toString());
				return;
			}
			
			//密码等于空时不修改
			if (!"".equals(editpassword)) {
				user.setPassword(Md5PwdEncoder.encodePassword(editpassword, ""));
			}
			user.setDescription(editdescription);
			user.setEmail(editemail);
			user.setEnabled(editenabled);
			user.setIDNumber(editIDNumber);
			user.setPosition(editposition);
			user.setIssystemaccount(false);
			user.setSex(dictionaryService.findById(editsex));
			user.setTelephone(edittelephone);
			user.setImage(editfilePath);
			user.setOrganization(organizationalService.findById(editorganization));
			user.setRole(roleService.findById(editrole));
			userService.update(user);
			json.put("status", 0);
			log.Save_Log(request, session, "修改用户", "1", "id="+editId+";username="+user.getUsername(),"","");
		} catch (Exception e) {
			log.Save_Log(request, session, "修改用户", "2", "id="+editId+";username="+user.getUsername()+";错误:"+e.toString(),"","");
			json.put("status", 3);
		}
		ResponseUtils.renderJson(response, json.toString());
	}
	
	
	
	@RequestMapping("/user_deleteByIds")
	public void deleteByIds(ModelMap model, HttpServletRequest request, 
			HttpServletResponse response, HttpSession session, Long[] ids) {
		int i = 0;
		JSONObject json = new JSONObject();
		if (ids != null && ids.length > 0) {
			for (Long id : ids) {
				userRolesService.deleteByUserId(id);
				i = i + userService.deleteById(id);
			}
		}
		if (i > 0) {
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
	
	@RequestMapping("/user_changeEnabled")
	public void changeEnabled(ModelMap model, HttpServletRequest request, 
			HttpServletResponse response, HttpSession session, Long id, Boolean enabled) {
		
		JSONObject json = new JSONObject();
		int i = userService.update(id, null, null, enabled, null, null, null, 
				null, null, null, null);
		if (i > 0) {
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

	
	/*
	 * 修改密码
	 */
	@RequestMapping("cm_user_editPassWord")
	public String editPassWord(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		
		String res = "user/editPassWord";
		return res;
	}
	
	@RequestMapping("cm_user_saveEdit")
	public void saveEdit(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session,String password,String password1){
		JSONObject json = new JSONObject();
		User user = session.getAttribute("user") != null ? (User)session.getAttribute("user") : null;
		try {
			if(user != null){
				if(user.getPassword().equals(Md5PwdEncoder.encodePassword(password.trim(), ""))){
					user.setPassword(Md5PwdEncoder.encodePassword(password1.trim(), ""));
					userService.update(user);
					json.put("success", true);
					json.put("status", 0);
					log.Save_Log(request, session, "修改密码", "1", "id="+user.getId()+";username="+user.getUsername(),"","");
				}else{
					json.put("success", false);
					json.put("status", 2);
				}
			}else{
				json.put("success", false);
				json.put("status", 1);
			}
		} catch (Exception e) {
			json.put("success", false);
			json.put("status", -1);
			log.Save_Log(request, session, "修改密码", "2", "id="+user.getId()+";username="+user.getUsername()+";错误:"+e.toString(),"","");
		}
		ResponseUtils.renderHtml(response, json.toString());
		return;
	}
	
	/*
	 * 重置密码
	 */
	@RequestMapping("cm_user_resetPassWord")
	public String resetPassWord(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		
		String res = "user/resetPassWord";
		return res;
	}
	
	@RequestMapping("cm_user_saveReset")
	public void saveReset(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session,String username,String password1){
		JSONObject json = new JSONObject();
		
		try {
			List<User> list = userService.getList(username.trim(), null, Long.parseLong("0"));
			if(list != null && list.size()>0){
				User user = list.get(0);
				user.setPassword(Md5PwdEncoder.encodePassword(password1.trim(), ""));
				userService.update(user);
				json.put("success", true);
				json.put("status", 0);
				log.Save_Log(request, session, "重置密码", "1", "id="+user.getId()+";username="+user.getUsername(),"","");
			}else{
				json.put("success", false);
				json.put("status", 1);
			}
		} catch (Exception e) {
			json.put("success", false);
			json.put("status", -1);
			log.Save_Log(request, session, "重置密码", "2", "错误:"+e.toString(),"","");
		}
		ResponseUtils.renderHtml(response, json.toString());
		return;
	}
	
}
