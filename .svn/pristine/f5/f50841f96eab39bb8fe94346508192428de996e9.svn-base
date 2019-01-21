package com.cxgc.front.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.TaskDao;
import com.cxgc.front.model.Task;
import com.cxgc.front.service.TaskService;

@Service
@Transactional
public class TaskServiceImpl<T> implements TaskService<T> {
	@Autowired
	private TaskDao<T> dao;
	
	@Override
	public List<Task> getListByPage(Integer id, String name, String time_star, String time_end,Integer user_id, int page, int size) {
		// TODO Auto-generated method stub
		return dao.getListByPage(id, name, time_star, time_end,user_id, page, size);
	}

	@Override
	public int getPageCount(Integer id, String name, String time_star, String time_end,Integer user_id) {
		// TODO Auto-generated method stub
		return dao.getPageCount(id, name, time_star, time_end,user_id);
	}

	@Override
	public Task save(Task ts) {
		// TODO Auto-generated method stub
		return dao.save(ts);
	}

	@Override
	public Task findById(Integer id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	@Override
	public int update(Task ts) {
		// TODO Auto-generated method stub
		return dao.update(ts);
	}

	@Override
	public int deleteById(Integer id) {
		// TODO Auto-generated method stub
		return dao.deleteById(id);
	}

	@Override
	public List<Object> getListByHandle(Integer user_id, Integer handle) {
		// TODO Auto-generated method stub
		return dao.getListByHandle(user_id, handle);
	}

	@Override
	public List<Task> getList(Integer user_id, String datetime, Integer Handle) {
		// TODO Auto-generated method stub
		return dao.getList(user_id, datetime, Handle);
	}

}
