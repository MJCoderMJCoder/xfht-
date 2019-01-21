package com.cxgc.front.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.DictionaryDao;
import com.cxgc.front.model.Dictionary;
import com.cxgc.front.service.DictionaryService;

@Service
@Transactional
public class DictionaryServiceImpl<T> implements DictionaryService<T>{

	@Autowired
	private DictionaryDao<T> dao;

	@Override
	public Integer save(Dictionary dictionary) {
		return dao.save(dictionary);
	}

	@Override
	public List<Dictionary> getListByPage(String type, int page, int size) {
		return dao.getListByPage(type, page, size);
	}

	@Override
	public int getPageCount(String type) {
		return dao.getPageCount(type);
	}

	@Override
	public Dictionary findById(Integer id) {
		return dao.findById(id);
	}

	@Override
	public int update(Dictionary dictionary) {
		return dao.update(dictionary);
	}

	@Override
	public List<Dictionary> getList(String name, String value, String type) {
		return dao.getList(name, value, type);
	}

	@Override
	public int deleteById(Integer id) {
		return dao.deleteById(id);
	}

	@Override
	public List<String> getTypeList() {
		return dao.getTypeList();
	}

	
}
