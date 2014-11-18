package com.tb.dao;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;


//import com.tb.common.PageBean;
import com.tb.domain.BaseEntity;
import com.ibatis.sqlmap.client.SqlMapClient;

public abstract class BaseDao<E extends BaseEntity> extends
		SqlMapClientDaoSupport implements IDao<E> {

	@SuppressWarnings("unchecked")
	protected abstract Class getEntityClass();

	@Autowired
	@Resource(name = "sqlMapClient")
	public void setSqlMapClientBase(SqlMapClient sqlMapClient) {
		super.setSqlMapClient(sqlMapClient);
	}

	private static String reflect(Object obj, Class clz) {
		StringBuffer sb = new StringBuffer();
		if (null != clz) {
			Field[] fields = clz.getDeclaredFields();
			Field.setAccessible(fields, true);
			try {
				for (int i = 0; i < fields.length; i++) {
					Field field = fields[i];
					try {
						Object val = field.get(obj);
						if (i == 0) {
							sb.append("[");
						}
						if (null != val) {
							/* 不打印部分新闻过长的Log信息 */
							if (!("News".equals(clz.getSimpleName()) && ("content"
									.equals(field.getName())
									|| "topTen".equals(field.getName())
									|| "relatedNews".equals(field.getName()) || "newsSources"
										.equals(field.getName())))) {
								sb.append(" " + field.getName() + "="
										+ val.toString());
								sb.append(",");
							}
						}
						if (i == fields.length - 1) {
							sb.append(" ]");
						}
					} catch (IllegalArgumentException e) {
						e.printStackTrace();
					}
				}

			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (SecurityException e) {
				e.printStackTrace();
			}
		}
		return (null != sb && sb.length() > 0) ? sb.replace(sb.length() - 3,
				sb.length(), " ]").toString() : null;
	}

	private static String reflectToString(Object obj) {
		if (obj instanceof Map) {
			/* 不打印部分新闻过长的Log信息 */
			// Note:Method Reference type Parameter
			Map map = (Map) obj;
			Map mapLocal = new HashMap();
			mapLocal.putAll(map);
			if (mapLocal.keySet().contains("topTen")) {
				mapLocal.remove("topTen");
			}
			if (mapLocal.keySet().contains("newsSources")) {
				mapLocal.remove("newsSources");
			}
			if (mapLocal.keySet().contains("relatedNews")) {
				mapLocal.remove("relatedNews");
			}
			if (mapLocal.keySet().contains("news")) {
				mapLocal.remove("news");
			}
			return mapLocal.toString();
		} else {
			return reflect(obj, null == obj ? null : obj.getClass());
		}
	}

	protected String getDefalutOrderFileds() {
		return null;
	}

	public Integer delete(String statementName, Object parameterObject) {
		try {
			if (parameterObject == null) {
				return (Integer) getSqlMapClientTemplate()
						.delete(statementName);
			} else {
				return (Integer) getSqlMapClientTemplate().delete(
						statementName, parameterObject);
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
			throw new RuntimeException("Delete Error: " + e.getMessage());
		}
	}
		
	@SuppressWarnings("unchecked")
	public List<E> find(String statementName, Object parameterObject) {
		if (parameterObject == null) {
			return getSqlMapClientTemplate().queryForList(statementName);
		} else {
			return getSqlMapClientTemplate().queryForList(statementName,
					encodeParameter(parameterObject));
		}
	}

	@SuppressWarnings("unchecked")
	public E findById(String statementName, Object parameterObject) {
		if (parameterObject == null) {
			return (E) getSqlMapClientTemplate().queryForObject(statementName);
		} else {
			return (E) getSqlMapClientTemplate().queryForObject(statementName,
					parameterObject);
		}
	}

	@SuppressWarnings("unchecked")
	public E findByOther(String statementName, Object parameterObject) {
		if (parameterObject == null) {
			return (E) getSqlMapClientTemplate().queryForObject(statementName);
		} else {
			return (E) getSqlMapClientTemplate().queryForObject(statementName,
					encodeParameter(parameterObject));
		}
	}

	@SuppressWarnings("unchecked")
	public Integer insert(String statementName, Object parameterObject) {
		if (parameterObject == null) {			
			Object obj = getSqlMapClientTemplate().insert(statementName);

			return obj == null ? 1 : (Integer) obj;
		} else {			
			Object obj = getSqlMapClientTemplate().insert(statementName,
					parameterObject);
			return obj == null ? 1 : (Integer) obj;
			// getSqlMapClientTemplate().insert(statementName, parameterObject);
			// return 1l;
		}
	}

	@SuppressWarnings("unchecked")
	public Integer update(String statementName, Object parameterObject) {
		if (parameterObject == null) {
			return getSqlMapClientTemplate().update(statementName);
		} else {
			return getSqlMapClientTemplate().update(statementName,
					parameterObject);
		}
	}
	
	//public Integer  getCount(String statementName, Object parameterObject){
	//	return getSqlMapClientTemplate().update(statementName);
	//}
	
	
	

	public Object findOtherType(String statementName, Object parameterObject) {
		try {
			if (parameterObject == null) {
				return getSqlMapClientTemplate().queryForObject(statementName);
			} else {
				if (parameterObject instanceof Map) {
					return getSqlMapClientTemplate().queryForObject(
							statementName, encodeParameter(parameterObject));
				} else {
					return getSqlMapClientTemplate().queryForObject(
							statementName, parameterObject);
				}
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
			throw new RuntimeException("Delete Error: " + e.getMessage());
		}
	}

	/**
	 * pageIndex ,otherParams from service listSqlMap , countSqlMap
	 * 
	 * @param paramMap
	 * @return
	 */

	/*
	 * @SuppressWarnings("unchecked") public PageBean findPageBean(Map paramMap)
	 * { Integer pageIndex = 1; if (paramMap.get("pageIndex") != null) {
	 * pageIndex = (Integer) paramMap.get("pageIndex"); }
	 * 
	 * PageBean pageBean = new PageBean(pageIndex); if (paramMap.get("pageSize")
	 * != null) { pageBean.setPageSize((Integer) paramMap.get("pageSize")); }
	 * paramMap.put("recordBegin", pageBean.getRecordBegin());
	 * paramMap.put("recordSize", pageBean.getPageSize());
	 * 
	 * List<E> list = find((String) paramMap.get("listSqlMap"), paramMap);
	 * pageBean.setList(list);
	 * 
	 * if (paramMap.get("countSqlMap") != null) { Integer count = (Integer)
	 * findOtherType((String) paramMap.get("countSqlMap"), paramMap);
	 * pageBean.setTotalNum(count); }
	 * 
	 * return pageBean; }
	 */

	@SuppressWarnings("unchecked")
	public List<E> getList(String statementName, Map<String, Integer> params){		
		return getSqlMapClientTemplate().queryForList(statementName, params); 
	}
	
	@SuppressWarnings("unchecked")
	public List<E> getSearchResult(String statementName, Map<String, String> params){		
		return getSqlMapClientTemplate().queryForList(statementName, params); 
	}
	
	@SuppressWarnings("unchecked")
	public List findList(String statementName, Object parameterObject) {
		if (parameterObject == null) {
			return (List) getSqlMapClientTemplate().queryForList(statementName);
		} else {
			return (List) getSqlMapClientTemplate().queryForList(statementName,
					encodeParameter(parameterObject));
		}
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> findMap(String statementName,
			Object parameterObject, String keyProperty, String valueProperty) {
		return getSqlMapClientTemplate().queryForMap(statementName,
				encodeParameter(parameterObject), keyProperty, valueProperty);
	}

	private Object encodeParameter(Object parameterObject) {

		if (parameterObject instanceof String) {
			String strPara = (String) parameterObject;
			if ("".equals(strPara.replaceAll("\\_", ""))) {
				strPara = strPara.replaceAll("\\_", "\\\\_");
			}
			return strPara.replaceAll("\\%", "\\\\%");
		} else if (parameterObject instanceof Map) {
			Map newParameterObj = new HashMap();
			newParameterObj.putAll((Map) parameterObject);

			/*
			 * Set<Entry> entrySet = ((Map) newParameterObj).entrySet(); for
			 * (Iterator<Entry> it = entrySet.iterator(); it.hasNext();) { Entry
			 * entry = it.next(); Object val = entry.getValue(); if (val
			 * instanceof String) { entry.setValue(((String)
			 * val).replaceAll("\\%", "\\\\%")); } }
			 */
			for (Object obj : newParameterObj.keySet()) {
				if (newParameterObj.get(obj) != null
						&& (newParameterObj.get(obj) instanceof String)) {
					String strPara = (String) newParameterObj.get(obj);
					if (!"%Y-%m-%d".equals(strPara) && !"%Y-%m".equals(strPara)) {
						if ("".equals(strPara.replaceAll("\\_", ""))) {
							strPara = strPara.replaceAll("\\_", "\\\\_");
						}
						newParameterObj.put(obj,
								strPara.replaceAll("\\%", "\\\\%"));
					}
				}
			}

			return newParameterObj;
		} else {
			return parameterObject;
		}
	}
	

	
}