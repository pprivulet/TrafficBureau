package com.tb.dao.impl;



import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

//import com.tb.common.PageBean;
import com.tb.dao.BaseDao;
import com.tb.dao.EntryDao;
import com.tb.domain.Entry;

@Repository
public class EntryDaoImpl extends BaseDao<Entry> implements EntryDao {

	@Override
	protected Class getEntityClass() {
		return Entry.class;
	}

	//@Override
	//public PageBean findNewsListBackend(Map<String, Object> paramsMap) {
	//	paramsMap.put("listSqlMap", "news.findBaseByCondition");
	//	paramsMap.put("countSqlMap", "news.findDataCount");
	//	return super.findPageBean(paramsMap);
	//}

	@Override
	public Integer deleteById(int id) {
		return super.delete("entries.deleteByPrimaryKey", id);
	}

	@Override
	public Integer deleteByIds(String ids) {
		return super.delete("entries.deleteByIds", ids);
	}

	@Override
	public Entry findById(int id) {
		return super.findById("entries.selectByPrimaryKey", id);
	}

	@Override
	public Integer updateEntry(Entry entry) {
		return super.update("entries.updateByPrimaryKeySelective", entry);
	}

	@Override
	public Integer insertEntry(Entry entry) {
		return super.insert("entries.insert", entry);
	}

	//@Override
	//public PageBean findEntryByCondition(Map<String, Object> condition) {
	//	condition.put("listSqlMap", "news.findBaseByCondition");
	//	condition.put("countSqlMap", "news.findDataCount");
	//	return super.findPageBean(condition);
	//}

	@Override
	public List<Entry> getLastEntries() {
		return super.find("entries.getLastEntries", null);
	}

}

