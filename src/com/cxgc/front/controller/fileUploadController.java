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
import com.cxgc.front.util.NumberUtil;
import com.cxgc.front.util.ResponseUtils;
import com.cxgc.front.util.picProcessUtil;

import net.sf.json.JSONObject;

@Controller
public class fileUploadController {

	/**
	 * 文档上传
	 * @param request
	 * @param response
	 * @param model
	 * @throws JSONException
	 */
	@RequestMapping(value = "file_upload_doc", method = RequestMethod.POST)
    public void UploadMinimal(@RequestParam("fileDoc") MultipartFile[] fileDocs,
    		HttpServletRequest request,HttpServletResponse response, ModelMap model) throws JSONException{
        
        JSONObject json = new JSONObject();
        
	     // 文件保存路径  
	    String imagePath = request.getSession().getServletContext().getRealPath("/") + "/static/upload/portraitImages/";  
	    if (!new File(imagePath).exists()) {
			new File(imagePath).mkdirs();
		}
        
        String fileUrl="";
        String fileName="";
        
    	if(fileDocs.length>5){
			//上传文件数量太多
			json.put("success", true);
			json.put("status", 4);
			ResponseUtils.renderHtml(response, json.toString());
			return;
		}
    	
		for (MultipartFile file : fileDocs) {
			//上传文件不能为空
			if(file.getSize()==0){
				json.put("success", true);
				json.put("status", 1);
				ResponseUtils.renderHtml(response, json.toString());
				return;
			}
			//上传文件不能超过5M
			if(file.getSize()>1024*1024*5){
				json.put("success", true);
				json.put("status", 2);
				ResponseUtils.renderHtml(response, json.toString());
				return;
			}
			String origName = file.getOriginalFilename();
			fileName += FilenameUtils.getName(origName);
			//后缀名
			String pix = FilenameUtils.getExtension(origName).toLowerCase(Locale.ENGLISH);
	        if(!"doc".equalsIgnoreCase(pix) && !"docx".equalsIgnoreCase(pix) && !"xls".equalsIgnoreCase(pix) && !"xlsx".equalsIgnoreCase(pix) && !"txt".equalsIgnoreCase(pix) && !"pdf".equalsIgnoreCase(pix)){
	            json.put("success", true);
	            json.put("status", 3);
	            ResponseUtils.renderHtml(response, json.toString());
	            return;
	        }
	        
            try {
            		String newFileName = new Date().getTime() + "." + FilenameUtils.getExtension(origName).toLowerCase(Locale.ENGLISH);
	    			// 转存文件  
	    	        file.transferTo(new File(imagePath + newFileName));
	                
	    	        fileUrl+="/static/upload/portraitImages/"+newFileName+",";
	    	        
	                fileName+="|";
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            
		}
		
        json.put("success", true);
        json.put("status", 0);
        json.put("fileUrl", fileUrl);
        json.put("fileName", fileName);
    		
        ResponseUtils.renderHtml(response, json.toString());
    }
	
	
	/**
	 * 音频上传
	 * @param fileDocs
	 * @param request
	 * @param response
	 * @param model
	 * @throws JSONException
	 */
	@RequestMapping(value = "file_upload_media", method = RequestMethod.POST)
    public void file_upload_media(@RequestParam("fileMedia") MultipartFile[] fileMedias,
    		HttpServletRequest request,HttpServletResponse response, ModelMap model) throws JSONException{
        
        JSONObject json = new JSONObject();
        
        // 文件保存路径  
	    String imagePath = request.getSession().getServletContext().getRealPath("/") + "/static/upload/portraitImages/";  
	    if (!new File(imagePath).exists()) {
			new File(imagePath).mkdirs();
		}
	    
        String fileUrl="";
        String fileName="";
        
    	if(fileMedias.length>5){
			//上传文件数量太多
			json.put("success", true);
			json.put("status", 4);
			ResponseUtils.renderHtml(response, json.toString());
			return;
		}
    	
		for (MultipartFile file : fileMedias) {
			//上传文件不能为空
			if(file.getSize()==0){
				json.put("success", true);
				json.put("status", 1);
				ResponseUtils.renderHtml(response, json.toString());
				return;
			}
			//上传文件不能超过20M
			if(file.getSize()>1024*1024*20){
				json.put("success", true);
				json.put("status", 2);
				ResponseUtils.renderHtml(response, json.toString());
				return;
			}
			String origName = file.getOriginalFilename();
			fileName += FilenameUtils.getName(origName);
			//后缀名
			String pix = FilenameUtils.getExtension(origName).toLowerCase(Locale.ENGLISH);
	        if(!"mp3".equalsIgnoreCase(pix) && !"wav".equalsIgnoreCase(pix)){
	            json.put("success", true);
	            json.put("status", 3);
	            ResponseUtils.renderHtml(response, json.toString());
	            return;
	        }
	        
            try {
            	String newFileName = new Date().getTime() + "." + FilenameUtils.getExtension(origName).toLowerCase(Locale.ENGLISH);
    			// 转存文件  
    	        file.transferTo(new File(imagePath + newFileName));
                
    	        fileUrl+="/static/upload/portraitImages/"+newFileName+",";
    	        
                fileName+="|";
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            
		}
		
        json.put("success", true);
        json.put("status", 0);
        json.put("fileUrl", fileUrl);
        json.put("fileName", fileName);
    		
        ResponseUtils.renderHtml(response, json.toString());
    }
	
	
	/**
	 * 视频上传
	 * @param fileMedias
	 * @param request
	 * @param response
	 * @param model
	 * @throws JSONException
	 */
	@RequestMapping(value = "file_upload_video", method = RequestMethod.POST)
    public void file_upload_video(@RequestParam("fileVideo") MultipartFile[] fileVideos,
    		HttpServletRequest request,HttpServletResponse response, ModelMap model) throws JSONException{
        
        JSONObject json = new JSONObject();
        
        // 文件保存路径  
	    String imagePath = request.getSession().getServletContext().getRealPath("/") + "/static/upload/portraitImages/";  
	    if (!new File(imagePath).exists()) {
			new File(imagePath).mkdirs();
		}
	    
        String fileUrl="";
        String fileName="";
        
    	if(fileVideos.length>5){
			//上传文件数量太多
			json.put("success", true);
			json.put("status", 4);
			ResponseUtils.renderHtml(response, json.toString());
			return;
		}
    	
		for (MultipartFile file : fileVideos) {
			//上传文件不能为空
			if(file.getSize()==0){
				json.put("success", true);
				json.put("status", 1);
				ResponseUtils.renderHtml(response, json.toString());
				return;
			}
			//上传文件不能超过300M
			if(file.getSize()>1024*1024*300){
				json.put("success", true);
				json.put("status", 2);
				ResponseUtils.renderHtml(response, json.toString());
				return;
			}
			String origName = file.getOriginalFilename();
			fileName += FilenameUtils.getName(origName);
			//后缀名
			String pix = FilenameUtils.getExtension(origName).toLowerCase(Locale.ENGLISH);
	        if(!"mp4".equalsIgnoreCase(pix) && !"wmv".equalsIgnoreCase(pix) && !"avi".equalsIgnoreCase(pix)){
	            json.put("success", true);
	            json.put("status", 3);
	            ResponseUtils.renderHtml(response, json.toString());
	            return;
	        }
	        
            try {
            	String newFileName = new Date().getTime() + "." + FilenameUtils.getExtension(origName).toLowerCase(Locale.ENGLISH);
    			// 转存文件  
    	        file.transferTo(new File(imagePath + newFileName));
                
    	        fileUrl+="/static/upload/portraitImages/"+newFileName+",";
    	        
                fileName+="|";
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            
		}
		
        json.put("success", true);
        json.put("status", 0);
        json.put("fileUrl", fileUrl);
        json.put("fileName", fileName);
    		
        ResponseUtils.renderHtml(response, json.toString());
    }
	
	
	/**
	 * 图片上传
	 * @param fileVideos
	 * @param request
	 * @param response
	 * @param model
	 * @throws JSONException
	 */
	@RequestMapping(value = "file_upload_image", method = RequestMethod.POST)
    public void file_upload_image(@RequestParam("fileImage") MultipartFile[] fileImages,
    		HttpServletRequest request,HttpServletResponse response, ModelMap model) throws JSONException{
        
        JSONObject json = new JSONObject();
        
        // 文件保存路径  
	    String imagePath = request.getSession().getServletContext().getRealPath("/") + "/static/upload/portraitImages/";  
	    if (!new File(imagePath).exists()) {
			new File(imagePath).mkdirs();
		}
	    
        String fileUrl="";
        String fileName="";
        
    	if(fileImages.length>5){
			//上传文件数量太多
			json.put("success", true);
			json.put("status", 4);
			ResponseUtils.renderHtml(response, json.toString());
			return;
		}
    	
		for (MultipartFile file : fileImages) {
			//上传文件不能为空
			if(file.getSize()==0){
				json.put("success", true);
				json.put("status", 1);
				ResponseUtils.renderHtml(response, json.toString());
				return;
			}
			//上传文件不能超过4M
			if(file.getSize()>1024*1024*4){
				json.put("success", true);
				json.put("status", 2);
				ResponseUtils.renderHtml(response, json.toString());
				return;
			}
			String origName = file.getOriginalFilename();
			fileName += FilenameUtils.getName(origName);
			//后缀名
			String pix = FilenameUtils.getExtension(origName).toLowerCase(Locale.ENGLISH);
	        if(!"png".equalsIgnoreCase(pix) && !"jpg".equalsIgnoreCase(pix) && !"bmp".equalsIgnoreCase(pix)&& !"jpeg".equalsIgnoreCase(pix)){
	            json.put("success", true);
	            json.put("status", 3);
	            ResponseUtils.renderHtml(response, json.toString());
	            return;
	        }
	        
            try {
            	String newFileName = new Date().getTime() + "." + FilenameUtils.getExtension(origName).toLowerCase(Locale.ENGLISH);
    			// 转存文件  
    	        file.transferTo(new File(imagePath + newFileName));
                
    	        fileUrl+="/static/upload/portraitImages/"+newFileName+",";
    	        
                fileName+="|";
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            
		}
		
        json.put("success", true);
        json.put("status", 0);
        json.put("fileUrl", fileUrl);
        json.put("fileName", fileName);
    		
        ResponseUtils.renderHtml(response, json.toString());
    }
	
	
}
