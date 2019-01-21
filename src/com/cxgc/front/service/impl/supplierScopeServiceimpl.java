package com.cxgc.front.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.SupplierScopeDao;
import com.cxgc.front.model.SupplierScope;
import com.cxgc.front.service.supplierScopeService;

@Service
@Transactional
public class supplierScopeServiceimpl implements supplierScopeService{

	@Autowired
	private SupplierScopeDao dao;
	
	@Override
	public List<SupplierScope> getList() {

		return dao.getList();
	}

}
