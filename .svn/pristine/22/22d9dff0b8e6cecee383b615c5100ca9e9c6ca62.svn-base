package com.cxgc.front.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cxgc.front.model.Task;
import com.cxgc.front.service.OperationLogService;
import com.cxgc.front.service.TaskService;
import com.cxgc.front.util.DateUtils;
import com.cxgc.front.util.ResponseUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class TaskController {
	private static int PAGE_COUNT_10 = 10;
	
	@Autowired
	private TaskService<T> taskservice;
	
	@Autowired
	private OperationLogService<T> log;
	
	/*任务管理*/
	@RequestMapping("cm_task_list")
	public String list(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		Integer pageNum = request.getParameter("pageNum") != null && !"".equals(request.getParameter("pageNum").trim()) ? Integer.parseInt(request.getParameter("pageNum")) : 1;
		String s_name = request.getParameter("s_name");
		String a = request.getParameter("stime_star");
		String stime_star = request.getParameter("stime_star");
		String stime_end = request.getParameter("stime_end");
		Integer userid=session.getAttribute("userid") != null && !"".equals(session.getAttribute("userid").toString().trim()) ? Integer.parseInt(session.getAttribute("userid").toString()) : null;
		int totalRecord =taskservice.getPageCount(null, s_name, stime_star, stime_end,userid);
		if(pageNum <= 0){
			pageNum = 1;
		}
		if(pageNum > (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10){
			pageNum = (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10;
		}
		List<Task> TaskList = taskservice.getListByPage(null, s_name, stime_star, stime_end,userid, pageNum, PAGE_COUNT_10);
		model.put("totalPages", (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10);
		model.put("totalRecord", totalRecord);
		model.put("pageNum", pageNum);

		model.put("TaskList", TaskList);
		model.put("s_name", s_name);
		model.put("stime_star", stime_star);
		model.put("stime_end", stime_end);
		
		return "task/list";
	}
	
	/*删除单条数据*/
	@RequestMapping("cm_task_delete")
	public void delete(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		Integer id = request.getParameter("id") != null && !"".equals(request.getParameter("id").trim()) ? Integer.parseInt(request.getParameter("id")) : null;
		try {
			if (id != null) {
				int i= taskservice.deleteById(id);
				if(i>0){
					json.put("status", 0);
					log.Save_Log(request, session, "删除任务", "1", "id="+id+";删除成功","","");
				}else{
					json.put("status", 1);
				}
			}else {
				json.put("status", 2);
			} 
		} catch (Exception e) {
			log.Save_Log(request, session, "删除任务", "2", "id="+id+";错误:"+e.toString(),"","");
			json.put("status", -1);
		}
		
		ResponseUtils.renderJson(response, json.toString());
	}
	
	/*保存*/
	@RequestMapping("cm_task_save")
	public void save(ModelMap model, HttpServletRequest request,HttpServletResponse response, HttpSession session) {
		JSONObject json = new JSONObject();
		String addname = request.getParameter("addname");
		String addcontents = request.getParameter("addcontents");
		Date addremindTime = DateUtils.getStr2Date2(request.getParameter("addremindTime"));
		Integer userid=session.getAttribute("userid") != null && !"".equals(session.getAttribute("userid").toString().trim()) ? Integer.parseInt(session.getAttribute("userid").toString()) : null;
		if(userid == null)
		{
			json.put("status", -1);
			ResponseUtils.renderJson(response, json.toString());
			return ;
		}
		try {
			Task models = new Task();
			models.setName(addname);
			models.setContents(addcontents);
			models.setRemindTime(addremindTime);
			models.setUser_id(userid);
			models.setCreatedate(new Date());
			models.setHandle(0);
			models.setHandleDate(new Date());
			Task tasks = taskservice.save(models);
			
			log.Save_Log(request, session, "新增任务", "1", "id="+tasks.getId()+";name="+addname,"","");
			json.put("status", 0);
		} catch (Exception e) {
			log.Save_Log(request, session, "新增任务", "2", "name="+addname+";错误:"+e.toString(),"","");
			json.put("status", -1);
		}
		
		ResponseUtils.renderJson(response, json.toString());
	}
	
	@RequestMapping("cm_task_edit")
	public void edit(ModelMap model, RedirectAttributes attr, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		JSONObject json = new JSONObject();
		Integer id = request.getParameter("id") != null && !"".equals(request.getParameter("id").trim()) ? Integer.parseInt(request.getParameter("id")) : null;
		if(id == null){
			json.put("status", 1);
			ResponseUtils.renderJson(response, json.toString());
			return ;
		}
		Task models =taskservice.findById(id);
		if(models == null){
			json.put("status", 1);
			ResponseUtils.renderJson(response, json.toString());
			return ;
		}
		
		json.put("status", 0);
		json.put("id", models.getId());
		json.put("name", models.getName());
		json.put("contents", models.getContents());
		json.put("remindTime", DateUtils.getDate2Str2(models.getRemindTime()));
		
		ResponseUtils.renderJson(response, json.toString());
	}
	
	@RequestMapping("cm_task_update")
	public void update(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		JSONObject json = new JSONObject();
		Integer editId = request.getParameter("editId") != null && !"".equals(request.getParameter("editId").trim()) ? Integer.parseInt(request.getParameter("editId")) : null;
		String editname = request.getParameter("editname");
		String editcontents = request.getParameter("editcontents");
		Date editremindTime = DateUtils.getStr2Date2(request.getParameter("editremindTime"));
		if (editId == null) {
			json.put("status", 1);
			ResponseUtils.renderJson(response, json.toString());
			return;
		}
		Task models =taskservice.findById(editId);
		try {
			if (models == null) {
				json.put("status", 1);
				ResponseUtils.renderJson(response, json.toString());
				return;
			}
			if(models.getHandle()==1){
				json.put("status", 2);
				ResponseUtils.renderJson(response, json.toString());
				return;
			}
			models.setName(editname);
			models.setContents(editcontents);
			models.setRemindTime(editremindTime);
			taskservice.update(models);
			
			json.put("status", 0);
			log.Save_Log(request, session, "修改任务", "1", "id="+editId+";username="+editname,"","");
		} catch (Exception e) {
			log.Save_Log(request, session, "修改任务", "2", "id="+editId+";username="+editname+";错误:"+e.toString(),"","");
			json.put("status", -1);
		}
		ResponseUtils.renderJson(response, json.toString());
	}
	
	/*任务提醒*/
	@RequestMapping("cm_task_listRemind")
	public String listRemind(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		
		return "task/listRemind";
	}
	
	@RequestMapping("cm_task_Remind")
	public void Remind(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		JSONObject json = new JSONObject();
		Integer userid=session.getAttribute("userid") != null && !"".equals(session.getAttribute("userid").toString().trim()) ? Integer.parseInt(session.getAttribute("userid").toString()) : null;
		
		List<Object> objs =taskservice.getListByHandle(userid, null);
		StringBuffer sBuffer = new StringBuffer("");
		if(objs != null && objs.size()>0){
			for(int i=0;i<objs.size();i++){
				Object[] obj=(Object[])objs.get(i);
				if(i==0){
					sBuffer.append(obj[0]+","+obj[1]+","+obj[2]);
				}else{
					sBuffer.append("|"+obj[0]+","+obj[1]+","+obj[2]);
				}
			}
		}
		
		json.put("dayDate", DateUtils.getDate2Str2(new Date()));
		json.put("contents", sBuffer.toString());
		
		ResponseUtils.renderJson(response, json.toString());
	}
	
	/**
	 * 录入员控制台显示
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 */
	@RequestMapping("cm_task_today")
	public void today(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		JSONObject json = new JSONObject();
		Integer userid=session.getAttribute("userid") != null && !"".equals(session.getAttribute("userid").toString().trim()) ? Integer.parseInt(session.getAttribute("userid").toString()) : null;
		
		List<Task> list = taskservice.getList(userid, DateUtils.getDate2Str2(new Date()), null);
		
		StringBuilder s = new StringBuilder("");
		
		Integer count=0;
		
		if(list!=null && list.size()>0){
			for (Task task : list) {
				if(count<6){
					if(task.getHandle()==0){
						s.append("<li><a href=\"javascript:void(0);\">"+task.getName()+"<span>未完成</span></a></li>");
					}else{
						s.append("<li><a href=\"javascript:void(0);\">"+task.getName()+"<span>完成</span></a></li>");
					}
					count++;
				}
			}
		}
		
		json.put("contents", s.toString());
		
		ResponseUtils.renderJson(response, json.toString());
	}
	
	@RequestMapping("cm_task_RemindHandle")
	public void RemindHandle(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		Integer userid=session.getAttribute("userid") != null && !"".equals(session.getAttribute("userid").toString().trim()) ? Integer.parseInt(session.getAttribute("userid").toString()) : null;
		String theDate = request.getParameter("theDate");
		List<Task> TaskList = taskservice.getList(userid,theDate,null);
		StringBuffer sBufferA = new StringBuffer("");
		StringBuffer sBufferB = new StringBuffer("");
		List liA = new ArrayList();
		List liB = new ArrayList();
		if(TaskList != null && TaskList.size()>0){
			for(int i=0;i<TaskList.size();i++){
				Task models = TaskList.get(i);
				if(models.getHandle()==1){
					JSONArray jsonArray = JSONArray.fromObject(models);
					liA.add(jsonArray);
					
				}else if(models.getHandle()==0){
					JSONArray jsonArray = JSONArray.fromObject(models);
					liB.add(jsonArray);
				}
			}
		}
		JSONArray JA = new JSONArray(liA);
		JSONArray JB = new JSONArray(liB);
		Map ma = new HashMap();
		ma.put("Result", "OK");
		ma.put("HandleA", JA);
		ma.put("HandleB", JB);
		JSONObject json = new JSONObject(ma);
		
		ResponseUtils.renderJson(response, json.toString());
	}
	
	@RequestMapping("cm_task_HandleUpdate")
	public void RemindHandleByUpdate(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		JSONObject json = new JSONObject();
		
		String[] chooseIds = request.getParameterValues("chooseExport");
		if(chooseIds != null){
			for(String chooseId : chooseIds){
				Integer pId =chooseId != null && !"".equals(chooseId) ?Integer.parseInt(chooseId):0;
				if(pId == 0){
					continue;
				}
				Task models =taskservice.findById(pId);
				if(models != null){
					models.setHandle(1);
					models.setHandleDate(new Date());
					taskservice.update(models);
				}
			}
		}
		json.put("status", 0);
		ResponseUtils.renderJson(response, json.toString());
	}
}
