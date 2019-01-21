package com.cxgc.front.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.UserDao;
import com.cxgc.front.model.User;
import com.cxgc.front.util.DateUtils;

@Repository
public class UserDaoImpl extends BaseDao implements UserDao {
	
	@Override
	public List<Object[]> loginCheck(String username, String password) {
		try { 
			StringBuffer hql = new StringBuffer("from User bean"
					+ " left join bean.organization org"
					+ " left join bean.role rol"
					+ " where bean.username = '" + username + "'"
					+ " and bean.password = '" + password + "'"
					+ " order by bean.id asc");
			Query query = getSession().createQuery(hql.toString());
			List<Object[]> list = query.list();
			return list;
		} catch (RuntimeException re) {
			return null;
		}
	}
	
	@Override
	public List<Object[]> search(String username, Long organizationid, Long roleid) {
		try { 
			StringBuffer hql = new StringBuffer("from User bean left join bean.organization org left join bean.role rol where 1=1");
			if(username != null && !"请输入用户名".equals(username) && !"".equals(username)){
				hql.append(" and bean.username like '%" + username + "%'");
			}
			if(organizationid != null){
				hql.append(" and bean.organization.id = " + organizationid);
			}
			if(roleid != null){
				hql.append(" and bean.role.id = " + roleid);
			}
			hql.append(" order by bean.id asc");
			Query query = getSession().createQuery(hql.toString());
			List<Object[]> list = query.list();
			return list;
		} catch (RuntimeException re) {
			return null;
		}
	}

	@Override
	public List<Object[]> page(String s_username,String s_description,String s_IDNumber,String s_sex, Long organizationid, Long roleid, 
			int pageNumStart, int pageRecord) {
		try { 
			StringBuffer hql = new StringBuffer("from User bean left join bean.organization org left join bean.role rol where 1=1");
			if(s_username != null && !"请输入用户名".equals(s_username) && !"".equals(s_username)){
				hql.append(" and bean.username like '%" + s_username + "%'");
			}
			if(s_description != null && !"".equals(s_description)){
				hql.append(" and bean.description like '%" + s_description + "%'");
			}
			if(s_IDNumber != null && !"".equals(s_IDNumber)){
				hql.append(" and bean.IDNumber like '%" + s_IDNumber + "%'");
			}
			if(s_sex != null && !"".equals(s_sex)){
				hql.append(" and bean.sex = " + s_sex + "");
			}
			if(organizationid != null){
				hql.append(" and bean.organization.id = " + organizationid);
			}
			if(roleid != null){
				hql.append(" and bean.role.id = " + roleid);
			}
			hql.append(" order by bean.id asc");
			Query query = getSession().createQuery(hql.toString()).setFirstResult((pageNumStart - 1) * pageRecord ).setMaxResults(pageRecord);
			//Query query = getSession().createQuery(hql.toString()).setFirstResult(pageNumStart).setMaxResults(pageRecord);
			List<Object[]> list = query.list();
			return list;
		} catch (RuntimeException re) {
			return null;
		}
	}

	@Override
	public List<Object[]> findAll() {
		try { 
			StringBuffer hql = new StringBuffer("from User bean left join bean.organization org left join bean.role rol where 1=1");
			hql.append(" order by bean.id asc");
			Query query = getSession().createQuery(hql.toString());
			List<Object[]> list = query.list();
			return list;
		} catch (RuntimeException re) {
			return null;
		}
	}
	
	@Override
	public User findById(Integer id) {
		
		if(id == null ){
			return null;
		}
		StringBuffer hql = new StringBuffer("from User en where en.id = " + id );
		Query query = getSession().createQuery(hql.toString());
		List<User> list = query.list();
		if(list == null || list.size() <= 0){
			return null;
		}
		return list.get(0);
	}

	@Override
	public int deleteById(Long id) {
		int i = 0;
		try {
			String strUpdate = "delete from t_user where id = " + id;
			SQLQuery qu = getSession().createSQLQuery(strUpdate);
			i = qu.executeUpdate();
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

	@Override
	public int update(Long id, String description, String email, Boolean enabled, 
			Integer issystemaccount, Date lastlogin, String password, String telephone, 
			String username, Long organization, Long role) {
		int i = 0;
		try {
			String strUpdate = "update t_user set";
			if (description != null) {
				strUpdate = strUpdate +" description = '" + description + "',";
			}
			if (email != null) {
				strUpdate = strUpdate +" email = '" + email + "',";
			}
			if (enabled != null && !"".equals(enabled)) {
				if (enabled) {
					strUpdate = strUpdate +" enabled = 1,";
				} else {
					strUpdate = strUpdate +" enabled = 0,";
				}
			}
			if (issystemaccount != null && !"".equals(issystemaccount)) {
				strUpdate = strUpdate +" is_system_account = " + issystemaccount + ",";
			}
			if (lastlogin != null && !"".equals(lastlogin)) {
				strUpdate = strUpdate +" last_login = '" 
						+ DateUtils.getDate2Str7(lastlogin) + "',";
			}
			if (password != null && !"".equals(password)) {
				strUpdate = strUpdate +" password = '" + password + "',";
			}
			if (telephone != null && !"".equals(telephone)) {
				strUpdate = strUpdate +" telephone = '" + telephone + "',";
			}
			if (username != null && !"".equals(username)) {
				strUpdate = strUpdate +" username = '" + username + "',";
			}
			if (organization != null && !"".equals(organization)) {
				strUpdate = strUpdate +" organization_id = " + organization + ",";
			}
			if (role != null && !"".equals(role)) {
				strUpdate = strUpdate +" role_id = " + role + ",";
			}
			strUpdate = strUpdate.substring(0, strUpdate.length() - 1);
			strUpdate = strUpdate + " where id = " + id;
			SQLQuery qu = getSession().createSQLQuery(strUpdate);
			i = qu.executeUpdate();
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

	@Override
	public List<User> getList(String username, String IDNumber,Long id) {
		StringBuilder sqlBuilder = new StringBuilder();
		sqlBuilder.append("from User u where 1=1 ");
		if(username != null && !"".equals(username.trim()) ){
			sqlBuilder.append(" and u.username = '" + username + "'");	
		}
		if(IDNumber != null && !"".equals(IDNumber.trim()) ){
			sqlBuilder.append(" and u.IDNumber = '" + IDNumber + "'");	
		}
		if(id>0){
			sqlBuilder.append(" and u.id <> " + id + "");	
		}
		sqlBuilder.append(" order by u.id asc");
		
		Query query = getSession().createQuery(sqlBuilder.toString());
		List<User> user = query.list();
		
		return user;
	}
	
	@Override
	public User save(User user) {
		getSession().save(user);
		//Integer count = Integer.parseInt(n.toString());
		return user;
	}
	
	@Override
	public int update(User user) {
		int i = 0;
		try {
			getSession().update(user);
		} catch (RuntimeException re) {
			i = -1;
		}
		return i;
	}

	@Override
	public User getUserById(Long id) {
		if(id == null ){
			return null;
		}
		StringBuffer hql = new StringBuffer("from User u where u.id = " + id );
		hql.append(" order by u.id desc");
		Query query = getSession().createQuery(hql.toString());
		List<User> list = query.list();
		if(list == null || list.size() <= 0){
			return null;
		}
		return list.get(0);
	}

	@Override
	public List<User> getListByPage(String description, String username, String IDNumber, Integer sex, String telephone,
			Integer roleid, Integer organizationid, int page, int size) {
		
		StringBuffer hql = new StringBuffer("from User en where 1=1 ");
		
		if(description!=null && !"".equals(description.trim())){
			hql.append(" and en.description like '%"+description+"%'");
		}
		
		if(username!=null && !"".equals(username.trim())){
			hql.append(" and en.username like '%"+username+"%'");
		}
		
		if(IDNumber!=null && !"".equals(IDNumber.trim())){
			hql.append(" and en.IDNumber like '%"+IDNumber+"%'");
		}
		
		if(sex!=null){
			hql.append(" and en.sex.id='"+sex+"'");
		}
		
		if(telephone!=null && !"".equals(telephone.trim())){
			hql.append(" and en.telephone like '%"+telephone+"%'");
		}
		
		if(roleid != null){
			hql.append(" and en.role.id = " + roleid);
		}
		
		if(organizationid != null){
			hql.append(" and en.organization.id = " + organizationid);
		}
		
		Query query = getSession().createQuery(hql.toString()).setFirstResult((page - 1) * size ).setMaxResults(size);
		List<User> list = query.list();
		return list;
	}

	@Override
	public int getPageCount(String description, String username, String IDNumber, Integer sex, String telephone,
			Integer roleid, Integer organizationid) {
		
		StringBuilder hql = new StringBuilder();
		hql.append("select count(en.id) from t_user en  where 1=1 ");
		
		if(description!=null && !"".equals(description.trim())){
			hql.append(" and en.description like '%"+description+"%'");
		}
		
		if(username!=null && !"".equals(username.trim())){
			hql.append(" and en.username like '%"+username+"%'");
		}
		
		if(IDNumber!=null && !"".equals(IDNumber.trim())){
			hql.append(" and en.IDNumber like '%"+IDNumber+"%'");
		}
		
		if(sex!=null){
			hql.append(" and (select id from t_dictionary where id=en.id ) = '%"+sex+"%'");
		}
		
		if(telephone!=null && !"".equals(telephone.trim())){
			hql.append(" and en.telephone like '%"+telephone+"%'");
		}
		
		if(roleid!=null){
			hql.append(" and (select id from role where id=en.id ) = '%"+roleid+"%'");
		}
		
		if(organizationid!=null){
			hql.append(" and (select id from t_organization where id=en.id ) = '%"+organizationid+"%'");
		}
		
		List<Object> objs = getSession().createSQLQuery(hql.toString()).list();
		
		if(objs != null && objs.size() > 0){
			return objs.get(0) == null ? 0 : Integer.parseInt(String.valueOf(objs.get(0)));
		}
		
		return 0;
	}

	@Override
	public List<User> getListByOrganizational(Integer organizationid) {
		
		StringBuilder sqlBuilder = new StringBuilder();
		
		sqlBuilder.append("from User u where 1=1 ");
		
		if (organizationid != null) {
			sqlBuilder.append(" and u.organization.id = '" + organizationid + "'");	
		}
		
		Query query = getSession().createQuery(sqlBuilder.toString());
		List<User> user = query.list();
		
		return user;
	}
}
