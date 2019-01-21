package com.cxgc.front.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import com.cxgc.front.dao.BaseDao;
import com.cxgc.front.dao.IOADao;



@Repository
public class OADaoImpl  extends BaseDao implements IOADao<Object> {
	
	@Override
	public List<Object> getOAData(Map<String, Object> map) {
		List<String> params = new ArrayList<String>();
		List<Object> values = new ArrayList<Object>();
//		List<String> types = new ArrayList<String>();
//
		StringBuilder hqlBuilder = new StringBuilder();
//
		Integer type = Integer.parseInt(map.get("TYPE").toString()) ;
		String join = map.get("JOIN").toString();
		String select = map.get("SELECT").toString();
		String table = map.get("TABLE").toString();
//		if (join != null) {
//			join = " " + join + " ";
//		} else {
//			join = "";
//		}
		if (8 == type) {
			hqlBuilder.append("select " + select + " from "
					+ table + " a " + join
					+ "where 1=1 ");
		} else if(9 == type) {
			hqlBuilder.append("select count(a) from "
					+ table + " a " + join
					+ "where 1=1 ");
		} else {
		hqlBuilder.append("select distinct a from "
				+ table + " a " + join
				+ "where 1=1 ");
		}
//		String keyTmp = "";
//		String keyType = "";
//		String keyAry[];
//		String pkeyTmp = "";
//		Integer tmpi = null;
//		String tmps = null;
//		Date tmpd = null;
		
//		for (String key : map.keySet()) {
//			keyAry = key.split("_");
//			if (keyAry.length > 1) {
//				keyTmp = keyAry[0].replace("@", ".");
//				pkeyTmp = keyAry[0].replace("@", "");
//				keyType = keyAry[1];
//				if ("i".equals(keyType)) {
//
//					tmpi = DirectiveUtils.getInt(key, map);
//					if (tmpi == null) {
//						continue;
//					}
//					params.add(pkeyTmp);
//					values.add(tmpi);
//					types.add("i");
//				} else if ("s".equals(keyType)) {
//					// query.setParameter(keyTmp,
//					tmps = DirectiveUtils.getString(key, map);
//					if (tmps == null || "".equals(tmps)) {
//						continue;
//					}
//					params.add(pkeyTmp);
//					values.add(tmps);
//					types.add("s");
//				} else if ("d".equals(keyType)) {
//					// query.setParameter(keyTmp,
//					tmpd = DirectiveUtils.getDate(key, map);// ,
//															// TemporalType.DATE);
//					if (tmpd == null) {
//						continue;
//					}
//					params.add(pkeyTmp);
//					values.add(tmpd);
//					types.add("d");
//				} else if ("l".equals(keyType)) {
//					// query.setParameter(keyTmp,
//					tmps = DirectiveUtils.getString(key, map);
//					if (tmps == null || "".equals(tmps)) {
//						continue;
//					}
//					params.add(pkeyTmp);
//					values.add("%" + DirectiveUtils.getString(key, map) + "%");
//					types.add("l");
//
//				}
//
//				if ("l".equals(keyAry[1])) {
//					hqlBuilder.append(" and a." + keyTmp + " like :" + pkeyTmp
//							+ " ");
//
//				} else if ("n".equals(keyAry[1])) {
//					hqlBuilder.append(" and " + keyTmp + " "
//							+ DirectiveUtils.getString(key, map) + "");
//				} else if ("o".equals(keyAry[1])) {
//					hqlBuilder.append(" and ("
//							+ DirectiveUtils.getString(key, map) + ")");
//
//				} else {
//					hqlBuilder.append(" and a." + keyTmp + "= :" + pkeyTmp
//							+ " ");
//				}
//			}
//		}
//
//		String order = DirectiveUtils.getString("order", map);
//		if (order != null) {
//			hqlBuilder.append(" order by " + order);
//		}
//
//		Query query = em.createQuery(hqlBuilder.toString());
		
		ArrayList<String[]> lt = (ArrayList<String[]>)map.get("WHERE");
		for(int i =0;i<lt.size();i++){
			String[] t = lt.get(i);
			if("in".equals(t[1])){
				hqlBuilder.append(" and "+ t[0] + " " + t[1] +" "+ t[2]);
			}else{
				hqlBuilder.append(" and "+ t[0] + " " + t[1] +" :"+ t[0]);
				params.add(t[0]);
				values.add(t[2]);
			}
			
		}
		
		Query query = getSession().createQuery(hqlBuilder.toString());
		
		
		for (int i = 0; i < params.size(); i++) {
//			if ("d".equals(types.get(i))) {
//				query.setParameter(params.get(i), (Date) values.get(i),
//						TemporalType.DATE);
//			} else if (!"n".equals(types.get(i))) {
				query.setParameter(params.get(i), values.get(i));
//			}
		}
//
//		Integer sp = DirectiveUtils.getInt("STARTPOSITION", map);
//		Integer mr = DirectiveUtils.getInt("MAXRESULT", map);
//		if (sp != null) {
//			query.setFirstResult(sp);
//		}
//		if (mr != null) {
//			query.setMaxResults(mr);
//		}
//
//		if (type != null && type == 10) {
//			List<Object[]> tmp = query.getResultList();
//
//			List<Gauge> retTmp = new ArrayList<Gauge>();
//			for (Object[] o : tmp) {
//				Gauge g = (Gauge) o[0];
//				Gaugedata gd = (Gaugedata) o[1];
//				g.setGaugedata(new ArrayList<Gaugedata>());
//				if (gd != null) {
//					g.addGaugedata(gd);
//				}
//				retTmp.add(g);
//			}
//			return (List<T>) retTmp;
//		} else {
//			return query.getResultList();
//		}
		
		return query.list();
	}
 
	@Override
	public int do_update(String sql) {
		try {SQLQuery query = getSession().createSQLQuery(sql);
		return query.executeUpdate();
		} catch (Exception e) {
			return -1;
		}
		
	}

	@Override
	public List do_sql(String sql) {
		SQLQuery query = getSession().createSQLQuery(sql);
		return query.list();
	}

}
