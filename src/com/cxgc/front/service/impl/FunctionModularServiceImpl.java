package com.cxgc.front.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.FunctionModularDao;
import com.cxgc.front.model.FunctionModular;
import com.cxgc.front.model.Modular;
import com.cxgc.front.service.FunctionModularService;


 
@Service
@Transactional
public class FunctionModularServiceImpl implements FunctionModularService {

	@Autowired
	public FunctionModularDao dao;
	
	
	@Override
	public List<FunctionModular> getlistByParent(Integer parentId) { 
		return dao.getlistByParent(parentId);
	}

	@Override
	public FunctionModular findById(Integer id){
		return dao.findById(id);
	}

	@Override
	public int getCount() {
		return dao.getCount();
	}
}
