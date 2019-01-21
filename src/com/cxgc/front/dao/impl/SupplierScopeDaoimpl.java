package com.cxgc.front.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.SupplierScopeDao;
import com.cxgc.front.model.Supplier;
import com.cxgc.front.model.SupplierScope;
@Repository
public class SupplierScopeDaoimpl extends BaseDao implements SupplierScopeDao {


	@Override
	public List<SupplierScope> getList() {
		StringBuilder sqlBuilder = new StringBuilder();
		sqlBuilder.append("SELECT supplier_scope.supplier_scope FROM supplier_scope ");	
		
		Query query = getSession().createSQLQuery(sqlBuilder.toString());
		List<SupplierScope> dictionarys = query.list();
		
		return dictionarys;
	}

}
