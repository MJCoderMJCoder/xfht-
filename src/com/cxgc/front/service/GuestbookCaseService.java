package com.cxgc.front.service;

import java.util.List;

import com.cxgc.front.model.GuestbookCase;

public interface GuestbookCaseService {
 
	  
	/** 保存
	 * @param obj
	 * @return
	 */
	public int saveCase(GuestbookCase obj );
	 
	 
	/** 删除关联审核失败的时候使用,删除主关联（fid!=0&&sid==0）||删除子关联（fid==0&&sid!=0 ）
	 * @param fid 关联主ID  
	 * @param sid 关联副ID 
	 * @return 操作成功返回操作数量，失败返回0
	 */
	public int deleteCasels(Integer fid, Integer sid); 
	
	
	
	/**删除单个关联；关联时候用
	 * @param obj
	 * @return
	 */
	public int deleteCase(GuestbookCase obj); 
	
	 
	/**获取关联
	 * @param fid
	 * @param sid
	 * @return
	 */
	public List<GuestbookCase> getCase(Integer fid, Integer sid);
	
	
	
}
