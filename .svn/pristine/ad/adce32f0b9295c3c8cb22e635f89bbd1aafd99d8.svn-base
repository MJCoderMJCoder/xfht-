package com.cxgc.front.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.TaskDao;
import com.cxgc.front.model.Task;

@Repository
public class TaskDaoImpl extends BaseDao implements TaskDao<Object> {

	@Override
	public List<Task> getListByPage(Integer id, String name, String time_star, String time_end,Integer user_id, int page, int size) {
		StringBuffer hql = new StringBuffer("from Task ts where ts.user_id = "+user_id+" ");
		if(id != null){
			hql.append(" and ts.id <> "+id+"");
		}
		if(name != null && !"".equals(name.trim())){
			hql.append(" and ts.name like '%"+name+"%'");
		}
		if(time_star != null && !"".equals(time_star.trim())){
			hql.append(" and ts.remindTime >= '"+time_star+"'");
		}
		if(time_end != null && !"".equals(time_end.trim())){
			hql.append(" and ts.remindTime <= '"+time_end+" 23:59:59'");
		}
		
		hql.append(" order by ts.remindTime desc");
		Query query = getSession().createQuery(hql.toString()).setFirstResult((page - 1) * size ).setMaxResults(size);
		List<Task> list = query.list();
		return list;
	}

	@Override
	public int getPageCount(Integer id, String name, String time_star, String time_end,Integer user_id) {
		StringBuffer hql = new StringBuffer("select count(*) from t_task ts where ts.user_id = "+user_id+" ");
		if(id != null){
			hql.append(" and ts.id <> "+id+"");
		}
		if(name != null && !"".equals(name.trim())){
			hql.append(" and ts.name like '%"+name+"%'");
		}
		if(time_star != null && !"".equals(time_star.trim())){
			hql.append(" and ts.remindTime >= '"+time_star+"'");
		}
		if(time_end != null && !"".equals(time_end.trim())){
			hql.append(" and ts.remindTime <= '"+time_end+" 23:59:59'");
		}
		
		hql.append(" order by ts.remindTime desc");
		List<Object> objs = getSession().createSQLQuery(hql.toString()).list();
		
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		return 0;
	}

	@Override
	public Task save(Task ts) {
		getSession().save(ts);
		return ts;
	}

	@Override
	public Task findById(Integer id) {
		if(id == null ){
			return null;
		}
		StringBuffer hql = new StringBuffer("from Task ts where ts.id = " + id );
		hql.append(" order by ts.remindTime desc");
		Query query = getSession().createQuery(hql.toString());
		List<Task> list = query.list();
		if(list == null || list.size() <= 0){
			return null;
		}
		return list.get(0);
	}

	@Override
	public int update(Task ts) {
		int i = 0;
		try {
			getSession().update(ts);
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

	@Override
	public int deleteById(Integer id) {
		int i = 0;
		try {
			String strUpdate = "delete from t_task where id = " + id;
			SQLQuery qu = getSession().createSQLQuery(strUpdate);
			i = qu.executeUpdate();
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

	@Override
	public List<Object> getListByHandle(Integer user_id, Integer handle) {
		StringBuffer hql = new StringBuffer("select remindTime,handle,count(handle) from t_task ts where ts.user_id = "+user_id+" ");
		if(handle != null){
			hql.append(" and handle = "+handle+"");
		}
		hql.append(" GROUP BY remindTime,handle ORDER BY remindTime ASC");
		
		List<Object> objs = getSession().createSQLQuery(hql.toString()).list();
		
		return objs;
	}

	@Override
	public List<Task> getList(Integer user_id, String datetime,Integer Handle) {
		StringBuffer hql = new StringBuffer("from Task ts where ts.user_id = "+user_id+" ");
		if(datetime != null){
			hql.append(" and ts.remindTime = '"+datetime+"'");
		}
		if(Handle != null){
			hql.append(" and ts.handle = '"+Handle+"'");
		}
		
		hql.append(" order by ts.remindTime desc");
		Query query = getSession().createQuery(hql.toString());
		List<Task> list = query.list();
		return list;
	}
}
