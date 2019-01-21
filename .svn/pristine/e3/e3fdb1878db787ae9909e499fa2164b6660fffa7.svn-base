package com.cxgc.front.dao;

import java.util.List;

import com.cxgc.front.model.FaceDB;

public interface FaceDBDao<T> {
	
	public List<FaceDB> getListByName(String name);
	
	public FaceDB findById(Integer id);

	public List<FaceDB> getByType(Integer type, int page, int size);
	
	public FaceDB save(FaceDB faceDB);
	
	public int getPageCount(Integer type);
	
	public FaceDB update(FaceDB faceDB);
	
	public int deleteById(Integer id);

	public int getPersonCountByFaceDB(Integer id);
}
