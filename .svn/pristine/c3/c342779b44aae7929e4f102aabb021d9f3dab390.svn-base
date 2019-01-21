package com.cxgc.front.application;

import java.util.ResourceBundle;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 
 * 获取common相关属性
 * @version 0.0.0.1
 */
@Service
@Transactional
public class StartupListener implements ApplicationListener<ContextRefreshedEvent> {

	protected final Logger log = Logger.getLogger(StartupListener.class);

 
	/**
	 * 接口地址 http://
	 */
/*	public static String filepath_webapps = "";
 
	public static String project_path = "";

	public static String project_port = "";
	
	public static String img_path="";

	public static String stranger_db_name="";

	public static String WORK_TIME_FILE="";

	public static String student_faceDB_id="";

	public static String building_id="";
	
	public static String real_path = "";*/
	
	public static String police_faceDB_id = "";

	public static String suspect_faceDB_id = "";

	public static String follow_faceDB_id = "";
	
	public static String pagecount = "";
	
	public static String ocrPath="";
	
	@Override
	public void onApplicationEvent(ContextRefreshedEvent arg0) {
		if (arg0.getApplicationContext().getParent() == null) {
			// createSitemap();
			getpageNumbers();
		}
	}

	private void getpageNumbers() {
		ResourceBundle bundle = ResourceBundle.getBundle("common");
		try {
			police_faceDB_id = bundle.getString("police_faceDB_id");
			suspect_faceDB_id = bundle.getString("suspect_faceDB_id");
			follow_faceDB_id = bundle.getString("follow_faceDB_id");
			pagecount = bundle.getString("pagecount");
			ocrPath=bundle.getString("ocrPath");
			/*filepath_webapps = bundle.getString("filepath_webapps");
			project_path=bundle.getString("project_path");
			project_port=bundle.getString("project_port");
			img_path=bundle.getString("img_path");
			stranger_db_name=bundle.getString("stranger_db_name");
			WORK_TIME_FILE=bundle.getString("WORK_TIME_FILE");
			student_faceDB_id=bundle.getString("student_faceDB_id");
			building_id=bundle.getString("building_id");
			real_path = bundle.getString("real_path");*/
			 
		} catch (Exception e) {
		}
	}

	 

}
