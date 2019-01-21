package com.cxgc.front.util;

import com.cxgc.front.application.StartupListener;

/**
 * Copy Right Information :  HITDY<br/>
 * Project                :  hitznly<br/>
 * Author                 :  fzx<br/>
 * JDK version used       :  JDK 1.8
 * Description            :  各种静态公用数据的方法
 * @version  0.0.0.1
 */
public class StacticVariable {
	
	public  static String getPoliceFaceDBId()
	{
		return StartupListener.police_faceDB_id;
	}
	
	public  static String getSuspectFaceDBId()
	{
		return StartupListener.suspect_faceDB_id;
	}
	
	public  static String getFollowFaceDBId()
	{
		return StartupListener.follow_faceDB_id;
	}
	
	public  static int getPageCount()
	{
		return Integer.parseInt(StartupListener.pagecount);
	}
	
	public  static String getOcrPath()
	{
		return StartupListener.ocrPath;
	}
	/*public  static String getFilepath_webapps()
	{
		return StartupListener.filepath_webapps;
	}
	
	public static String getProject_path()
	{
		return StartupListener.project_path;
	}

	public static String getProject_port()
	{
		return StartupListener.project_port;
	}
	
	public static String getimg_path()
	{
		return StartupListener.img_path;
	}

	public  static String getStrange_DB_Name()
	{
		return StartupListener.stranger_db_name;
	}

	public  static String getWorkTimeFile()
	{
		return StartupListener.WORK_TIME_FILE;
	}
	
	public static String getStudentFaceDBId()
	{
		return StartupListener.student_faceDB_id;
	}

	public static String getBuildingId()
	{
		return StartupListener.building_id;
	}
	
	public static String getReal_path()
	{
		return StartupListener.real_path;
	}*/
}
