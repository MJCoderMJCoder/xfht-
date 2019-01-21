package com.cxgc.front.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.net.URL;
import java.net.URLConnection;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cxgc.front.model.Dictionary;
import com.cxgc.front.model.Guestbook;
import com.cxgc.front.model.GuestbookAttr;
import com.cxgc.front.model.GuestbookCase;
import com.cxgc.front.model.Organization;
import com.cxgc.front.model.User;
import com.cxgc.front.service.DictionaryService;
import com.cxgc.front.service.GuestbookCaseService;
import com.cxgc.front.service.GuestbookService;
import com.cxgc.front.service.OrganizationalService;
import com.cxgc.front.service.UserService;
import com.cxgc.front.util.StacticVariable;

import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.model.ZipParameters;
import net.lingala.zip4j.util.Zip4jConstants;

/**
 * 信访处理类-查询
 * 
 * @author Hit-hitdy
 *
 */
@Controller
public class ReportController {

	@Autowired
	private GuestbookService<?> guestboolservice;

	@Autowired
	private UserService userservice;
	
	@Autowired
	private DictionaryService<Dictionary> dictionaryService;
	
	@Autowired
	private GuestbookCaseService caseservice;
	
	@Autowired
	private OrganizationalService torservice;
	
	
	@RequestMapping("cm_xf_list")
	public ModelAndView getXfList(ModelMap model, HttpServletRequest req, HttpServletResponse res, HttpSession sess,
			RedirectAttributes attr) {
		List userls=userservice.getListByPage(null, null, null, null, null, null, null, 1, 5000);
		/*List<Dictionary> matterCategoryList = dictionaryService.getList(null, null, "matterCategory" ); 
		model.put("zdls", matterCategoryList);*/
		
		int pagesize = StacticVariable.getPageCount();
		ModelAndView mv = new ModelAndView();
		User user = (User) sess.getAttribute("user");
		if (user == null) {
			mv.setViewName("redirect:/");
			attr.addFlashAttribute("sulogin", "timeout");
			return mv;
		}
		int pageNum = req.getParameter("pageNum") != null && !"".equals(req.getParameter("pageNum").trim())? Integer.parseInt(req.getParameter("pageNum")) : 1;

		String informantName = req.getParameter("informantName") == null ? "" : req.getParameter("informantName");
		String informantCardNo = req.getParameter("informantCardNo") == null ? "" : req.getParameter("");
		String startTime = req.getParameter("startTime") == null ? "" : req.getParameter("stime");
		String endTime = req.getParameter("endTime") == null ? "" : req.getParameter("etime");
		String complaintNumber = req.getParameter("complaintNumber") == null ? "" : req.getParameter("complaintNumber");
		String matterCategory = req.getParameter("matterCategory") == null ? "" : req.getParameter("");
		Integer ctgId = req.getParameter("ctgId") == null ? null : Integer.parseInt(req.getParameter(""));
		String reportedName = req.getParameter("reportedName") == null ? null : req.getParameter("");
		Integer status = req.getParameter("status") == null ? null : Integer.parseInt(req.getParameter(""));
		int totalRecord = guestboolservice.getPageCount(informantName, informantCardNo, startTime,
				endTime, complaintNumber, matterCategory, ctgId, null, reportedName, status);
		if (pageNum <= 0) {
			pageNum = 1;
		}
		if (pageNum > (totalRecord + pagesize - 1) / pagesize) {
			pageNum = (totalRecord + pagesize - 1) / pagesize;
		}
		List<Guestbook> temp = guestboolservice.getListByPage(informantName, informantCardNo,  startTime,
				 endTime, complaintNumber, matterCategory, ctgId, null, reportedName, status, pageNum,
				pagesize);
		model.put("totalPages", (totalRecord + pagesize - 1) / pagesize);
		model.put("totalRecord", totalRecord);
		model.put("pageNum", pageNum);
		model.put("informantName", informantName);
		model.put("informantCardNo", informantCardNo);
		model.put("startTime", startTime);
		model.put("endTime", endTime);
		model.put("complaintNumber", complaintNumber);
		model.put("matterCategory", matterCategory);
		model.put("ctgId", ctgId);
		model.put("reportedName", reportedName);
		model.put("status", status);
		model.put("templist", temp);
		model.put("userls", userls);
		mv.setViewName("xflist/xflist");
		return mv;
	}

	@RequestMapping("cm_see_{xfid}")
	public ModelAndView getOneXf(@PathVariable int xfid, ModelMap model, HttpServletRequest req,
			HttpServletResponse res, HttpSession sess, RedirectAttributes attr) {
		ModelAndView mv = new ModelAndView();
		User user = (User) sess.getAttribute("user");
		if (user == null) {
			mv.setViewName("redirect:/");
			attr.addFlashAttribute("sulogin", "timeout");	
			return mv;
		}
		
		List<GuestbookCase> casedls=caseservice.getCase(xfid, 0);
		List<Guestbook> casels=new ArrayList<Guestbook>();
		if (casedls.size() > 0) {
			for (int i = 0; i < casedls.size(); i++) {
				casels.add(guestboolservice.findById(casedls.get(i).getFollower()));
			}
			model.put("count", 1);
			model.put("casedls", casels);
		} else {
			model.put("count", 0);
		}
		
		Guestbook tempxf = guestboolservice.findById(xfid);
		model.put("temp", tempxf);
		model.put("ext", tempxf.getExt());
		model.put("attr", tempxf.getAttachments());
		//1、文档 2、音频 3、视频 4、图片
		List<GuestbookAttr> listwd=new ArrayList<GuestbookAttr>();
		List<GuestbookAttr> listyp=new ArrayList<GuestbookAttr>();
		List<GuestbookAttr> listsp=new ArrayList<GuestbookAttr>();
		List<GuestbookAttr> listtp=new ArrayList<GuestbookAttr>();
		 for(int i=0;i<tempxf.getAttachments().size();i++)
		 {
			 if(tempxf.getAttachments().get(i).getType()==1||tempxf.getAttachments().get(i).getType()==5||tempxf.getAttachments().get(i).getType()==9)  {
				 listwd.add(tempxf.getAttachments().get(i));
			 }
			 if(tempxf.getAttachments().get(i).getType()==2||tempxf.getAttachments().get(i).getType()==6||tempxf.getAttachments().get(i).getType()==10)  {
				 listyp.add(tempxf.getAttachments().get(i));
			 }
			 if(tempxf.getAttachments().get(i).getType()==3||tempxf.getAttachments().get(i).getType()==7||tempxf.getAttachments().get(i).getType()==11)  {
				 listsp.add(tempxf.getAttachments().get(i));
			 }
			 if(tempxf.getAttachments().get(i).getType()==4||tempxf.getAttachments().get(i).getType()==8||tempxf.getAttachments().get(i).getType()==12)  {
				 listtp.add(tempxf.getAttachments().get(i));
			 }
			 
		 }
		 model.put("listwd", listwd);
		 model.put("listyp", listyp);
		 model.put("listsp", listsp);
		 model.put("listtp", listtp);
		mv.setViewName("xflist/seexf");
		return mv;
	}

	
	/* 导出execl */
	@RequestMapping("/cm_xf_listdaochu")
	public @ResponseBody Map<String, Object> Exdk(ModelMap model, HttpServletRequest req, HttpServletResponse res,
			HttpSession session )  {
		Map<String, Object> map = new HashMap<String, Object>();
		String informantName = req.getParameter("informantName") == null ? "" : req.getParameter("");
		String informantCardNo = req.getParameter("informantCardNo") == null ? "" : req.getParameter("");
		String startTime = req.getParameter("startTime") == null ? "" : req.getParameter("startTime");
		String endTime = req.getParameter("endTime") == null ? "" : req.getParameter("endTime");
		String complaintNumber = req.getParameter("complaintNumber") == null ? "" : req.getParameter("complaintNumber");
		String matterCategory = req.getParameter("matterCategory") == null ? "" : req.getParameter("");
		Integer ctgId = req.getParameter("ctgId") == null ? null : Integer.parseInt(req.getParameter(""));
		String reportedName = req.getParameter("reportedName") == null ? null : req.getParameter("");
		Integer status = req.getParameter("status") == null ? null : Integer.parseInt(req.getParameter(""));
		List<Guestbook> temp = guestboolservice.getListByPage(informantName, informantCardNo,  startTime,
				 endTime, complaintNumber, matterCategory, ctgId, null, reportedName, status, 0,
				99999);
		String[] str = { "序号", "案件编号", "信访人", "来访类型","案件类型", "上访时间", "案件状态", "姓名", "性别", "年龄", "民族",
				"身份证号", "文化程度", "居住地址", "政治面貌", "手机", "负责单位", "负责人", "来访性质",
				"上访层次", "来访人数", "所属问题", "反应问题及诉求", "初步处理意见", "接待人", "被举报人单位", "被举报人姓名",
				"被举报人性别", "被举报人职务", "被举报人级别","标题","问题细类","是否有符合意见书","法院是否受理","是否已经行政复议","是否允许公开","是否为重复信件","来访代表","举报人级别","ID","负责人ID","负责单位ID"};
		String title = "信访详细导出";
		String time = "导出时间：" + this.gettime();
		String timenow=this.gettime().replace(" ", "").replace(":", "");
		String tablename = "The-petition-Export" + this.gettime().replace(" ", "").replace(":", "");
		String uppath=req.getSession().getServletContext().getRealPath("/") ; 
		String pathzip = req.getSession().getServletContext().getRealPath("/") + "static/upload/zipfold/";
		String dirName1=pathzip+"/"+timenow; 
		createDir(dirName1); 
		String path = this.daoChuPetition(req, res, temp, tablename, str, title, time,timenow);//excel 地址 
		//-----------导出附件-------------//  
		 try {
		for(int i=0;i<temp.size();i++) { 
			Guestbook attatemp=temp.get(i);
			 List<GuestbookAttr> attals=attatemp.getAttachments();
			
			 for(int y=0;y<attals.size();y++)  {
				 GuestbookAttr atta=attals.get(y);
				 String dirName=pathzip+timenow+"/"+atta.getGuestbook().getId();
				 File dir = new File(dirName);  
				 if (!dir.exists()) {  
					 dir.mkdir();
				    }  
				 File file1=new File(uppath+atta.getPath()); 
				    // 输入流
				  InputStream is = new FileInputStream(file1);   
				    // 1K的数据缓冲
				    byte[] bs = new byte[1024];
				    // 读取到的数据长度
				    int len;
				    // 输出的文件流
				    OutputStream os = new FileOutputStream(pathzip+timenow+"/"+atta.getGuestbook().getId()+"/"+atta.getName());
				    // 开始读取 
						while ((len = is.read(bs)) != -1) {
						  os.write(bs, 0, len);
						} 
				    // 完毕，关闭所有链接
				    os.close();
				    is.close();
				    }  
			 }  
		File allFile = new File(req.getSession().getServletContext().getRealPath("/") + "/static/upload/zipfold/"+timenow); 
		
		 AddFilesWithAESEncryption(req.getSession().getServletContext().getRealPath("/") + "/static/upload/zipfold/" + timenow + ".zip",allFile);
		 
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		 
		String patafin="/static/upload/zipfold/" + timenow + ".zip"; 
		map.put("msg", patafin);
		return map;
	}
	
	 
	
	 
	      
	    public void AddFilesWithAESEncryption(String path,File file ) throws net.lingala.zip4j.exception.ZipException {
	          
	    	ZipFile zipFile = new ZipFile(path);
	    	
	    	 File[] files = file.listFiles(); 
	    	 ArrayList<File> filesToAdd = new ArrayList<File>();
	    	 for (int i = 0; i < files.length; i++) { 
	    		 if(files[i].isDirectory()){ 
	    			 File[] sec = files[i].listFiles();
	    			 for(int y = 0; y < sec.length; y++){
	    				 if(!sec[y].isDirectory()){ 
	    					 filesToAdd.add(sec[y]); 
	    				 } 
	    			 }
	    		 }	    
	    		 else
	    		 {
	    			 filesToAdd.add(files[i]); 
	    		 }
	 			
	            }
	    	/* filesToAdd.add(new File("c:\\ZipTest\\sample.txt"));
	    	 filesToAdd.add(new File("c:\\ZipTest\\sample1.txt"));  
	    	 filesToAdd.add(new File("c:\\ZipTest\\sample2.txt"));*/
	    	 
			ZipParameters parameters = new ZipParameters();
			parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
			  
			parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL); 
			parameters.setEncryptFiles(true);
			  
			parameters.setEncryptionMethod(Zip4jConstants.ENC_METHOD_AES);
			  
  
			parameters.setAesKeyStrength(Zip4jConstants.AES_STRENGTH_256);
			parameters.setPassword("yhtd0451");
     
			zipFile.addFiles(filesToAdd, parameters);
	    } 
	
	/**
	 * 导出excel
	 * 
	 * @param req
	 * @param res
	 * @param lt
	 *            导出用集合
	 * @param tablename
	 *            导出用表明
	 * @param str
	 *            导出用列头
	 * @param title
	 *            导出用表头
	 * @param daochutime
	 *            导出用导出时间
	 * @return 导出文件在服务器上面的地址
	 */
	@SuppressWarnings("deprecation")
	public String daoChuPetition(HttpServletRequest req, HttpServletResponse res, List lt, String tablename, String[] str,
			String title, String time,String timenow) {
		// 第一步，创建一个webbook，对应一个Excel文件
		HSSFWorkbook wb = new HSSFWorkbook();
		// 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
		HSSFSheet sheet = wb.createSheet(tablename);
		// 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
		HSSFRow row1 = sheet.createRow((int) 0);
		HSSFRow row = sheet.createRow((int) 1);

		// 第四步，创建单元格，并设置值表头 设置表头居中
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 下边框
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);// 左边框
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);// 上边框
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);// 右边框
		HSSFCellStyle styleleft = wb.createCellStyle();
		styleleft.setAlignment(HSSFCellStyle.ALIGN_LEFT); // 创建一个左对齐格式
		// 合并单元格-将表名放入
		CellRangeAddress cratitless = new CellRangeAddress(0, 0, 0, str.length - 1);
		sheet.addMergedRegion(cratitless);
		HSSFCell celltitle = row1.createCell((int) 0);
		celltitle.setCellValue(title);
		celltitle.setCellStyle(style);
		// 合并单元格-将时间放入
		CellRangeAddress cra = new CellRangeAddress(1, 1, 0, str.length - 1);
		sheet.addMergedRegion(cra);
		// 设置统计信息
		row = sheet.createRow(1);
		HSSFCell cellinfo = row.createCell((int) 0);
		cellinfo.setCellValue(time);
		cellinfo.setCellStyle(styleleft);

		row = sheet.createRow(2);
		HSSFCell cell = null;
		for (int temp = 0; temp < str.length; temp++) {
			cell = row.createCell((short) temp);
			cell.setCellValue(str[temp]);
			cell.setCellStyle(style);
		}

		// 第五步，写入实体数据 实际应用中这些数据从数据库得到，

		for (int i = 0; i < lt.size(); i++) {
			Guestbook ii = (Guestbook) lt.get(i);
			row = sheet.createRow((int) i + 3);

			for (int temp = 0; temp < str.length; temp++) {
				if (temp == 0) {
					row.createCell((short) temp).setCellValue(i + 1);
				} else { 
					if (str[temp].equals("案件编号")) {
						row.createCell((short) temp).setCellValue(ii.getComplaintNumber());
					} 
					if (str[temp].equals("信访人")) {
						row.createCell((short) temp).setCellValue(ii.getReceptionist()==null?"":ii.getReceptionist().toString());
					}
					if (str[temp].equals("来访类型")) {
						switch (ii.getCtgId()==null?"":ii.getCtgId().toString()) {
						case "1":
							row.createCell((short) temp).setCellValue("网上信访");
							break;
						case "2":
							row.createCell((short) temp).setCellValue("来访登记");
							break;
						case "3":
							row.createCell((short) temp).setCellValue("来信登记");
							break;
						case "4":
							row.createCell((short) temp).setCellValue("上级交办");
							break; 
						case "":
							default:
								row.createCell((short) temp).setCellValue("其他");
								break; 
						}
					}
					if (str[temp].equals("案件类型")) {
						//matterCategory
						row.createCell((short) temp).setCellValue(ii.getExt().getMatterCategory()==null?"":ii.getExt().getMatterCategory().toString());
					}
					if (str[temp].equals("上访时间")) {
						//createTime
						String fmt = "yyyy-MM-dd HH:mm:ss";
						SimpleDateFormat sdf = new SimpleDateFormat(fmt); 
						row.createCell((short) temp).setCellValue(ii.getCreateTime()==null?"":sdf.format(ii.getCreateTime()));
					}
					if (str[temp].equals("案件状态")) {
						//status 
						switch (ii.getStatus()==null?"":ii.getStatus().toString()) {
						case "0":
							row.createCell((short) temp).setCellValue("删除");
							break;
						case "1":
							row.createCell((short) temp).setCellValue("草稿");
							break;
						case "2":
							row.createCell((short) temp).setCellValue("提交审核");
							break;
						case "3":
							row.createCell((short) temp).setCellValue("通过");
							break; 
						case "4":
							row.createCell((short) temp).setCellValue("驳回给录入人员");
							break; 
						case "9":
							row.createCell((short) temp).setCellValue("完结");
							break; 
						case "":
						default:
							row.createCell((short) temp).setCellValue("其他");
							break;
						} 
					}
					if (str[temp].equals("姓名")) {
						//informantName
						row.createCell((short) temp).setCellValue(ii.getExt().getInformantName()==null?"":ii.getExt().getInformantName().toString());
					}
					if (str[temp].equals("性别")) {
						//informantSex
						switch (ii.getExt().getInformantSex()==null?"":ii.getExt().getInformantSex().toString()) {
						case "0":
							row.createCell((short) temp).setCellValue("女");
							break;
						case "1":
							row.createCell((short) temp).setCellValue("男");
							break; 
						case "":
							row.createCell((short) temp).setCellValue("不明");
							break; 
						} 
					}
					if (str[temp].equals("年龄")) {
						//informantAge
						row.createCell((short) temp).setCellValue(ii.getExt().getInformantAge()==null?"":ii.getExt().getInformantAge().toString());
					}
					if (str[temp].equals("民族")) {
						//informantNation
						row.createCell((short) temp).setCellValue(ii.getExt().getInformantNation()==null?"":ii.getExt().getInformantNation().toString());
					}
					if (str[temp].equals("身份证号")) {
						//informantCardNo
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getInformantCardNo() == null ? "" : ii.getExt().getInformantCardNo()).toString());
					}
					if (str[temp].equals("文化程度")) {
						//informantEducation
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getInformantEducation() == null ? "" : ii.getExt().getInformantEducation()).toString());
					}
					if (str[temp].equals("居住地址")) {
						//informantPlace 
						row.createCell((short) temp).setCellValue(
								(ii.getExt().getInformantPlace() == null ? "" : ii.getExt().getInformantPlace()).toString());
					}
					if (str[temp].equals("政治面貌")) {
						//informantpoliticalFace
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getInformantpoliticalFace() == null ? "" : ii.getExt().getInformantpoliticalFace()).toString());
					}
					if (str[temp].equals("手机")) {
						//informantPhone
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getInformantPhone() == null ? "" : ii.getExt().getInformantPhone()).toString());
					}
					if (str[temp].equals("负责单位")) {
						//processingCompany
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getProcessingCompany().getName() == null ? "" : ii.getExt().getProcessingCompany().getName()).toString());
					}
					if (str[temp].equals("负责人")) {
						//processingHead
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getProcessingHead().getDescription() == null ? "" : ii.getExt().getProcessingHead().getDescription()).toString());
					}
					if (str[temp].equals("来访性质")) {
						//matterProperty
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getMatterProperty() == null ? "" : ii.getExt().getMatterProperty()).toString());
					}
					if (str[temp].equals("上访层次")) {
						//informantGrade
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getInformantGrade() == null ? "" : ii.getExt().getInformantGrade()).toString());
					} 
					if (str[temp].equals("来访人数")) {
						//peopleCount
						row.createCell((short) temp)
								.setCellValue((ii.getPeopleCount() == null ? "" : ii.getPeopleCount()).toString());
					}
					if (str[temp].equals("所属问题")) {
						//matterCategory
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getMatterCategory() == null ? "" : ii.getExt().getMatterCategory()).toString());
					}
					if (str[temp].equals("反应问题及诉求")) {
						//appeals
						row.createCell((short) temp)
								.setCellValue((ii.getAppeals() == null ? "" : ii.getAppeals()).toString());
					}
					if (str[temp].equals("初步处理意见")) {
						//preliminaryOpinion
						row.createCell((short) temp)
								.setCellValue((ii.getPreliminaryOpinion() == null ? "" : ii.getPreliminaryOpinion()).toString());
					}
					if (str[temp].equals("接待人")) {
						//receptionist
						row.createCell((short) temp)
								.setCellValue((ii.getReceptionist() == null ? "" : ii.getReceptionist()).toString());
					}
					if (str[temp].equals("被举报人单位")) {
						//reportedCompany
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getReportedCompany() == null ? "" : ii.getExt().getReportedCompany()).toString());
					}
					
					//被举报人姓名",
					//"被举报人性别", "被举报人职务", "被举报人级别"
					
					if (str[temp].equals("被举报人姓名")) {
						//reportedName
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getReportedName() == null ? "" : ii.getExt().getReportedName()).toString());
					}
					if (str[temp].equals("被举报人性别")) {
						//reportedSex
						switch (ii.getExt().getReportedSex()==null?"":ii.getExt().getReportedSex().toString()) {
						case "0":
							row.createCell((short) temp).setCellValue("女");
							break;
						case "1":
							row.createCell((short) temp).setCellValue("男");
							break; 
						case "":
							row.createCell((short) temp).setCellValue("不明");
							break; 
						} 
					}
					if (str[temp].equals("被举报人职务")) {
						//reportedDuties
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getReportedDuties() == null ? "" : ii.getExt().getReportedDuties()).toString());
					}
					if (str[temp].equals("被举报人级别")) {
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getReportedLevel() == null ? "" : ii.getExt().getReportedLevel()).toString());
					}
					//--------add-------------//
					
					if (str[temp].equals("标题")) {
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getTitle() == null ? "" : ii.getExt().getTitle()).toString());
					}
					if (str[temp].equals("问题细类")) {
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getMatterCategory() == null ? "" : ii.getExt().getMatterCategory()).toString());
					} 
					if (str[temp].equals("是否有符合意见书")) {
						if((ii.getExt().getReviewOpinions() == null ? "" : ii.getExt().getReviewOpinions()).toString()=="true") {
							row.createCell((short) temp).setCellValue("是");
						}
						else if((ii.getExt().getReviewOpinions() == null ? "" : ii.getExt().getReviewOpinions()).toString()=="false"){  
							row.createCell((short) temp).setCellValue("否");
						}
						else {
							row.createCell((short) temp).setCellValue("");
						}
						
					}
					if (str[temp].equals("法院是否受理")) {
						if((ii.getExt().getAccept() == null ? "" : ii.getExt().getAccept()).toString()=="true"){
							row.createCell((short) temp).setCellValue("是");	 
						}
						else if((ii.getExt().getAccept() == null ? "" : ii.getExt().getAccept()).toString()=="false"){ 
							row.createCell((short) temp).setCellValue("否");
						} 
						else {
							row.createCell((short) temp).setCellValue("");
						}
					}
					
					if (str[temp].equals("是否已经行政复议")) {
						if((ii.getExt().getAdministrativeReconsideration() == null ? "" : ii.getExt().getAdministrativeReconsideration()).toString()=="true") {
							row.createCell((short) temp).setCellValue("是");
						}
						else  if((ii.getExt().getAdministrativeReconsideration() == null ? "" : ii.getExt().getAdministrativeReconsideration()).toString()=="false"){
							row.createCell((short) temp).setCellValue("否");
						}
						else {
							row.createCell((short) temp).setCellValue("");
						}
					}
					if (str[temp].equals("是否允许公开")) {
						if((ii.getExt().getPublicity() == null ? "" : ii.getExt().getPublicity()).toString()=="true"){
							row.createCell((short) temp).setCellValue("是");}
						else   if((ii.getExt().getPublicity() == null ? "" : ii.getExt().getPublicity()).toString()=="false"){
							row.createCell((short) temp).setCellValue("否");
						}
						else {
							row.createCell((short) temp).setCellValue("");
						}
					}
					if (str[temp].equals("是否为重复信件")) {
						if((ii.getExt().getLetterTime() == null ? "" : ii.getExt().getLetterTime()).toString()=="true"){
							row.createCell((short) temp).setCellValue("是");}
						else if((ii.getExt().getLetterTime() == null ? "" : ii.getExt().getLetterTime()).toString()=="false"){
							row.createCell((short) temp).setCellValue("否");
						}
						else {
							row.createCell((short) temp).setCellValue("");
						}
					}
					if (str[temp].equals("来访代表")) {
						row.createCell((short) temp)
								.setCellValue((ii.getLeader() == null ? "" : ii.getLeader()).toString());
					}
					if (str[temp].equals("举报人级别")) {
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getInformantLevel() == null ? "" : ii.getExt().getInformantLevel()).toString());
					}
					if (str[temp].equals("ID")) {
						row.createCell((short) temp).setCellValue(ii.getId());
					}
					if (str[temp].equals("负责单位ID")) {
						//processingCompany
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getProcessingCompany().getId() == null ? "" : ii.getExt().getProcessingCompany().getId()).toString());
					}
					if (str[temp].equals("负责人ID")) {
						//processingHead
						row.createCell((short) temp)
								.setCellValue((ii.getExt().getProcessingHead().getId() == null ? "" : ii.getExt().getProcessingHead().getId()).toString());
					}
					
				}
			}
		}

		// 合并单元格
		// 第六步，将文件存到指定位置
		String path = "";// 文件保存位置
		String pathdown = "";// 文件下载位置
		try {
			path = req.getSession().getServletContext().getRealPath("/") + "static/upload/zipfold/"+timenow+"/" + tablename + ".xls";
			FileOutputStream fout = new FileOutputStream(path);
			wb.write(fout);
			fout.close();
			pathdown = "/static/upload/zipfold/"+tablename+"/" + timenow + ".xls";

		} catch (Exception e) {
			e.printStackTrace();
		}
		return pathdown;
	}
	
	 
	
	
	//-----------------------------统计报表-------------------------------------// 
	@RequestMapping("cm_report_year")
	public ModelAndView reportByYear(ModelMap model, HttpServletRequest req, HttpServletResponse res, HttpSession sess,
			RedirectAttributes attr) {  
		StringBuffer ctgsql=new StringBuffer();
		ctgsql.append(" select guestbookctg_id ,ctg_name from jc_guestbook_ctg  ");
		List<Object[]> ctgls=guestboolservice.getList(ctgsql.toString());
		String type=req.getParameter("type")==null?"":req.getParameter("type").toString();
		String stime=req.getParameter("stime")==null?"":req.getParameter("stime").toString();
		String etime=req.getParameter("etime")==null?"":req.getParameter("etime").toString();
		model.put("type", type);
		model.put("stime", stime);
		model.put("etime", etime);
		ModelAndView mv = new ModelAndView(); 
		//matterCategory
		List<Dictionary> matterCategoryList = dictionaryService.getList(null, null, "matterCategory" ); 
		model.put("zdls", matterCategoryList);
		StringBuffer year=new StringBuffer();
		year.append(" select YEAR(a.create_time)as nian, NOW()  ");
		year.append(" from  jc_guestbook  a LEFT JOIN jc_guestbook_ext b on  a.guestbook_id=b.guestbook_id ");
		year.append(" where 1=1  and b.matterCategory is not null and  a.`status`=9  "); 
		if(type!="") {
			year.append(" and b.matterCategory = "+"'"+type+"'"); 
		}
		if(stime!="") {
			year.append(" and a.create_time>= '"+stime+"'");
		}
		if(etime!="") {
			year.append(" and a.create_time<= '"+etime+"'");
		} 
		year.append(" GROUP BY nian  order by nian "); 
		List<Object[]> yearls=guestboolservice.getList(year.toString());
		
		
		//-------信访来源表格+饼状图-------//
		StringBuffer stb=new StringBuffer();
		stb.append(" select  c.ctg_name, COUNT(1)  from jc_guestbook a LEFT JOIN jc_guestbook_ext b on  a.guestbook_id=b.guestbook_id  LEFT JOIN jc_guestbook_ctg c on a.guestbookctg_id=c.guestbookctg_id where a.`status`=9 and b.matterCategory is not null  ");
		if(type!="") {
			stb.append(" and b.matterCategory = "+"'"+type+"'"); 
		}
		if(stime!="") {
			stb.append(" and a.create_time>= '"+stime+"'");
		}
		if(etime!="") {
			stb.append(" and a.create_time<= '"+etime+"'");
		} 
		stb.append(" GROUP BY  c.guestbookctg_id "); 
		List<Object[]> table=guestboolservice.getList(stb.toString());
		
		//-------饼状图---------//
		if(table==null||table.size()==0) {
			List<Object[]> tablenull=new ArrayList<Object[]>(); 
			StringBuffer json=new StringBuffer();
			String con = "";
				for(int i=0;i<ctgls.size();i++) { 
					tablenull.add(new Object[]{ ""+ctgls.get(i)[1]+"",0 }); 
					json.append(con + "['"+ctgls.get(i)[1]+"',"+0+"]");
					con = ",";
				}   
				model.put("json", "["+json.toString()+"]"); 
				model.put("tableli", tablenull);
		} 
		else {
		StringBuffer json=new StringBuffer();
		String con = "";
			for(int i=0;i<table.size();i++)
			{
			 
				json.append(con + "['"+table.get(i)[0]+"',"+table.get(i)[1]+"]");
				con = ",";
			}
			for(int i=0;i<ctgls.size();i++) { 
				int count=0;
				for(int y=0;y<table.size();y++) { 
					if(ctgls.get(i)[1].equals(table.get(y)[0])) {
						count++;
					} 
				}
				if(count==0) {
					json.append(con + "['"+ctgls.get(i)[1]+"',"+0+"]");
					table.add(new Object[]{ctgls.get(i)[1], 0}); 
					con = ",";
				} 
			} 
			model.put("pic", "123");
			model.put("tableli", table);
			model.put("json", "["+json.toString()+"]");
		}
		//-------饼状图---------//
		//-------信访来源表格-------//
		//-------折线图---------//
		List<Dictionary> matterPropertyList = dictionaryService.getList(null, null, "matterProperty" );
		
		
		StringBuffer sqlzxt=new StringBuffer();
		
		sqlzxt.append(" select YEAR(a.create_time)as nian  , c.ctg_name as type,count(a.guestbook_id) as sl  ");
		sqlzxt.append(" from  jc_guestbook  a LEFT JOIN jc_guestbook_ext b on  a.guestbook_id=b.guestbook_id ");
		sqlzxt.append(" LEFT JOIN jc_guestbook_ctg c on a.guestbookctg_id=c.guestbookctg_id  ");
		 
		sqlzxt.append(" where 1=1  and b.matterCategory is not null  and a.`status`=9   "); 
		if(type!="") {
			sqlzxt.append(" and b.matterCategory = "+"'"+type+"'"); 
		}
		if(stime!="") {
			sqlzxt.append(" and a.create_time>= '"+stime+"'");
		}
		if(etime!="") {
			sqlzxt.append(" and a.create_time<= '"+etime+"'");
		} 
		sqlzxt.append(" GROUP BY nian ,type  order by nian "); 
		List<Object[]> linechart=guestboolservice.getList(sqlzxt.toString());
		if(linechart==null||linechart.size()==0) {
			StringBuffer jsonjst=new StringBuffer();
			String conzxt="";
			
				for(int y=0;y<ctgls.size();y++)
				{
					String name=ctgls.get(y)[1].toString(); 
					jsonjst.append(conzxt + "{ name: '"+name+"', data:[ " );  
						jsonjst.append( 0+"," );  
					jsonjst.append("] }" );
					conzxt = ","; 
				} 
				model.put("pic", "123");
			model.put("zxt", "["+jsonjst+"]");
		} 	
		else
		{
		StringBuffer jsonjst=new StringBuffer();
		String conzxt="";
		
			for(int y=0;y<ctgls.size();y++)
			{
				String name=ctgls.get(y)[1].toString(); 
				jsonjst.append(conzxt + "{ name: '"+name+"', data:[ " ); 
				for (int i = 0; i < linechart.size(); i++) { 
				if(name.equals(linechart.get(i)[1])){ 
					jsonjst.append( linechart.get(i)[2].toString()+"," ); 
					}  
				}
				jsonjst.append("] }" );
				conzxt = ","; 
			}
			 
			model.put("pic", "123");
		model.put("zxt", "["+jsonjst+"]");
		}
		//-------折线图---------//
		//-------柱状图---------// 
		if(yearls.size()==0||yearls==null){
			
			StringBuffer yearjson=new StringBuffer();
			String conn="";
			for(int i=0 ;i<yearls.size();i++) {
				yearjson.append(conn+"'"+new Date().getYear()+"'");
				conn=",";
				}
			model.put("pic", "123");
			model.put("yearls", "["+yearjson+"]");
		}
		else {
			StringBuffer yearjson=new StringBuffer();
			String conn="";
			for(int i=0 ;i<yearls.size();i++) {
				yearjson.append(conn+"'"+yearls.get(i)[0].toString()+"'");
				conn=",";
				}
			model.put("pic", "123");
			model.put("yearls", "["+yearjson+"]");
		} 
		//--------柱状图--------// 
		//--------表格--------// 
		StringBuffer sqltable=new StringBuffer();
		sqltable.append(" select bbb.nian ,bbb.sl ,bbb.sl/sum(bbb.sl) as zb from ");
		sqltable.append(" (select YEAR(a.create_time)as nian ,  count(a.guestbook_id)  as sl  from  jc_guestbook  a ");
		sqltable.append(" LEFT JOIN jc_guestbook_ext b on  a.guestbook_id=b.guestbook_id  ");
		sqltable.append("  where  1=1 and b.matterCategory is not null and a.`status`=9 "); 
		if(type!="") {
			sqltable.append(" and b.matterCategory = "+"'"+type+"'"); 
		}
		if(stime!="") {
			sqltable.append(" and a.create_time>= '"+stime+"'");
		}
		if(etime!="") {
			sqltable.append(" and a.create_time<= '"+etime+"'");
		} 
		sqltable.append("  GROUP BY nian   ORDER BY nian) bbb  ");
		List<Object[]> downtable=guestboolservice.getList(sqltable.toString());
		model.put("downtable", downtable);
		//--------表格--------// 
		mv.setViewName("report/report_year");
		return mv;
	} 
	
	
	 
	/** 处理单位
	 * @param model
	 * @param req
	 * @param res
	 * @param sess
	 * @param attr
	 * @return
	 */
	@RequestMapping("cm_report_company")
	public ModelAndView reportByCompany(ModelMap model, HttpServletRequest req, HttpServletResponse res, HttpSession sess,
			RedirectAttributes attr) {  
		StringBuffer ctgsql=new StringBuffer();
		ctgsql.append(" select guestbookctg_id ,ctg_name from jc_guestbook_ctg  ");
		List<Object[]> ctgls=guestboolservice.getList(ctgsql.toString());
		String type=req.getParameter("type")==null?"":req.getParameter("type").toString();
		String stime=req.getParameter("stime")==null?"":req.getParameter("stime").toString();
		String etime=req.getParameter("etime")==null?"":req.getParameter("etime").toString();
		model.put("type", type);
		model.put("stime", stime);
		model.put("etime", etime);
		ModelAndView mv = new ModelAndView(); 
		//matterCategory
		List<Dictionary> matterCategoryList = dictionaryService.getList(null, null, "matterCategory" ); 
		model.put("zdls", matterCategoryList); 
		List<Organization> orls= torservice.getFlist();
		
		
		StringBuffer year=new StringBuffer();
		year.append(" select tor.parent_id,count(1) from   ");
		year.append("  jc_guestbook_ext jbe LEFT JOIN t_organization tor on jbe.organization_id=tor.id  LEFT JOIN jc_guestbook gue on jbe.guestbook_id=gue.guestbook_id   ");
		year.append("  where tor.parent_id is not null "); 
		if(type!="") {
			year.append(" and jbe.matterCategory = "+"'"+type+"'"); 
		}
		if(stime!="") {
			year.append(" and gue.create_time>= '"+stime+"'");
		}
		if(etime!="") {
			year.append(" and gue.create_time<= '"+etime+"'");
		} 
		year.append(" GROUP BY tor.parent_id "); 
		List<Object[]> companyls=guestboolservice.getList(year.toString());
		StringBuffer json=new StringBuffer();
		
		if(companyls.size()>0)
		{
			String con = ""; 
			for(int i=0;i<orls.size();i++) { 
				Organization temp=orls.get(i); 
				boolean flag=true;
				for(int y=0;y<companyls.size();y++) {
					if(temp.getId().equals(companyls.get(y)[0])) {
						flag=false; 
					}
				}
				if(flag){
				json.append(con + "['"+temp.getName()+"',0]"); 
				con = ",";
				}
				else {
					json.append(con + "['"+temp.getName()+"',"); 
					for(int y=0;y<companyls.size();y++) {
						if(temp.getId().equals(companyls.get(y)[0])) { 
							json.append(companyls.get(y)[1]);
						}
					}
					json.append("]");
					con = ","; 
				}
			} 
			
		}
		else {
			String con = ""; 
			for(int i=0;i<orls.size();i++) { 
				Organization temp=orls.get(i);
				json.append(con + "['"+temp.getName()+"',0]");  
				con = ",";
			}
		}
		
		model.put("pic", "123");
		model.put("json", "["+json.toString()+"]");  
		String connzzt="";
		String connzzt2="";
		StringBuffer orgjson=new StringBuffer();
		StringBuffer orgdatajson=new StringBuffer();
		if(companyls.size()>0)
		{
			for(int i=0;i<orls.size();i++){	
			Organization temp=orls.get(i); 
			orgjson.append(connzzt+"'"+temp.getName()+"'");
			connzzt=",";
			boolean flag=true;
			for(int y=0;y<companyls.size();y++) {
				if(temp.getId().equals(companyls.get(y)[0])) {
					flag=false; 
				}
			} 
			if(flag){
		 
				orgdatajson.append(connzzt2 + "{name:'"+temp.getName()+"',data:[0]}" ); 
				connzzt2 = ",";
			}
			else {
				orgdatajson.append(connzzt2 +  "{name:'"+temp.getName()+"',data:[ " ); 
				for(int y=0;y<companyls.size();y++) {
					if(temp.getId().equals(companyls.get(y)[0])) { 
						orgdatajson.append(companyls.get(y)[1]);
					}
				}
				orgdatajson.append("] }" );
					connzzt2 = ",";
				} 
			}
		}
		else { 
		String conn11="";
			for(int i=0;i<orls.size();i++) { 
				Organization temp=orls.get(i);
				orgdatajson.append(conn11 + "{ name:'"+temp.getName()+"',data:[0]}" );  
				conn11 = ",";
			}
		}
		model.put("orgjson", "["+orgjson.toString()+"]");
		model.put("zxt", "["+orgdatajson+"]");
		mv.setViewName("report/report_company");
		return mv;
	} 
	
	/** 完成比例
	 * @param model
	 * @param req
	 * @param res
	 * @param sess
	 * @param attr
	 * @return
	 */
	@RequestMapping("cm_report_processtime")
	public ModelAndView reportByprocesstime(ModelMap model, HttpServletRequest req, HttpServletResponse res, HttpSession sess,
			RedirectAttributes attr) {  
		StringBuffer sqlwcsl=new StringBuffer(); 
		StringBuffer sqlall=new StringBuffer();
		String stime=req.getParameter("stime")==null?"":req.getParameter("stime").toString();
		String etime=req.getParameter("etime")==null?"":req.getParameter("etime").toString();
		model.put("stime", stime);
		model.put("etime", etime);
		ModelAndView mv = new ModelAndView(); 
		sqlwcsl.append(" select count(1),1  from  jc_guestbook gue where gue.`status`=9 and gue.end_time>=gue.complete_time  ");
		if(stime!="") {
			sqlwcsl.append(" and gue.create_time>= '"+stime+"'");
		}
		if(etime!="") {
			sqlwcsl.append(" and gue.create_time<= '"+etime+"'");
		} 
		sqlall.append(" select count(1),1  from  jc_guestbook gue where end_time is not null   ");
		if(stime!="") {
			sqlall.append(" and gue.create_time>= '"+stime+"'");
		}
		if(etime!="") {
			sqlall.append(" and gue.create_time<= '"+etime+"'");
		} 
		List<Object[]> wcslls=guestboolservice.getList(sqlwcsl.toString());
		List<Object[]> allls=guestboolservice.getList(sqlall.toString());
		StringBuffer jsonwscl=new StringBuffer(); 
		if(allls.size()==0) {
			jsonwscl.append("['完成数量', 0],['未完成数量', 0]"); 
		}
		else {
			String obwsc = wcslls.get(0)[0].toString();
			String oball = allls.get(0)[0].toString();
			
			jsonwscl.append("['完成数量', "+wcslls.get(0)[0]+"],"
						  + "['未完成数量', "+(Integer.parseInt(oball)- Integer.parseInt(obwsc))+"]"); 
		}
		model.put("json", "["+jsonwscl.toString()+"]"); 
		//************************饼状图结束************************************//
		//************************折线图 按照年度统计通过和不通过的********************//
		StringBuffer year=new StringBuffer();
		year.append(" select YEAR(a.create_time)as nian, NOW()  ");
		year.append(" from  jc_guestbook  a  ");
		year.append(" where 1=1   and  a.`status`=9  ");  
		if(stime!="") {
			year.append(" and a.create_time>= '"+stime+"'");
		}
		if(etime!="") {
			year.append(" and a.create_time<= '"+etime+"'");
		} 
		year.append(" GROUP BY nian  order by nian "); 
		List<Object[]> yearls=guestboolservice.getList(year.toString());
		StringBuffer jsonjst=new StringBuffer();
		if(yearls.size()>0){ 
			
			StringBuffer yearjson=new StringBuffer();
			String conn="";
			for(int i=0 ;i<yearls.size();i++) {
				yearjson.append(conn+"'"+yearls.get(i)[0].toString()+"'");
				conn=",";
				}
			model.put("yearls", "["+yearjson+"]");
			String conzxt=""; 
			for(int i=0;i<yearls.size();i++){
				StringBuffer zxtwcsl=new StringBuffer();  
				String name=yearls.get(i)[0].toString(); 
				jsonjst.append(conzxt + "{ name: '"+name+"', data:[ " );  
				zxtwcsl.append(" select count(1),1  from  jc_guestbook gue where gue.`status`=9 and gue.end_time>=gue.complete_time and YEAR(gue.create_time)='"+name+"' ");
				if(stime!="") {
					zxtwcsl.append(" and gue.create_time>= '"+stime+"'");
				}
				if(etime!="") {
					zxtwcsl.append(" and gue.create_time<= '"+etime+"'");
				} 
				List<Object[]> zxtwcslls=guestboolservice.getList(zxtwcsl.toString());
				if(zxtwcslls.size()>0) {
					jsonjst.append(zxtwcslls.get(0)[0].toString()+"," );
				}
				else {
					jsonjst.append("0," );
				} 
				jsonjst.append("] }" );
				conzxt = ",";  
				} 
		}
		else{
			StringBuffer yearjson=new StringBuffer();
			String conn="";
			for(int i=0 ;i<yearls.size();i++) {
				yearjson.append(conn+"'"+new Date().getYear()+"'");
				conn=",";
				} 
			model.put("yearls", "["+yearjson+"]");
		}
		
		model.put("zxt", "["+jsonjst+"]");
		//************************折线图 按照年度统计通过和不通过的********************//
		model.put("pic", "123");
		mv.setViewName("report/report_processtime");
		return mv;
	} 
	
	
	public Date strToDateLong(String strDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		ParsePosition pos = new ParsePosition(0);
		Date strtodate = formatter.parse(strDate, pos);
		return strtodate;
	}

	
	/**
	 * @return 时间字符串
	 */
	public String gettime() {
		String fmt = "yyyy-MM-dd HH:mm:ss";
		SimpleDateFormat sdf = new SimpleDateFormat(fmt);
		String dateStr = sdf.format(new Date());
		return dateStr;
	}
	
	
	/**  目录创建
	 * @param destDirName 目录路径
	 * @return 创建结果
	 */
	public boolean createDir(String destDirName) {  
	    File dir = new File(destDirName);  
	    if (dir.exists()) {  
	        System.out.println("创建目录" + destDirName + "失败，目标目录已经存在");  
	        return false;  
	    }  
	    if (!destDirName.endsWith(File.separator)) {  
	        destDirName = destDirName + File.separator;  
	    }  
	    //创建目录  
	    if (dir.mkdirs()) {  
	        System.out.println("创建目录" + destDirName + "成功！");  
	        return true;  
	    } else {  
	        System.out.println("创建目录" + destDirName + "失败！");  
	        return false;  
	    }  
	}  
	
	
	
}
