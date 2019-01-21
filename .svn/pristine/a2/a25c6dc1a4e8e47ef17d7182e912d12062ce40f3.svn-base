package com.cxgc.front.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cxgc.front.service.OperationLogService;
import com.cxgc.front.util.ResponseUtils;

import net.sf.json.JSONObject;

@Controller
public class SystemController {
	private static int PAGE_COUNT_10 = 10;

	public static String tomcat_path = "";
	
	@Autowired
	private OperationLogService<T> log;
	
	/*
	 * 系统重启
	 */
	@RequestMapping("cm_system_restart")
	public String querylist(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		
		
		String res = "system/restart";
		return res;
	}
	
	/*
	 * restart.bat
	 * call shutdown.bat
	 * ping 127.0.0.1 -n 20>nul //表示暂停10秒
	 * call startup.bat
	 */
	@RequestMapping("cm_system_restart_star")
	public void trialRecording_Save(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		
		try {
			ResourceBundle bundle = ResourceBundle.getBundle("common");
			tomcat_path = bundle.getString("tomcat_path");
			
			createCmdFile(tomcat_path);
			executeCmd(tomcat_path);
			json.put("status", 0);
			log.Save_Log(request, session, "系统重启", "1", "系统重启成功！","","");
		} catch (Exception e) {
			json.put("status", -1);
			log.Save_Log(request, session, "系统重启", "2", "错误:"+e.toString(),"","");
		}
		ResponseUtils.renderHtml(response, json.toString());
	}
	
	private static void executeCmd(String location) {  
        System.out.println(location);  
        Runtime run = Runtime.getRuntime();  
        try {  
            Process ps = run.exec("" + location + "\\bin\\restart.bat");  
            //下面的代码去掉的话 tomcat的黑框就不能出现    
            BufferedReader br = new BufferedReader(new InputStreamReader(  
                    ps.getInputStream(), "GBK"));// 注意中文编码问题  
            String line;  
            while ((line = br.readLine()) != null) {  
                System.out.println("StartedLog==>" + line);  
            }  
            br.close();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
  
    }  
	
	private static void createCmdFile(String location) {  
        File f = new File(location + "\\bin\\restart.bat");  
        try {  
            FileWriter fw = new FileWriter(f);  
            BufferedWriter bw = new BufferedWriter(fw);  
             //下面的必须加上  
            bw.write("set CATALINA_HOME=" + location);  
            bw.newLine();  
            //bw.write("call " + f.getParent() + "\\bin\\shutdown.bat");  
            bw.write("call " + f.getParent() + "\\shutdown.bat");  
            bw.newLine();  
            bw.write(" ping 127.0.0.1 -n 10  1>nul ");  
            bw.newLine();  
            //bw.write("call " + f.getParent() + "\\bin\\startup.bat ");  
            bw.write("call " + f.getParent() + "\\startup.bat ");  
  
            bw.close();  
            fw.close();  
        } catch (Exception e1) {  
            // TODO Auto-generated catch block  
            e1.printStackTrace();  
        }  
  
    }  
}
