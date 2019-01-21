package com.cxgc.front.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.cxgc.front.model.TAttendanceLog;

public interface LogDao {

	
	/** 添加日志
	 * @param log
	 * @return
	 */
	public int savelog(TAttendanceLog log);
	
	/** 根据分页返回实体列表
	 * @param pagenumber  当前页码
	 * @param pageCount  每页数量
	 * @param dc 查询条件
	 * @return 数据列表
	 */
	public List<TAttendanceLog> getList(int pagenumber,int pageCount,DetachedCriteria dc);
	
}
