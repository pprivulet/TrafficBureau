package com.tb.dao.impl;

import java.util.HashMap;
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

	// @Override
	// public PageBean findEntryByCondition(Map<String, Object> condition) {
	// condition.put("listSqlMap", "news.findBaseByCondition");
	// condition.put("countSqlMap", "news.findDataCount");
	// return super.findPageBean(condition);
	// }

	@Override
	public List<Entry> getLastEntries(int number, int category, int importance) {
		Map<String, Integer> params = new HashMap<String, Integer>();
		//params.put("begin", 0);
		params.put("limit", number);
		params.put("category", category);
		//System.out.println("importnance: "+importance);
		if(importance > -1){
			params.put("importance", importance);
		}
		//System.out.println(params);
		return super.getList("entries.getLastEntries", params);
	}

	@Override
	public List<Entry> getEntryList(int begin, int offset, int category) {
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("begin", begin);
		params.put("offset", offset);
		params.put("category", category);
		return super.getList("entries.getList", params);
	}

	@Override
	public Integer getTotalNum(int category){
		Map<String, Integer> params = new HashMap<String, Integer>();		
		params.put("category", category);
		Integer count = (Integer) findOtherType("entries.findDataCount", params);
		return count;
	}
	
	@Override
	public List<Entry> getPublishedEntryList(int begin, int offset, int category) {
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("begin", begin);
		params.put("offset", offset);
		params.put("category", category);
		return super.getList("entries.getPublishedList", params);
	}
	
	@Override
	public List<Entry> searchEntries(String title){
		Map<String, String> params = new HashMap<String, String>();
		params.put("title", title);
		return super.getSearchResult("entries.search", params);
	}
}
