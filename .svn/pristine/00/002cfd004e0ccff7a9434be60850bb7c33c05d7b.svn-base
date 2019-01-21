package com.cxgc.front.service;

import java.util.List;

import com.cxgc.front.model.FaceDB;

public interface FaceDBService<T> {
	
	public List<FaceDB> getListByName(String name );
	
	public FaceDB findById(Integer id);
	
	public List<FaceDB> getByType(Integer type, int page, int size);
	
	public int getPageCount(Integer type);
	
	public FaceDB save(FaceDB faceDB);

	public FaceDB update(FaceDB faceDB);
	
	public int deleteById(Integer id);

	public int getPersonCountByFaceDB(Integer id);
	
}
