package com.cxgc.front.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.FaceDBDao;
import com.cxgc.front.model.FaceDB;
import com.cxgc.front.service.FaceDBService;

@Service
@Transactional
public class FaceDBServiceImpl<T> implements FaceDBService<T>{

	@Autowired
	private FaceDBDao<T> dao;

	public List<FaceDB> getListByName(String name){
		return dao.getListByName(name);
	}

	@Override
	public FaceDB findById(Integer id) {
		return dao.findById(id);
	}

	@Override
	public List<FaceDB> getByType(Integer type, int page, int size) {
		return dao.getByType(type, page, size);
	}

	@Override
	public FaceDB save(FaceDB faceDB) {
		return dao.save(faceDB);
	}

	@Override
	public int getPageCount(Integer type) {
		return dao.getPageCount(type);
	}

	@Override
	public FaceDB update(FaceDB faceDB) {
		return dao.update(faceDB);
	}

	@Override
	public int deleteById(Integer id) {
		return dao.deleteById(id);
	}

	@Override
	public int getPersonCountByFaceDB(Integer id) {
		return dao.getPersonCountByFaceDB(id);
	}

	
}
