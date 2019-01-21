package com.cxgc.front.service;

import java.util.List;

import com.cxgc.front.model.Supplier;

public interface SupplierService<T> {


	public List<Supplier> getListByPage(String supplier_name, String supplier_category, int page,int size);

	public int getPageCount(String supplier_name, String supplier_category);

	public int findById(Integer id);

	public Supplier update(Supplier g);

}
