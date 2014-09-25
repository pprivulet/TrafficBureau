package com.tb.dao;

import java.util.List;
import java.util.Map;

//import com.tb.common.PageBean;
import com.tb.domain.Entry;;

public interface EntryDao {

	//PageBean findNewsListBackend(Map<String, Object> paramsMap);

	Integer deleteById(int id);

	Integer deleteByIds(String ids);

	Entry findById(int id);

	Integer updateEntry(Entry entry);

	Integer insertEntry(Entry entry);

	//PageBean findNewsByCondition(Map<String, Object> condition);

	List<Entry> getLastEntries();

}

