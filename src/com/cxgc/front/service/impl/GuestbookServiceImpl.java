package com.cxgc.front.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.GuestbookDao;
import com.cxgc.front.dao.GuestbookExtDao;
import com.cxgc.front.model.Guestbook;
import com.cxgc.front.model.GuestbookExt;
import com.cxgc.front.service.GuestbookExtService;
import com.cxgc.front.service.GuestbookService;

@Service
@Transactional
public class GuestbookServiceImpl<T> implements GuestbookService<T>{

	@Autowired
	private GuestbookDao<T> dao;
	@Autowired
	private GuestbookExtDao<T> extDao;
	
	@Autowired
	private GuestbookExtService<T> guestbookExtMng;

	@Override
	public List<Guestbook> getListByPage(String informantName, String informantCardNo, String startTime,String endTime,
			String complaintNumber, String matterCategory, Integer ctgId, Integer createUser,String reportedName,Integer status, int page, int size) {
		return dao.getListByPage(informantName,informantCardNo,startTime,endTime,complaintNumber,matterCategory,ctgId,createUser,reportedName,status,page,size);
	}
	
	

	@Override
	public List<Guestbook> getListByPageNoXf(String informantName, String informantCardNo, String startTime,String endTime,
			String complaintNumber, String matterCategory, Integer ctgId, Integer createUser,String reportedName,Integer status, int page, int size,int xfid) {
		return dao.getListByPageNoXfid(informantName,informantCardNo,startTime,endTime,complaintNumber,matterCategory,ctgId,createUser,reportedName,status,page,size,xfid);
	}
	

	@Override
	public int getPageCount(String informantName, String informantCardNo, String startTime,String endTime, String complaintNumber,
			String matterCategory, Integer ctgId, Integer createUser,String reportedName,Integer status) {
		return dao.getPageCount(informantName,informantCardNo,startTime,endTime,complaintNumber,matterCategory,ctgId,createUser,reportedName,status);
	}
	
	@Override
	public int getPageCountNoxfid(String informantName, String informantCardNo, String startTime,String endTime, String complaintNumber,
			String matterCategory, Integer ctgId, Integer createUser,String reportedName,Integer status,int xfid) {
		return dao.getPageCountNoxfid(informantName,informantCardNo,startTime,endTime,complaintNumber,matterCategory,ctgId,createUser,reportedName,status,xfid);
	}
	
	@Override
	public List<Guestbook> getListByPage1(Date startTime, Date endTime, String assignNumber, 
			String assignCompany, String assignModality, String matterCategory, Integer ctgId, 
			Integer createUser, int page, int size) {
		return dao.getListByPage1(startTime, endTime, assignNumber, assignCompany, assignModality, 
				matterCategory, ctgId, createUser, page, size);
	}

	@Override
	public int getPageCount1(Date startTime, Date endTime, String assignNumber, String assignCompany,
			String assignModality, String matterCategory, Integer ctgId, Integer createUser) {
		return dao.getPageCount1(startTime, endTime, assignNumber, assignCompany, assignModality, 
				matterCategory, ctgId, createUser);
	}
	
	@Override
	public List<Guestbook> getListByPage2(String informantName, String informantCardNo, String startTime,String endTime,
			String complaintNumber, String matterCategory, Integer ctgId, Integer createUser,String reportedName, int page, int size) {
		return dao.getListByPage2(informantName,informantCardNo,startTime,endTime,complaintNumber,matterCategory,ctgId,createUser,reportedName,page,size);
	}

	@Override
	public int getPageCount2(String informantName, String informantCardNo, String startTime,String endTime, String complaintNumber,
			String matterCategory, Integer ctgId, Integer createUser,String reportedName) {
		return dao.getPageCount2(informantName,informantCardNo,startTime,endTime,complaintNumber,matterCategory,ctgId,createUser,reportedName);
	}

	@Override
	public List<Guestbook> getListByPage3(Date startTime, Date endTime, String complaintNumber, String matterCategory,
			Integer ctgId, Integer createUser, int page, int size) {
		return dao.getListByPage3(startTime, endTime, complaintNumber, matterCategory, ctgId, createUser, page, size);
	}
	
	@Override
	public int getPageCount3(Date startTime, Date endTime, String complaintNumber, String matterCategory, Integer ctgId,
			Integer createUser) {
		return dao.getPageCount3(startTime, endTime, complaintNumber, matterCategory, ctgId, createUser);
	}
	
	@Override
	public List<Guestbook> getListByPage4(Date startTime, Date endTime, String complaintNumber, String matterCategory,
			Integer ctgId, Integer status, int page, int size) {
		return dao.getListByPage4(startTime, endTime, complaintNumber, matterCategory, ctgId, status, page, size);
	}

	@Override
	public int getPageCount4(Date startTime, Date endTime, String complaintNumber, String matterCategory, Integer ctgId,
			Integer status) {
		return dao.getPageCount4(startTime, endTime, complaintNumber, matterCategory, ctgId, status);
	}
	
	@Override
	public List<Guestbook> getListByPage5(Date startTime, Date endTime, String complaintNumber, String matterCategory,
			Integer ctgId, Integer createUser, int page, int size) {
		return dao.getListByPage5(startTime, endTime, complaintNumber, matterCategory, ctgId, createUser, page, size);
	}
	
	@Override
	public int getPageCount5(Date startTime, Date endTime, String complaintNumber, String matterCategory, Integer ctgId,
			Integer createUser) {
		return dao.getPageCount5(startTime, endTime, complaintNumber, matterCategory, ctgId, createUser);
	}
	
	@Override
	public Guestbook findById(Integer id) {
		return dao.findById(id);
	}

	@Override
	public Guestbook save(Guestbook guestbook, GuestbookExt guestbookExt) {
		
		Guestbook g = dao.save(guestbook);
		guestbookExt.setId(g.getId());
		guestbookExtMng.save(guestbookExt, guestbook);
		
		return guestbook;
	}

	@Override
	public Guestbook update(Guestbook guestbook) {
		
		dao.update(guestbook);
		
		return guestbook;
	}
	
	@Override
	public int deleteById(Integer id) {
		
		int count = extDao.deleteById(id);
		if(count==1){
			dao.deleteById(id);
			return 1;
		}
		return 0;
	}

	@Override
	public List<Object[]> getList(String sql) { 
		return dao.getList(sql);
	}
	
	
	
}
