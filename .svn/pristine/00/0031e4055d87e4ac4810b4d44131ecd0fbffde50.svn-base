package com.cxgc.front.controller;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cxgc.front.model.Guestbook;
import com.cxgc.front.service.GuestbookService;
import com.cxgc.front.util.DateUtils;
import com.cxgc.front.util.ResponseUtils;

import net.sf.json.JSONObject;

@Controller
public class GuestbookController {

	private static int PAGE_COUNT_10 = 10;

	@Autowired
	private GuestbookService<T> guestService;
	
	/*
	 * 办结存档
	 */
	@RequestMapping("cm_petitionhandle_filelist")
	public String list(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session,String informantName,String informantCardNo,String createTime_star,
			String createTime_end,String complaintNumber,String reportedName){
		Integer pageNum = request.getParameter("pageNum") != null && !"".equals(request.getParameter("pageNum").trim()) ? Integer.parseInt(request.getParameter("pageNum")) : 1;
		
		String ctg = request.getParameter("ctgId");
		Integer ctgId=null;
		if(ctg != null && !"==请选择==".equals(ctg)){
			ctgId = Integer.parseInt(ctg);
		}
		int totalRecord = guestService.getPageCount(informantName, informantCardNo, createTime_star, createTime_end, complaintNumber, null, ctgId, null,reportedName,9);
		if(pageNum <= 0){
			pageNum = 1;
		}
		if(pageNum > (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10){
			pageNum = (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10;
		}
		List<Guestbook> GuestList = guestService.getListByPage(informantName, informantCardNo, createTime_star, createTime_end, complaintNumber, null, ctgId, null,reportedName,9, pageNum, PAGE_COUNT_10);
		
		model.put("totalPages", (totalRecord + PAGE_COUNT_10 -1) / PAGE_COUNT_10);
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
		
		String res = "petitionhandle/filelist";
		return res;
	}
	
	@RequestMapping("cm_petitionhandle_view")
	public void edit(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		Integer id = request.getParameter("id") != null && !"".equals(request.getParameter("id").trim()) ? Integer.parseInt(request.getParameter("id")) : null;
		if(id == null){
			json.put("status", 1);
			ResponseUtils.renderJson(response, json.toString());
			return ;
		}
		Guestbook Guest = guestService.findById(id);
		if(Guest == null){
			json.put("status", 1);
			ResponseUtils.renderJson(response, json.toString());
			return ;
		}
		json.put("status", 0);
		json.put("complaintNumber", Guest.getComplaintNumber());//信访单号
		json.put("createTime", new SimpleDateFormat("yyyy-mm-dd").format(Guest.getCreateTime()));//日      期
		json.put("informantName", Guest.getExt().getInformantName());//姓      名
		Integer informantSex=Guest.getExt().getInformantSex();
		if(informantSex != null){
			json.put("informantSex", informantSex==0?"女":"男");//性      别
		}else{
			json.put("informantSex", "");//性      别
		}
		json.put("informantAge", Guest.getExt().getInformantAge());//年     龄
		json.put("informantNation", Guest.getExt().getInformantNation());//民     族
		json.put("informantCardNo", Guest.getExt().getInformantCardNo());//身份证号
		json.put("informantEducation", Guest.getExt().getInformantEducation());//文化程度
		json.put("informantpoliticalFace", Guest.getExt().getInformantpoliticalFace());//政治面貌
		json.put("informantLevel", Guest.getExt().getInformantLevel());//级别
		json.put("informantPlace", Guest.getExt().getInformantPlace());//居住地址
		json.put("informantEmail", Guest.getExt().getInformantEmail());//电子邮件
		Integer ctg_id = Guest.getCtgId();
		String ctgId="";
		if(ctg_id ==1){ctgId="网上信访";}
		else if(ctg_id ==2){ctgId="来访登记";}
		else if(ctg_id ==3){ctgId="来信登记";}
		else if(ctg_id ==4){ctgId="上级交办";}
		json.put("ctgId", ctgId);//来访类型
		json.put("informantPhone", Guest.getExt().getInformantPhone());//手     机
		json.put("informantOtherTel", Guest.getExt().getInformantOtherTel());//家庭电话
		json.put("processingCompany", Guest.getExt().getProcessingCompany());//负责单位
		json.put("processingHead", Guest.getExt().getProcessingHead());//负责人
		json.put("matterProperty", Guest.getExt().getMatterProperty());//来访性质
		json.put("matterCategory", Guest.getExt().getMatterCategory());//问题类别
		json.put("matterDetailed", Guest.getExt().getMatterDetailed());//问题细类
		json.put("informantGrade", Guest.getExt().getInformantGrade());//上访层次
		json.put("peopleCount", Guest.getPeopleCount());//来访人数
		json.put("leader", Guest.getLeader());//来访代表
		json.put("abnormalBehavior", Guest.getExt().getAbnormalBehavior());//异常行为
		json.put("createUser", Guest.getCreateUser().getDescription());//登记人
		json.put("receptionist", Guest.getReceptionist());//接待人
		Boolean satisfied =Guest.getSatisfied();
		if(satisfied != null){
			json.put("satisfied", Guest.getSatisfied()==true?"同意":"不同意");//是否满意
		}else{
			json.put("satisfied", "");//是否满意
		}
		json.put("appeals", Guest.getAppeals());//所属问题
		json.put("content", Guest.getExt().getContent());//案件说明
		json.put("preliminaryOpinion", Guest.getPreliminaryOpinion());//初步处理意见
		
		json.put("reportedCompany", Guest.getExt().getReportedCompany());//被举报人单位
		json.put("reportedName", Guest.getExt().getReportedName());//姓      名
		Integer reportedSex=Guest.getExt().getReportedSex();
		if(reportedSex != null){
			json.put("reportedSex", reportedSex==0?"女":"男");//性      别
		}else{
			json.put("reportedSex", "");//性      别
		}
		json.put("reportedDuties", Guest.getExt().getReportedDuties());//职      务
		json.put("reportedLevel", Guest.getExt().getReportedLevel());//级      别
		
		ResponseUtils.renderJson(response, json.toString());
	}
	
	@RequestMapping("cm_petitionhandle_fileExport")
	public void ExportList(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session,String informantName,String informantCardNo,String createTime_star,
			String createTime_end,String complaintNumber,String reportedName){
		JSONObject json = new JSONObject();
		String ctg = request.getParameter("ctgId");
		Integer ctgId=null;
		if(ctg != null && !"==请选择==".equals(ctg)){
			ctgId = Integer.parseInt(ctg);
		}
		  
        List<Guestbook> GuestList = guestService.getListByPage(informantName, informantCardNo, createTime_star, createTime_end, complaintNumber, null, ctgId, null,reportedName,9, 1, 99999);
        
        try  
        {  
        	String filename = "办结存档";
        	filename = URLEncoder.encode(filename,"UTF-8");
        	filename+="(" + DateUtils.getDate2Str(new Date())+").xls";
    		//response.setContentType(request.getServletContext().getMimeType(filename));
    		response.setHeader("Content-Disposition", "attachment;filename=" + filename);
    		
    		OutputStream outputStream = response.getOutputStream();
    		createdStatisticContentReport(GuestList).write(outputStream);;
    		outputStream.flush();
    		outputStream.close();
        }  
        catch (Exception e)  
        {  
            e.printStackTrace();  
        }  
	}
	
	public HSSFWorkbook createdStatisticContentReport(List<Guestbook> GuestList){
		
		//创建一个webbook，对应一个Excel文件
		HSSFWorkbook wb = new HSSFWorkbook();
		//在webbook中添加一个sheet,对应Excel文件中的sheet  
        HSSFSheet sheet = wb.createSheet("办结存档");  
        //在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
        HSSFRow row = sheet.createRow((int) 0);  
        //创建单元格，并设置值表头 设置表头居中  
        HSSFCellStyle style = wb.createCellStyle();  
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); //创建一个居中格式
        
        HSSFCell cell = row.createCell((short) 0);
        cell.setCellValue("序号");
        cell.setCellStyle(style);
        cell = row.createCell((short) 1);
        cell.setCellValue("信访单号");
        cell.setCellStyle(style);
        cell = row.createCell((short) 2);
        cell.setCellValue("日期");
        cell.setCellStyle(style);
        cell = row.createCell((short) 3);
        cell.setCellValue("姓名");
        cell.setCellStyle(style);
        cell = row.createCell((short) 4);
        cell.setCellValue("性别");
        cell.setCellStyle(style);
        cell = row.createCell((short) 5);
        cell.setCellValue("年     龄");
        cell.setCellStyle(style);
        cell = row.createCell((short) 6);
        cell.setCellValue("民     族");
        cell.setCellStyle(style);
        cell = row.createCell((short) 7);
        cell.setCellValue("身份证号");
        cell.setCellStyle(style);
        cell = row.createCell((short) 8);
        cell.setCellValue("文化程度");
        cell.setCellStyle(style);
        cell = row.createCell((short) 9);
        cell.setCellValue("政治面貌");
        cell.setCellStyle(style);
        cell = row.createCell((short) 10);
        cell.setCellValue("级别");
        cell.setCellStyle(style);
        cell = row.createCell((short) 11);
        cell.setCellValue("居住地址");
        cell.setCellStyle(style);
        cell = row.createCell((short) 12);
        cell.setCellValue("电子邮件");
        cell.setCellStyle(style);
        cell = row.createCell((short) 13);
        cell.setCellValue("来访类型");
        cell.setCellStyle(style);
        cell = row.createCell((short) 14);
        cell.setCellValue("手机");
        cell.setCellStyle(style);
        cell = row.createCell((short) 15);
        cell.setCellValue("家庭电话");
        cell.setCellStyle(style);
        cell = row.createCell((short) 16);
        cell.setCellValue("负责单位");
        cell.setCellStyle(style);
        cell = row.createCell((short) 17);
        cell.setCellValue("负责人");
        cell.setCellStyle(style);
        cell = row.createCell((short) 18);
        cell.setCellValue("来访性质");
        cell.setCellStyle(style);
        cell = row.createCell((short) 19);
        cell.setCellValue("问题类别");
        cell.setCellStyle(style);
        cell = row.createCell((short) 20);
        cell.setCellValue("问题细类");
        cell.setCellStyle(style);
        cell = row.createCell((short) 21);
        cell.setCellValue("上访层次");
        cell.setCellStyle(style);
        cell = row.createCell((short) 22);
        cell.setCellValue("来访人数");
        cell.setCellStyle(style);
        cell = row.createCell((short) 23);
        cell.setCellValue("来访代表");
        cell.setCellStyle(style);
        cell = row.createCell((short) 24);
        cell.setCellValue("异常行为");
        cell.setCellStyle(style);
        cell = row.createCell((short) 25);
        cell.setCellValue("登记人");
        cell.setCellStyle(style);
        cell = row.createCell((short) 26);
        cell.setCellValue("接待人");
        cell.setCellStyle(style);
        cell = row.createCell((short) 27);
        cell.setCellValue("是否满意");
        cell.setCellStyle(style);
        cell = row.createCell((short) 28);
        cell.setCellValue("所属问题");
        cell.setCellStyle(style);
        cell = row.createCell((short) 29);
        cell.setCellValue("案件说明");
        cell.setCellStyle(style);
        cell = row.createCell((short) 30);
        cell.setCellValue("初步处理意见");
        cell.setCellStyle(style);
        
        cell = row.createCell((short) 31);
        cell.setCellValue("被举报人/单位");
        cell.setCellStyle(style);
        cell = row.createCell((short) 32);
        cell.setCellValue("姓名");
        cell.setCellStyle(style);
        cell = row.createCell((short) 33);
        cell.setCellValue("性别");
        cell.setCellStyle(style);
        cell = row.createCell((short) 34);
        cell.setCellValue("职务");
        cell.setCellStyle(style);
        cell = row.createCell((short) 35);
        cell.setCellValue("级别");
        cell.setCellStyle(style);
        
        // 写入实体数据 实际应用中这些数据从数据库得到
        for(int i=0;i<GuestList.size();i++){
        	row = sheet.createRow((int) i + 1);
        	Guestbook Guest = GuestList.get(i);
        	//创建单元格，并设置值
        	row.createCell((short) 0).setCellValue((int) i + 1);  
            row.createCell((short) 1).setCellValue(Guest.getComplaintNumber()==null?"":Guest.getComplaintNumber());  
            row.createCell((short) 2).setCellValue(new SimpleDateFormat("yyyy-mm-dd").format(Guest.getCreateTime()));
            row.createCell((short) 3).setCellValue(Guest.getExt().getInformantName()==null?"":Guest.getExt().getInformantName());
            Integer informantSex=Guest.getExt().getInformantSex();
    		if(informantSex != null){
    			row.createCell((short) 4).setCellValue(informantSex==0?"女":"男");
    		}else{
    			row.createCell((short) 4).setCellValue("");
    		}
    		row.createCell((short) 5).setCellValue(Guest.getExt().getInformantAge()==null?"":Guest.getExt().getInformantAge().toString());
    		row.createCell((short) 6).setCellValue(Guest.getExt().getInformantNation()==null?"":Guest.getExt().getInformantNation());
    		row.createCell((short) 7).setCellValue(Guest.getExt().getInformantCardNo()==null?"":Guest.getExt().getInformantCardNo());
    		row.createCell((short) 8).setCellValue(Guest.getExt().getInformantEducation()==null?"":Guest.getExt().getInformantEducation());
    		row.createCell((short) 9).setCellValue(Guest.getExt().getInformantpoliticalFace()==null?"":Guest.getExt().getInformantpoliticalFace());
    		row.createCell((short) 10).setCellValue(Guest.getExt().getInformantLevel()==null?"":Guest.getExt().getInformantLevel());
    		row.createCell((short) 11).setCellValue(Guest.getExt().getInformantPlace()==null?"":Guest.getExt().getInformantPlace());
    		row.createCell((short) 12).setCellValue(Guest.getExt().getInformantEmail()==null?"":Guest.getExt().getInformantEmail());
    		Integer ctg_id = Guest.getCtgId();
    		String ctgIds="";
    		if(ctg_id ==1){ctgIds="网上信访";}
    		else if(ctg_id ==2){ctgIds="来访登记";}
    		else if(ctg_id ==3){ctgIds="来信登记";}
    		else if(ctg_id ==4){ctgIds="上级交办";}
    		row.createCell((short) 13).setCellValue(ctgIds);
    		row.createCell((short) 14).setCellValue(Guest.getExt().getInformantPhone()==null?"":Guest.getExt().getInformantPhone());
    		row.createCell((short) 15).setCellValue(Guest.getExt().getInformantOtherTel()==null?"":Guest.getExt().getInformantOtherTel());
    		row.createCell((short) 16).setCellValue(Guest.getExt().getProcessingCompany().getName()==null?"":Guest.getExt().getProcessingCompany().getName());
    		row.createCell((short) 17).setCellValue(Guest.getExt().getProcessingHead().getDescription()==null?"":Guest.getExt().getProcessingHead().getDescription());
    		row.createCell((short) 18).setCellValue(Guest.getExt().getMatterProperty()==null?"":Guest.getExt().getMatterProperty());
    		row.createCell((short) 19).setCellValue(Guest.getExt().getMatterCategory()==null?"":Guest.getExt().getMatterCategory());
    		row.createCell((short) 20).setCellValue(Guest.getExt().getMatterDetailed()==null?"":Guest.getExt().getMatterDetailed());
    		row.createCell((short) 21).setCellValue(Guest.getExt().getInformantGrade()==null?"":Guest.getExt().getInformantGrade());
    		row.createCell((short) 22).setCellValue(Guest.getPeopleCount()==null?"":Guest.getPeopleCount().toString());
    		row.createCell((short) 23).setCellValue(Guest.getLeader()==null?"":Guest.getLeader());
    		row.createCell((short) 24).setCellValue(Guest.getExt().getAbnormalBehavior()==null?"":Guest.getExt().getAbnormalBehavior());
    		if(Guest.getCreateUser() != null){
    			row.createCell((short) 25).setCellValue(Guest.getCreateUser().getDescription()==null?"":Guest.getCreateUser().getDescription());
    		}else{
    			row.createCell((short) 25).setCellValue("");
    		}
    		row.createCell((short) 26).setCellValue(Guest.getReceptionist()==null?"":Guest.getReceptionist());
    		Boolean satisfied =Guest.getSatisfied();
    		if(satisfied != null){
    			row.createCell((short) 27).setCellValue(Guest.getSatisfied()==true?"同意":"不同意");
    		}else{
    			row.createCell((short) 27).setCellValue("");
    		}
    		row.createCell((short) 28).setCellValue(Guest.getAppeals()==null?"":Guest.getAppeals());
    		row.createCell((short) 29).setCellValue(Guest.getExt().getContent()==null?"":Guest.getExt().getContent());
    		row.createCell((short) 30).setCellValue(Guest.getPreliminaryOpinion()==null?"":Guest.getPreliminaryOpinion());
    		row.createCell((short) 31).setCellValue(Guest.getExt().getReportedCompany()==null?"":Guest.getExt().getReportedCompany());
    		row.createCell((short) 32).setCellValue(Guest.getExt().getReportedName()==null?"":Guest.getExt().getReportedName());
    		Integer reportedSex=Guest.getExt().getReportedSex();
    		if(reportedSex != null){
    			row.createCell((short) 33).setCellValue(reportedSex==0?"女":"男");
    		}else{
    			row.createCell((short) 33).setCellValue("");
    		}
    		row.createCell((short) 34).setCellValue(Guest.getExt().getReportedDuties()==null?"":Guest.getExt().getReportedDuties());
    		row.createCell((short) 35).setCellValue(Guest.getExt().getReportedLevel()==null?"":Guest.getExt().getReportedLevel());
        }
        return wb; 
	}
}
