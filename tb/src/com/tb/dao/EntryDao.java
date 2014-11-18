package com.tb.dao;

import java.util.List;

//import com.tb.common.PageBean;
import com.tb.domain.Entry;



public interface EntryDao {

	// PageBean findNewsListBackend(Map<String, Object> paramsMap);

	Integer deleteById(int id);

	Integer deleteByIds(String ids);

	Entry findById(int id);

	Integer updateEntry(Entry entry);

	Integer insertEntry(Entry entry);

	// PageBean findNewsByCondition(Map<String, Object> condition);

	List<Entry> getLastEntries(int number, int category, int importance);
	
	List<Entry> searchEntries(String title);

	List<Entry> getEntryList(int begin, int offset, int category);
	
	List<Entry> getPublishedEntryList(int begin, int offset, int category);

	Integer getTotalNum(int category);	

}
