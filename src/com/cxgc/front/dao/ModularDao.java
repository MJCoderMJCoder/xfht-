package com.cxgc.front.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.cxgc.front.model.Modular;

public interface ModularDao {
	public List<Modular> getList(DetachedCriteria dc);
	
	public Modular findById(int id);
}
