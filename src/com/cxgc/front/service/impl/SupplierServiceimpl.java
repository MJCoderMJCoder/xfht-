package com.cxgc.front.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.SupplierDao;
import com.cxgc.front.model.Guestbook;
import com.cxgc.front.model.Supplier;
import com.cxgc.front.service.SupplierService;

@Service
@Transactional
public class  SupplierServiceimpl<T> implements SupplierService<T> {
	@Autowired
	private SupplierDao<T> dao;

	
	
	@Override
	public List<Supplier> getListByPage(String supplier_name, String supplier_category, int page, int size) {
		return dao.getListByPage(supplier_name,supplier_category, page, size);
		}



	@Override
	public int getPageCount(String supplier_name, String supplier_category) {
		return dao.getPageCount(supplier_name,supplier_category);
	}



	@Override
	public int findById(Integer id) {
		return dao.findById(id);
	}



	@Override
	public Supplier update(Supplier g) {
		// TODO Auto-generated method stub
		return null;
	}



}
