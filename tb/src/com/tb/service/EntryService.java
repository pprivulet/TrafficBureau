package com.tb.service;


import java.util.List;
import java.util.Map;

import com.tb.domain.Entry;

public interface EntryService {

	Map<String, Object> findNewsListBackend(Map<String, Object> paramsMap);

	Integer deleteById(int id);

	Integer deleteByIds(String ids);

	Entry findById(int parseInt);

	Integer updateEntry(Entry entry);

	Integer insertEntry(Entry entry);

	Map<String, Object> findNewsByCondition(Map<String, Object> condition);

	List<Entry> getLastEntries();	

}

