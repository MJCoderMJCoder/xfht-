package com.cxgc.front.dao;

import java.util.Date;
import java.util.List;

import com.cxgc.front.model.Task;

public interface TaskDao<T> {

	public List<Task> getListByPage(Integer id,String name,String time_star,String time_end,Integer user_id,int page,int size);

	public int getPageCount(Integer id,String name,String time_star,String time_end,Integer user_id);
	
	public Task save(Task ts);

	public Task findById(Integer id);
	
	public int update(Task ts);

	public int deleteById(Integer id);
	
	public List<Object> getListByHandle(Integer user_id,Integer handle);
	
	public List<Task> getList(Integer user_id, String datetime,Integer Handle);
}
