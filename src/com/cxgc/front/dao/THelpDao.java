package com.cxgc.front.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.cxgc.front.model.THelp;

/** 帮助类DAO
 * @author Hit_hitdy
 * @time 2018年1月25日
 */
public interface THelpDao {

	/** 根据主键获取帮助信息
	 * @param helpid 帮助信息主键
	 * @return 帮助信息
	 */
	public THelp getHelpById(int helpid);
	
	/** 修改帮助信息
	 * @param obj 帮助信息实体
	 * @return 修改后的帮助信息
	 */
	public THelp mergeTHelp(THelp obj );
	
	/** 保存帮助信息
	 * @param obj 帮助信息实体
	 * @return 操作结果
	 */
	public int saveTHelp(THelp obj );
	
	/** 删除帮助信息
	 * @param obj 帮助信息实体
	 * @return 操作结果
	 */
	public int deleteTHelp(THelp obj); 
	 
	/**根据条件进行搜索
	 * @param pageindex
	 * @param pageNumber
	 * @param dc 条件
	 * @return
	 */
	public List<THelp> getListBySearch(int pageindex,int pageNumber,DetachedCriteria dc);
	
	/** 更新阅读数量
	 * @param helpid 帮助信息id
	 * @return 操作结果
	 */
	public int addReadNum(int helpid);
	
	/** 返回总数
	 * @param sql
	 * @return
	 */
	public int getcount(String sql);
	
}
