package com.cxgc.front.service;

import java.util.Date;
import java.util.List;

import com.cxgc.front.model.Guestbook;
import com.cxgc.front.model.GuestbookExt;

public interface GuestbookService<T> {
	
	public List<Guestbook> getListByPage(String informantName,String informantCardNo,String startTime,String endTime,String complaintNumber,String matterCategory,
			Integer ctgId,Integer createUser,String reportedName,Integer status,int page,int size);

	public List<Guestbook> getListByPageNoXf(String informantName, String informantCardNo, String startTime,String endTime,
			String complaintNumber, String matterCategory, Integer ctgId, Integer createUser,String reportedName,Integer status, int page, int size,int xfid);
		
	
	public int getPageCount(String informantName,String informantCardNo,String startTime,String endTime,String complaintNumber,
			String matterCategory,Integer ctgId,Integer createUser,String reportedName,Integer status);
	
	public int getPageCountNoxfid(String informantName, String informantCardNo, String startTime,String endTime, String complaintNumber,
			String matterCategory, Integer ctgId, Integer createUser,String reportedName,Integer status,int xfid);
	
	public List<Guestbook> getListByPage1(Date startTime, Date endTime, String assignNumber, 
			String assignCompany, String assignModality, String matterCategory, Integer ctgId, 
			Integer createUser, int page, int size);

	public int getPageCount1(Date startTime, Date endTime, String assignNumber, String assignCompany, 
			String assignModality, String matterCategory, Integer ctgId, Integer createUser);
	
	public List<Guestbook> getListByPage2(String informantName,String informantCardNo,String startTime,String endTime,String complaintNumber,String matterCategory,
			Integer ctgId,Integer createUser,String reportedName,int page,int size);

	public int getPageCount2(String informantName,String informantCardNo,String startTime,String endTime,String complaintNumber,
			String matterCategory,Integer ctgId,Integer createUser,String reportedName);
	
	public List<Guestbook> getListByPage3(Date startTime, Date endTime, String complaintNumber, 
			String matterCategory, Integer ctgId, Integer createUser, int page, int size);

	public int getPageCount3(Date startTime, Date endTime, String complaintNumber, String matterCategory, 
			Integer ctgId, Integer createUser);
	
	public List<Guestbook> getListByPage4(Date startTime, Date endTime, String complaintNumber, 
			String matterCategory, Integer ctgId, Integer status, int page, int size);

	public int getPageCount4(Date startTime, Date endTime, String complaintNumber, String matterCategory, 
			Integer ctgId, Integer status);
	
	public List<Guestbook> getListByPage5(Date startTime, Date endTime, String complaintNumber, 
			String matterCategory, Integer ctgId, Integer createUser, int page, int size);

	public int getPageCount5(Date startTime, Date endTime, String complaintNumber, String matterCategory, 
			Integer ctgId, Integer createUser);
	
	public Guestbook findById(Integer id);
	
	public Guestbook save(Guestbook guestbook,GuestbookExt guestbookExt);
	
	public Guestbook update(Guestbook guestbook);
	
	public int deleteById(Integer id);
	 
	public List<Object[]> getList(String sql);
	
}
