package com.cxgc.front.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.PersonDao;
import com.cxgc.front.model.Person;
import com.cxgc.front.service.PersonService;

@Service
@Transactional
public class PersonServiceImpl<T> implements PersonService<T>{

	@Autowired
	private PersonDao<T> dao;

	@Override
	public Person save(Person person) {
		return dao.save(person);
	}

	@Override
	public List<Person> getListByPage(String name, Integer faceDBId, int page, int size) {
		return dao.getListByPage(name, faceDBId, page, size);
	}

	@Override
	public int getPageCount(String name, Integer faceDBId) {
		return dao.getPageCount(name, faceDBId);
	}

	@Override
	public Person findById(Integer id) {
		return dao.findById(id);
	}

	@Override
	public int update(Person person) {
		return dao.update(person);
	}

	@Override
	public List<Person> getList(String name, String value, String type) {
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
