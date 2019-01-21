package com.cxgc.front.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Expression;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.THelpTypeDao;
import com.cxgc.front.model.THelpType;

@Repository
public class THelpTypeDaoImpl extends BaseDao implements THelpTypeDao{

	protected final Logger log = Logger.getLogger(THelpTypeDaoImpl.class);
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<THelpType> getRegionsByFid(Integer fid) {
		log.debug("into RegionsofhljDaoImpl_getRegionsByFid : ");
		try {
			
			String sql = "from THelpType where 1=1 ";
			if(fid == null){
				sql += " and fid.id is null";
			}else{
				sql += " and fid.id = " + fid;
			}
			List<THelpType> result = getSession().createQuery(sql).list();
			
/*			List<THelpType> result = new ArrayList<THelpType>();
			result = getSession().createCriteria(THelpType.class).add(Expression.eq("fid.id", fid)).list();*/
			log.debug("RegionsofhljDaoImpl_getRegionsByFid : success");
			return result;
		} catch (RuntimeException re) {
			re.printStackTrace();
			log.debug("RegionsofhljDaoImpl_getRegionsByFid : error:"+re );
			return null;
		}
		
	}

	@Override
	public THelpType getById(int id) {
		log.debug("into RegionsofhljDaoImpl_Regionsofhlj : ");
		try {
			THelpType objReturn = (THelpType) getSession().get(THelpType.class, id);
			log.debug("out RegionsofhljDaoImpl_Regionsofhlj : success");
			return objReturn;
		} catch (RuntimeException re) {
			log.error("out RegionsofhljDaoImpl_Regionsofhlj : ex_", re);
			throw re;
		}
	}

	@Override
	public List<THelpType> getList(int pagenumber, int pageCount, DetachedCriteria dc) {
		log.debug("into InsterMessDaoImpl_getList : ");
		try {
			Criteria criteria = dc.getExecutableCriteria(getSession());
			criteria.setFirstResult((pagenumber - 1)* pageCount);
			criteria.setMaxResults(pageCount);
			@SuppressWarnings("unchecked")
			List<THelpType> rs = criteria.list();
			log.debug("out InsterMessDaoImpl_getList : success");
			return rs;
		} catch (RuntimeException re) {
			log.error("out InsterMessDaoImpl_getList : ex_", re);
			throw re;
		}
	}

}
