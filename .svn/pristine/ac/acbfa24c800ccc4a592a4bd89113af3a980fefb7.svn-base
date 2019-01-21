package com.cxgc.front.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.cxgc.front.model.GuestbookCase;

public interface GuestbookCaseDao {

	/** 保存
	 * @param obj
	 * @return
	 */
	public int saveCase(GuestbookCase obj );
	 
	/**删除
	 * @param obj
	 * @return
	 */
	public int deleteCase(GuestbookCase obj); 
	 
	/**获取关联
	 * @param fid
	 * @param sid
	 * @return
	 */
	public List<GuestbookCase> getCase(DetachedCriteria dc);
	
	
	
}
