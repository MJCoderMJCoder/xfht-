package com.cxgc.front.dao;

import java.util.List;

import com.cxgc.front.model.Guestbook;
import com.cxgc.front.model.Supplier;

public interface SupplierDao<T> {
	public List<Supplier> getListByPage(String supplier_name, String supplier_category, int page, int size);

	public int getPageCount(String supplier_name, String supplier_category);

	public int findById(Integer id);

	
}
