package com.cxgc.front.service;

import java.util.List;

import com.cxgc.front.model.THelp;

/**
 * @author Hit_hitdy
 * @time 2018年1月25日
 */
public interface THelpService {

	
	
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
	
	/** 根据类型返回帮助信息结果列表
	 * @param pageindex 当前页码
	 * @param pageNumber 每页数量
	 * @param type 类型
	 * @order 倒叙排列
	 * @return 信息结果列表
	 */
	public List<THelp> getTHelpByTypeDesc(int pageindex,int pageNumber,String[] type,String title,String cont);
	
	/** 常用问题列表
	 * @param pageindex 页码
	 * @param pageNumber 每页数量
	 * @order 倒叙排列
	 * @return 常用问题列表
	 */
	public List<THelp> getHelpByHotDesc(int pageindex,int pageNumber);
	
	/** 更新阅读数量
	 * @param helpid 帮助信息id
	 * @return 操作结果
	 */
	public int addReadNum(int helpid);
	
	public int getcount(String sql);
	
	
}
