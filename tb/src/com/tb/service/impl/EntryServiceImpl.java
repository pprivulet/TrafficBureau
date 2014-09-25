package com.tb.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import com.tb.dao.EntryDao;
//import com.anyuan.common.PageBean;
import com.tb.domain.Entry;
import com.tb.service.EntryService;


@Service("entryService")
public class EntryServiceImpl implements EntryService {
	
	@Autowired
	private EntryDao entryDao;

	@Override
	public Map<String, Object> findNewsListBackend(Map<String, Object> paramsMap) {
		Map<String,Object> map = new HashMap<String,Object>();
		//PageBean pageBean = newsBoService.findNewsListBackend(paramsMap);
		//map.put("pageBean", pageBean);
		return map;
	}

	@Override
	public Integer deleteById(int id) {
		return entryDao.deleteById(id);
	}

	@Override
	public Integer deleteByIds(String ids) {
		return entryDao.deleteByIds(ids);
	}

	@Override
	public Entry findById(int id) {
		return entryDao.findById(id);
	}

	@Override
	public Integer updateEntry(Entry entry) {
		return entryDao.updateEntry(entry);
	}

	@Override
	public Integer insertEntry(Entry entry) {
		return entryDao.insertEntry(entry);
	}

	@Override
	public Map<String, Object> findNewsByCondition(Map<String, Object> condition) {
		Map<String,Object> map = new HashMap<String,Object>();
		//PageBean pageBean =entryDao.findNewsByCondition(condition);
		//map.put("pageBean", pageBean);
		return map;
	}

	@Override
	public List<Entry> getLastEntries() {
		return entryDao.getLastEntries();
	}

}
