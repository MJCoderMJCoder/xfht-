package com.cxgc.front.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.GuestbookDao;
import com.cxgc.front.model.Guestbook;
import com.cxgc.front.util.DateUtils;



@Repository
public class GuestbookDaoImpl  extends BaseDao implements GuestbookDao<Object> {

	@Override
	public List<Guestbook> getListByPage(String informantName, String informantCardNo, String startTime,String endTime,
			String complaintNumber, String matterCategory, Integer ctgId, Integer createUser,String reportedName,Integer status, int page, int size) {
		
		StringBuffer hql = new StringBuffer("from Guestbook en where 1=1 ");
		
		if(informantName!=null && !"".equals(informantName.trim())){
			hql.append(" and en.ext.informantName like '%"+informantName+"%'");
		}
		
		if(informantCardNo!=null && !"".equals(informantCardNo.trim())){
			hql.append(" and en.ext.informantCardNo like '%"+informantCardNo+"%'");
		}
		
		if(startTime != null && !"".equals(startTime.trim())){
			hql.append(" and en.createTime >= '"+startTime+"'");	
		}
		
		if(endTime != null && !"".equals(endTime.trim())){
			hql.append(" and en.createTime < '"+endTime+" 23:59:59'");	
		}
		if(complaintNumber!=null && !"".equals(complaintNumber.trim())){
			hql.append(" and en.complaintNumber like '%"+complaintNumber+"%'");
		}
		if(matterCategory!=null && !"".equals(matterCategory.trim())){
			hql.append(" and en.ext.matterCategory like '%"+matterCategory+"%'");
		}
		
		if(ctgId!=null){
			hql.append(" and en.ctgId = '"+ctgId+"' ");
		}
		if(createUser!=null){
			hql.append(" and en.createUser.id = '"+createUser+"' ");
		}
		if(reportedName != null && "".equals(reportedName.trim())){
			hql.append(" and en.ext.reportedName like '%"+reportedName+"%'");
		}
		if(status!=null){
			hql.append(" and en.status = '"+status+"' ");
		}
		
		
		Query query = getSession().createQuery(hql.toString()).setFirstResult((page - 1) * size ).setMaxResults(size);
		List<Guestbook> list = query.list();
		return list;
	}

	
	@Override
	public List<Guestbook> getListByPageNoXfid(String informantName, String informantCardNo, String startTime,String endTime,
			String complaintNumber, String matterCategory, Integer ctgId, Integer createUser,String reportedName,Integer status, int page, int size,int xfid) {
		
		StringBuffer hql = new StringBuffer("from Guestbook en where 1=1 and en.id<>'"+xfid+"' ");
		hql.append(" and en.id not in (select follower  from GuestbookCase where leader <>'"+xfid+"') ");
	
		if(informantName!=null && !"".equals(informantName.trim())){
			hql.append(" and en.ext.informantName like '%"+informantName+"%'");
		}
		
		if(informantCardNo!=null && !"".equals(informantCardNo.trim())){
			hql.append(" and en.ext.informantCardNo like '%"+informantCardNo+"%'");
		}
		
		if(startTime != null && !"".equals(startTime.trim())){
			hql.append(" and en.createTime >= '"+startTime+"'");	
		}
		
		if(endTime != null && !"".equals(endTime.trim())){
			hql.append(" and en.createTime < '"+endTime+" 23:59:59'");	
		}
		if(complaintNumber!=null && !"".equals(complaintNumber.trim())){
			hql.append(" and en.complaintNumber like '%"+complaintNumber+"%'");
		}
		if(matterCategory!=null && !"".equals(matterCategory.trim())){
			hql.append(" and en.ext.matterCategory like '%"+matterCategory+"%'");
		}
		
		if(ctgId!=null){
			hql.append(" and en.ctgId = '"+ctgId+"' ");
		}
		if(createUser!=null){
			hql.append(" and en.createUser.id = '"+createUser+"' ");
		}
		if(reportedName != null && !("".equals(reportedName.trim()))){
			hql.append(" and en.ext.reportedName like '%"+reportedName+"%'");
		}
		if(status!=null){
			hql.append(" and en.status = '"+status+"' ");
		}
		
		System.out.println("查询列表的hql："+hql.toString());
		Query query = getSession().createQuery(hql.toString()).setFirstResult((page - 1) * size ).setMaxResults(size);
		List<Guestbook> list = query.list();
		return list;
	}
	
	
	@Override
	public int getPageCount(String informantName, String informantCardNo, String startTime,String endTime, String complaintNumber,
			String matterCategory, Integer ctgId, Integer createUser,String reportedName,Integer status) {
		
		StringBuilder hql = new StringBuilder();
		hql.append("select count(en.guestbook_id) from jc_guestbook en  where 1=1 ");
		
		if(informantName!=null && !"".equals(informantName.trim())){
			
			hql.append(" and (select informantName from jc_guestbook_ext where guestbook_id=en.guestbook_id ) like '%"+informantName+"%'");
			
		}
		
		if(informantCardNo!=null && !"".equals(informantCardNo.trim())){
			hql.append(" and (select informantCardNo from jc_guestbook_ext where guestbook_id=en.guestbook_id ) like '%"+informantCardNo+"%'");
		}
		
		if(startTime != null && !"".equals(startTime.trim())){
			hql.append(" and en.create_time >= '"+startTime+"'");	
		}
		
		if(endTime != null && !"".equals(endTime.trim())){
			hql.append(" and en.create_time < '"+endTime+" 23:59:59'");	
		}
		
		if(complaintNumber!=null && !"".equals(complaintNumber.trim())){
			hql.append(" and en.complaintNumber like '%"+complaintNumber+"%'");
		}
		
		
		if(matterCategory!=null && !"".equals(matterCategory.trim())){
			hql.append(" and (select matterCategory from jc_guestbook_ext where guestbook_id=en.guestbook_id ) like '%"+matterCategory+"%'");
		}
		
		if(ctgId!=null){
			hql.append(" and en.guestbookctg_id = '"+ctgId+"' ");
		}
		if(createUser!=null){
			hql.append(" and en.user_id = '"+createUser+"'");
		}
		if(reportedName != null && !"".equals(reportedName.trim())){
			hql.append(" and en.ext.reportedName like '%"+reportedName+"%'");
		}
		if(status!=null){
			hql.append(" and en.status = '"+status+"' ");
		}
		
		List<Object> objs = getSession().createSQLQuery(hql.toString()).list();
		
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		
		return 0;
	}
	
	@Override
	public int getPageCountNoxfid(String informantName, String informantCardNo, String startTime,String endTime, String complaintNumber,
			String matterCategory, Integer ctgId, Integer createUser,String reportedName,Integer status,int xfid) {
		
		StringBuilder hql = new StringBuilder();
		hql.append("select count(en.guestbook_id) from jc_guestbook en  left join jc_guestbook_ext enext on en.guestbook_id=enext.guestbook_id where 1=1 and en.guestbook_id<>'"+xfid+"' ");
		hql.append(" and en.guestbook_id not in (select follower  from jc_guestbook_case where leader <>'"+xfid+"')  "); 
		
		if(informantName!=null && !"".equals(informantName.trim())){
			
			hql.append(" and (select informantName from jc_guestbook_ext where guestbook_id=en.guestbook_id ) like '%"+informantName+"%'");
			
		}
		
		if(informantCardNo!=null && !"".equals(informantCardNo.trim())){
			hql.append(" and (select informantCardNo from jc_guestbook_ext where guestbook_id=en.guestbook_id ) like '%"+informantCardNo+"%'");
		}
		
		if(startTime != null && !"".equals(startTime.trim())){
			hql.append(" and en.create_time >= '"+startTime+"'");	
		}
		
		if(endTime != null && !"".equals(endTime.trim())){
			hql.append(" and en.create_time < '"+endTime+" 23:59:59'");	
		}
		
		if(complaintNumber!=null && !"".equals(complaintNumber.trim())){
			hql.append(" and en.complaintNumber like '%"+complaintNumber+"%'");
		}
		
		
		if(matterCategory!=null && !"".equals(matterCategory.trim())){
			hql.append(" and (select matterCategory from jc_guestbook_ext where guestbook_id=en.guestbook_id ) like '%"+matterCategory+"%'");
		}
		
		if(ctgId!=null){
			hql.append(" and en.guestbookctg_id = '"+ctgId+"' ");
		}
		if(createUser!=null){
			hql.append(" and en.user_id = '"+createUser+"'");
		}
		if(reportedName != null && !"".equals(reportedName.trim())){
			hql.append(" and enext.reportedName like '%"+reportedName+"%'");
		}
		if(status!=null){
			hql.append(" and en.status = '"+status+"' ");
		}
		System.out.println("hql:"+hql.toString());
		List<Object> objs = getSession().createSQLQuery(hql.toString()).list();
		
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		
		return 0;
	}
	
	
	@Override
	public List<Guestbook> getListByPage1(Date startTime, Date endTime, String assignNumber, 
			String assignCompany, String assignModality, String matterCategory, Integer ctgId, 
			Integer createUser, int page, int size) {
		
		StringBuffer hql = new StringBuffer("from Guestbook en where 1=1 ");
		
		hql.append(" and en.status in (1,2,3,4) ");
		
		if(startTime != null){
			hql.append(" and en.createTime >= '"+DateUtils.getDate2Str7(startTime)+"'");	
		}
		
		if(endTime != null){
			hql.append(" and en.createTime < '"+DateUtils.getDate2Str7(endTime)+"'");	
		}
		
		if(assignNumber!=null && !"".equals(assignNumber.trim())){
			hql.append(" and en.ext.assignNumber like '%"+assignNumber+"%'");
		}
		
		if(assignCompany!=null && !"".equals(assignCompany.trim())){
			hql.append(" and en.ext.assignCompany like '%"+assignCompany+"%'");
		}
		
		if(assignModality!=null && !"".equals(assignModality.trim())){
			hql.append(" and en.ext.assignModality like '%"+assignModality+"%'");
		}
		
		if(matterCategory!=null && !"".equals(matterCategory.trim())){
			hql.append(" and en.ext.matterCategory like '%"+matterCategory+"%'");
		}
		
		if(ctgId!=null){
			hql.append(" and en.ctgId = '"+ctgId+"' ");
		}
		
		if(createUser!=null){
			hql.append(" and en.createUser.id = '"+createUser+"' ");
		}
		
		hql.append(" order by en.createTime desc ");
		
		Query query = getSession().createQuery(hql.toString()).setFirstResult((page - 1) * size )
				.setMaxResults(size);
		List<Guestbook> list = query.list();
		return list;
	}

	@Override
	public int getPageCount1(Date startTime, Date endTime, String assignNumber, String assignCompany,
			String assignModality, String matterCategory, Integer ctgId, Integer createUser) {
		
		StringBuffer hql = new StringBuffer("select count(en.id) from Guestbook en where 1=1 ");
		
		hql.append(" and en.status in (1,2,3,4) ");
		
		if(startTime != null){
			hql.append(" and en.createTime >= '"+DateUtils.getDate2Str7(startTime)+"'");	
		}
		
		if(endTime != null){
			hql.append(" and en.createTime < '"+DateUtils.getDate2Str7(endTime)+"'");	
		}
		
		if(assignNumber!=null && !"".equals(assignNumber.trim())){
			hql.append(" and en.ext.assignNumber like '%"+assignNumber+"%'");
		}
		
		if(assignCompany!=null && !"".equals(assignCompany.trim())){
			hql.append(" and en.ext.assignCompany like '%"+assignCompany+"%'");
		}
		
		if(assignModality!=null && !"".equals(assignModality.trim())){
			hql.append(" and en.ext.assignModality like '%"+assignModality+"%'");
		}
		
		if(matterCategory!=null && !"".equals(matterCategory.trim())){
			hql.append(" and en.ext.matterCategory like '%"+matterCategory+"%'");
		}
		
		if(ctgId!=null){
			hql.append(" and en.ctgId = '"+ctgId+"' ");
		}
		
		if(createUser!=null){
			hql.append(" and en.createUser.id = '"+createUser+"' ");
		}
		
		hql.append(" order by en.createTime desc ");
		
		List<Object> objs = getSession().createQuery(hql.toString()).list();
		
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		
		return 0;
	}

	@Override
	public List<Guestbook> getListByPage2(String informantName, String informantCardNo, String startTime,String endTime,
			String complaintNumber, String matterCategory, Integer ctgId, Integer createUser,String reportedName, int page, int size) {
		
		StringBuffer hql = new StringBuffer("from Guestbook en where 1=1 ");
		
		hql.append(" and en.status in (1,2,3,4) ");
		
		if(informantName!=null && !"".equals(informantName.trim())){
			hql.append(" and en.ext.informantName like '%"+informantName+"%'");
		}
		
		if(informantCardNo!=null && !"".equals(informantCardNo.trim())){
			hql.append(" and en.ext.informantCardNo like '%"+informantCardNo+"%'");
		}
		
		if(startTime != null && !"".equals(startTime.trim())){
			hql.append(" and en.createTime >= '"+startTime+"'");	
		}
		
		if(endTime != null && !"".equals(endTime.trim())){
			hql.append(" and en.createTime < '"+endTime+" 23:59:59'");	
		}
		if(complaintNumber!=null && !"".equals(complaintNumber.trim())){
			hql.append(" and en.complaintNumber like '%"+complaintNumber+"%'");
		}
		if(matterCategory!=null && !"".equals(matterCategory.trim())){
			hql.append(" and en.ext.matterCategory like '%"+matterCategory+"%'");
		}
		
		if(ctgId!=null){
			hql.append(" and en.ctgId = '"+ctgId+"' ");
		}
		if(createUser!=null){
			hql.append(" and en.createUser.id = '"+createUser+"' ");
		}
		if(reportedName != null && "".equals(reportedName.trim())){
			hql.append(" and en.ext.reportedName like '%"+reportedName+"%'");
		}
		
		Query query = getSession().createQuery(hql.toString()).setFirstResult((page - 1) * size ).setMaxResults(size);
		List<Guestbook> list = query.list();
		return list;
	}
	
	@Override
	public int getPageCount2(String informantName, String informantCardNo, String startTime,String endTime, String complaintNumber,
			String matterCategory, Integer ctgId, Integer createUser,String reportedName) {
		
		StringBuilder hql = new StringBuilder();
		hql.append("select count(en.guestbook_id) from jc_guestbook en  where 1=1 ");
		
		hql.append(" and en.status in (1,2,3,4) ");
		
		if(informantName!=null && !"".equals(informantName.trim())){
			
			hql.append(" and (select informantName from jc_guestbook_ext where guestbook_id=en.guestbook_id ) like '%"+informantName+"%'");
			
		}
		
		if(informantCardNo!=null && !"".equals(informantCardNo.trim())){
			hql.append(" and (select informantCardNo from jc_guestbook_ext where guestbook_id=en.guestbook_id ) like '%"+informantCardNo+"%'");
		}
		
		if(startTime != null && !"".equals(startTime.trim())){
			hql.append(" and en.create_time >= '"+startTime+"'");	
		}
		
		if(endTime != null && !"".equals(endTime.trim())){
			hql.append(" and en.create_time < '"+endTime+" 23:59:59'");	
		}
		
		if(complaintNumber!=null && !"".equals(complaintNumber.trim())){
			hql.append(" and en.complaintNumber like '%"+complaintNumber+"%'");
		}
		
		
		if(matterCategory!=null && !"".equals(matterCategory.trim())){
			hql.append(" and (select matterCategory from jc_guestbook_ext where guestbook_id=en.guestbook_id ) like '%"+matterCategory+"%'");
		}
		
		if(ctgId!=null){
			hql.append(" and en.guestbookctg_id = '"+ctgId+"' ");
		}
		if(createUser!=null){
			hql.append(" and en.user_id = '"+createUser+"'");
		}
		if(reportedName != null && !"".equals(reportedName.trim())){
			hql.append(" and en.ext.reportedName like '%"+reportedName+"%'");
		}
		
		List<Object> objs = getSession().createSQLQuery(hql.toString()).list();
		
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		
		return 0;
	}
	
	@Override
	public List<Guestbook> getListByPage3(Date startTime, Date endTime, String complaintNumber, String matterCategory,
			Integer ctgId, Integer createUser, int page, int size) {
		
		StringBuffer hql = new StringBuffer("from Guestbook en where 1=1 ");
		
		hql.append(" and en.status in (1,2,3,4) ");
		
		if(startTime != null){
			hql.append(" and en.createTime >= '"+DateUtils.getDate2Str7(startTime)+"'");	
		}
		
		if(endTime != null){
			hql.append(" and en.createTime < '"+DateUtils.getDate2Str7(endTime)+"'");	
		}
		
		if(complaintNumber!=null && !"".equals(complaintNumber.trim())){
			hql.append(" and en.complaintNumber like '%"+complaintNumber+"%'");
		}
		
		if(matterCategory!=null && !"".equals(matterCategory.trim())){
			hql.append(" and en.ext.matterCategory like '%"+matterCategory+"%'");
		}
		
		if(ctgId!=null){
			hql.append(" and en.ctgId = '"+ctgId+"' ");
		}
		
		if(createUser!=null){
			hql.append(" and en.createUser.id = '"+createUser+"' ");
		}
		
		hql.append(" order by en.createTime desc ");
		
		Query query = getSession().createQuery(hql.toString()).setFirstResult((page - 1) * size )
				.setMaxResults(size);
		List<Guestbook> list = query.list();
		return list;
	}

	@Override
	public int getPageCount3(Date startTime, Date endTime, String complaintNumber, String matterCategory, Integer ctgId,
			Integer createUser) {
		
		StringBuffer hql = new StringBuffer("select count(en.id) from Guestbook en where 1=1 ");
		
		hql.append(" and en.status in (1,2,3,4) ");
		
		if(startTime != null){
			hql.append(" and en.createTime >= '"+DateUtils.getDate2Str7(startTime)+"'");	
		}
		
		if(endTime != null){
			hql.append(" and en.createTime < '"+DateUtils.getDate2Str7(endTime)+"'");	
		}
		
		if(complaintNumber!=null && !"".equals(complaintNumber.trim())){
			hql.append(" and en.complaintNumber like '%"+complaintNumber+"%'");
		}
		
		if(matterCategory!=null && !"".equals(matterCategory.trim())){
			hql.append(" and en.ext.matterCategory like '%"+matterCategory+"%'");
		}
		
		if(ctgId!=null){
			hql.append(" and en.ctgId = '"+ctgId+"' ");
		}
		
		if(createUser!=null){
			hql.append(" and en.createUser.id = '"+createUser+"' ");
		}
		
		hql.append(" order by en.createTime desc ");
		
		List<Object> objs = getSession().createQuery(hql.toString()).list();
		
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		
		return 0;
	}
	
	@Override
	public List<Guestbook> getListByPage4(Date startTime, Date endTime, String complaintNumber, String matterCategory,
			Integer ctgId, Integer status, int page, int size) {
		
		StringBuffer hql = new StringBuffer("from Guestbook en where 1=1 ");
		
		hql.append(" and en.id not in (select gbc.follower from GuestbookCase gbc) ");
		
		if(startTime != null){
			hql.append(" and en.endTime >= '"+DateUtils.getDate2Str7(startTime)+"'");	
		}
		
		if(endTime != null){
			hql.append(" and en.endTime < '"+DateUtils.getDate2Str7(endTime)+"'");	
		}
		
		if(complaintNumber!=null && !"".equals(complaintNumber.trim())){
			hql.append(" and en.complaintNumber like '%"+complaintNumber+"%'");
		}
		
		if(matterCategory!=null && !"".equals(matterCategory.trim())){
			hql.append(" and en.ext.matterCategory like '%"+matterCategory+"%'");
		}
		
		if(ctgId!=null){
			hql.append(" and en.ctgId = '"+ctgId+"' ");
		}
		
		if(status!=null){
			hql.append(" and en.status = '"+status+"' ");
		}
		
		Query query = getSession().createQuery(hql.toString()).setFirstResult((page - 1) * size )
				.setMaxResults(size);
		List<Guestbook> list = query.list();
		return list;
	}

	@Override
	public int getPageCount4(Date startTime, Date endTime, String complaintNumber, String matterCategory, Integer ctgId,
			Integer status) {
		
		StringBuffer hql = new StringBuffer("select count(en.id) from Guestbook en where 1=1 ");
		
		hql.append(" and en.id not in (select gbc.follower from GuestbookCase gbc) ");
		
		if(startTime != null){
			hql.append(" and en.endTime >= '"+DateUtils.getDate2Str7(startTime)+"'");	
		}
		
		if(endTime != null){
			hql.append(" and en.endTime < '"+DateUtils.getDate2Str7(endTime)+"'");	
		}
		
		if(complaintNumber!=null && !"".equals(complaintNumber.trim())){
			hql.append(" and en.complaintNumber like '%"+complaintNumber+"%'");
		}
		
		if(matterCategory!=null && !"".equals(matterCategory.trim())){
			hql.append(" and en.ext.matterCategory like '%"+matterCategory+"%'");
		}
		
		if(ctgId!=null){
			hql.append(" and en.ctgId = '"+ctgId+"' ");
		}
		
		if(status!=null){
			hql.append(" and en.status = '"+status+"' ");
		}
		
		List<Object> objs = getSession().createQuery(hql.toString()).list();
		
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		
		return 0;
	}
	
	@Override
	public List<Guestbook> getListByPage5(Date startTime, Date endTime, String complaintNumber, String matterCategory,
			Integer ctgId, Integer createUser, int page, int size) {
		
		StringBuffer hql = new StringBuffer("from Guestbook en where 1=1 ");
		
		hql.append(" and en.status in (3,5,6,7,8,9,10) ");
		
		if(startTime != null){
			hql.append(" and en.endTime >= '"+DateUtils.getDate2Str7(startTime)+"'");	
		}
		
		if(endTime != null){
			hql.append(" and en.endTime < '"+DateUtils.getDate2Str7(endTime)+"'");	
		}
		
		if(complaintNumber!=null && !"".equals(complaintNumber.trim())){
			hql.append(" and en.complaintNumber like '%"+complaintNumber+"%'");
		}
		
		if(matterCategory!=null && !"".equals(matterCategory.trim())){
			hql.append(" and en.ext.matterCategory like '%"+matterCategory+"%'");
		}
		
		if(ctgId!=null){
			hql.append(" and en.ctgId = '"+ctgId+"' ");
		}
		
		if(createUser!=null){
			hql.append(" and en.ext.processingHead.id = '"+createUser+"' ");
		}
		
		hql.append(" and en.id not in (select gbc.follower from GuestbookCase gbc) ");
		
		Query query = getSession().createQuery(hql.toString()).setFirstResult((page - 1) * size )
				.setMaxResults(size);
		List<Guestbook> list = query.list();
		return list;
	}

	@Override
	public int getPageCount5(Date startTime, Date endTime, String complaintNumber, String matterCategory, Integer ctgId,
			Integer createUser) {
		
		StringBuffer hql = new StringBuffer("select count(en.id) from Guestbook en where 1=1 ");
		
		hql.append(" and en.status in (3,5,6,7,8,9,10) ");
		
		if(startTime != null){
			hql.append(" and en.endTime >= '"+DateUtils.getDate2Str7(startTime)+"'");	
		}
		
		if(endTime != null){
			hql.append(" and en.endTime < '"+DateUtils.getDate2Str7(endTime)+"'");	
		}
		
		if(complaintNumber!=null && !"".equals(complaintNumber.trim())){
			hql.append(" and en.complaintNumber like '%"+complaintNumber+"%'");
		}
		
		if(matterCategory!=null && !"".equals(matterCategory.trim())){
			hql.append(" and en.ext.matterCategory like '%"+matterCategory+"%'");
		}
		
		if(ctgId!=null){
			hql.append(" and en.ctgId = '"+ctgId+"' ");
		}
		
		if(createUser!=null){
			hql.append(" and en.ext.processingHead.id = '"+createUser+"' ");
		}
		
		hql.append(" and en.id not in (select gbc.follower from GuestbookCase gbc) ");
		
		List<Object> objs = getSession().createQuery(hql.toString()).list();
		
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		
		return 0;
	}
	
	@Override
	public Guestbook findById(Integer id) {
		if(id == null ){
			return null;
		}
		StringBuffer hql = new StringBuffer("from Guestbook en where en.id = " + id );
		Query query = getSession().createQuery(hql.toString());
		List<Guestbook> list = query.list();
		if(list == null || list.size() <= 0){
			return null;
		}
		return list.get(0);
	}

	@Override
	public Guestbook save(Guestbook guestbook) {
		getSession().save(guestbook);
		return guestbook;
	}

	@Override
	public Guestbook update(Guestbook guestbook) {
		
		getSession().update(guestbook);
		getSession().merge(guestbook);
		
		return guestbook;
	}

	@Override
	public int deleteById(Integer id) {
		int i = 0;
		try {
			String strUpdate = "delete from jc_guestbook where id = " + id;
			SQLQuery qu = getSession().createSQLQuery(strUpdate);
			i = qu.executeUpdate();
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

	
	@Override
	public List<Object[]> getList(String sql) {
		SQLQuery sqy = getSession().createSQLQuery(sql.toString());
		List lt = sqy.list();
		return lt;
	}
	
	
	
}
