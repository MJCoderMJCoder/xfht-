package com.cxgc.front.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.SupplierDao;
import com.cxgc.front.model.Guestbook;
import com.cxgc.front.model.Supplier;

@Repository
public class SupplierDaoimpl extends BaseDao implements SupplierDao<Object> {


	@Override
	public List<Supplier> getListByPage(String supplier_name, String supplier_category, int page, int size) {
StringBuilder hql = new StringBuilder();
		
		hql.append(" SELECT su.id,su.supplier_name, su.supplier_rank,sc.supplier_scope,  su.supplier_delivery, su.supplier_servicequality, su.supplier_productquality, su.supplier_accountperiod,");
		hql.append(" su.supplier_totalscore, su.supplier_rating, su.supplier_evaluate FROM" );
		
		hql.append(" supplier AS su ");
		hql.append(" LEFT join supplier_scope sc  on su.supplier_category= sc.id");
		hql.append(" where 1=1 ");
		
		if(supplier_name != null && !"".equals(supplier_name.trim())){
			hql.append("AND su.supplier_name ='"+supplier_name+"' ");	
		}
		if(supplier_category != null && !"".equals(supplier_category.trim())){
			hql.append("AND sc.supplier_scope = '"+supplier_category+"'");	
		}
		
		Query query = getSession().createSQLQuery(hql.toString()).setFirstResult((page - 1) * size ).setMaxResults(size);
		List<Supplier> list = query.list();
		return list;
		
	}

	@Override
	public int getPageCount(String supplier_name, String supplier_category) {
		StringBuilder hql = new StringBuilder();
		hql.append("select count(su.id) from supplier AS su");

		hql.append(" LEFT JOIN supplier_scope sc ON su.supplier_category = sc.id  ");
		hql.append(" where 1=1  ");
		if(supplier_name != null && !"".equals(supplier_name.trim())){
			hql.append("AND su.supplier_name = '"+supplier_name+"' ");	
		}
		if(supplier_category != null && !"".equals(supplier_category.trim())){
			hql.append("AND  sc.supplier_scope = '"+supplier_category+"'");	
		}
		
		
		List<Object> objs = getSession().createSQLQuery(hql.toString()).list();
		
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		
		return 0;
	}

	@Override
	public int findById(Integer id) {
		if(id == null ){
			return  1;
		}
		String hql = "DELETE FROM supplier WHERE id = ?";
		Query query = getSession().createSQLQuery(hql);
	    query.setInteger(0, id);  
	    query.executeUpdate();  
		return 0;
	}

}
