package com.cxgc.front.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cxgc.front.dao.OperationLogDao;
import com.cxgc.front.dao.UserDao;
import com.cxgc.front.model.OperationLog;
import com.cxgc.front.model.User;
import com.cxgc.front.service.OperationLogService;

@Service
@Transactional
public class OperationLogServiceImpl<T> implements OperationLogService<T> {

	@Autowired
	private OperationLogDao<T> dao;
	

	@Autowired
	private UserDao udao;
	
	@Override
	public List<OperationLog> getListByPage(String s_uName, String s_category, String s_classification, int page,
			int size) {
		return dao.getListByPage(s_uName,s_category,s_classification, page, size);
	}

	@Override
	public int getPageCount(String s_uName, String s_category, String s_classification) {
		return dao.getPageCount(s_uName,s_category,s_classification);
	}

	@Override
	public Integer save(OperationLog Operation) {
		return dao.save(Operation);
	}

	@Override
	public int deleteById(Integer id) {
		return dao.deleteById(id);
	}
	/*
	 * modular保管柜编号
	 * submodule物品编号
	 * category操作项（例：新增用户、修改用户、删除用户等）
	 * classification分类(0登录日志，1操作日志，2错误日志)
	 * Describes描述
	*/
	@Override
	public Integer Save_Log(HttpServletRequest request, HttpSession session,String category,String classification,String Describes,String modular,String submodule){
		int i=0;
		try {
			OperationLog Operations = new OperationLog();
			if(session != null){
				/*Operations.setModular(modular);
				Operations.setSubmodule(submodule);*/
				Operations.setCategory(category);
				if(classification.equals("0")){
					Operations.setClassification("登录日志");
				}else if(classification.equals("1")){
					Operations.setClassification("操作日志");
				}else if(classification.equals("2")){
					Operations.setClassification("错误日志");
				}
				Operations.setModifyTime(new Date());
				Operations.setIp(request.getRemoteAddr());
				/*Operations.setuId(Integer.parseInt(session.getAttribute("userid").toString()));
				Operations.setuName(session.getAttribute("username").toString());*/
				//Long userid=session.getAttribute("userid") != null && !"".equals(session.getAttribute("userid").toString().trim()) ? Long.parseLong(session.getAttribute("userid").toString()) : null;
				//User user = udao.getUserById(userid);
				User user = session.getAttribute("user") != null ? (User)session.getAttribute("user") : null;
				Operations.setUserId(user);
				Operations.setDescribes(Describes);
				Operations.setModular(modular);
				Operations.setSubmodule(submodule);
				i=save(Operations);
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
}
