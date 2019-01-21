package com.cxgc.front.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.THelpDao;
import com.cxgc.front.model.THelp;
import com.cxgc.front.service.THelpService;

@Service
@Transactional
public class THelpServiceImpl implements THelpService {

	@Autowired
	private THelpDao dao;
	
	@Override
	public THelp getHelpById(int helpid) {
		// TODO Auto-generated method stub
		return dao.getHelpById(helpid);
	}

	@Override
	public THelp mergeTHelp(THelp obj) {
		// TODO Auto-generated method stub
		return dao.mergeTHelp(obj);
	}

	@Override
	public int saveTHelp(THelp obj) {
		// TODO Auto-generated method stub
		return dao.saveTHelp(obj);
	}

	@Override
	public int deleteTHelp(THelp obj) {
		// TODO Auto-generated method stub
		return dao.deleteTHelp(obj);
	}

	@Override
	public List<THelp> getTHelpByTypeDesc(int pageindex, int pageNumber, String[] type,String title,String cont) {
		// TODO Auto-generated method stub
		DetachedCriteria dc = DetachedCriteria.forClass(THelp.class); 
		if (type != null) {
			for (int i = 0; i < type.length; i++) {
				switch (i) {
				case 0:
					if(type[i]==null) {
						break;
					}
					else {
						dc.add(Restrictions.eq("type1", type[i]));
						break;
					} 
				case 1:
					if(type[i]==null) {
						break;
					}
					else {
					dc.add(Restrictions.eq("type2", type[i]));
					break;
					} 
				case 2:
					if(type[i]==null) {
						break;
					}
					else {
					dc.add(Restrictions.eq("type3", type[i]));
					break;
					} 
				case 3:
					if(type[i]==null) {
						break;
					}
					else {
					dc.add(Restrictions.eq("type4", type[i]));
					break;
					} 
				case 4:
					if(type[i]==null) {
						break;
					}
					else {
					dc.add(Restrictions.eq("type5", type[i]));
					break;
					} 
				}
			}
		}
		if(title!="") { 
			dc.add(Restrictions.like("title", title));
		} 
		if(cont!="") {
			dc.add(Restrictions.like("datail", cont));
		}
		dc.addOrder(Order.desc("createtime"));
		return dao.getListBySearch(pageindex, pageNumber, dc);
	}

	@Override
	public List<THelp> getHelpByHotDesc(int pageindex, int pageNumber) {
		DetachedCriteria dc = DetachedCriteria.forClass(THelp.class); 	
		dc.addOrder(Order.desc("readcount"));
		/*dc.add(Restrictions.eq("areas", areas));
		dc.add(Restrictions.sqlRestriction(sql));
		dc.addOrder(Order.desc("addtime"));*/
		
		return dao.getListBySearch(pageindex, pageNumber, dc);
	}

	@Override
	public int addReadNum(int helpid) {
		// TODO Auto-generated method stub
		return dao.addReadNum(helpid);
	}

	@Override
	public int getcount(String sql) {
		 
		//getSession().createQuery(sql.toString()).uniqueResult();
		
		return dao.getcount(sql);
	}

}
