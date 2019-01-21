package com.cxgc.front.dao;

import java.util.List;

import com.cxgc.front.model.Person;

public interface PersonDao<T> {
	
	public Person save(Person person);
	
	public List<Person> getListByPage(String name, Integer faceDBId, int page, int size);
	
	public int getPageCount(String name, Integer faceDBId);
	
	public Person findById(Integer id);
	
	public int update(Person person);

	public List<Person> getList(String name, String value, String type);

	public List<String> getTypeList();
	
	public int deleteById(Integer id);
}
