package com.cxgc.front.service;

import java.util.List;

import com.cxgc.front.model.Dictionary;

public interface DictionaryService<T> {
	
	public Integer save(Dictionary dictionary);
	
	public List<Dictionary> getListByPage(String type,int page,int size);

	public int getPageCount(String type);

	public Dictionary findById(Integer id);

	public int update(Dictionary dictionary);
	
	public List<Dictionary> getList(String name, String value, String type);

	public List<String> getTypeList();
	
	public int deleteById(Integer id);
}
