package com.tb.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tb.dao.BaseDao;
import com.tb.dao.PhileDao;
import com.tb.domain.Phile;

@Repository
public class PhileDaoImpl extends BaseDao<Phile> implements PhileDao {

	@Override
	protected Class getEntityClass() {
		return Phile.class;
	}

	@Override
	public Integer insertPhile(Phile file) {
		return super.insert("files.insert", file);
	}

	@Override
	public Integer deletePhile(int id) {
		return super.delete("files.deleteByPrimaryKey", id);
	}

	@Override
	public Phile findPhileByID(int id) {
		return super.findByOther("files.selectByPrimaryKey", id);
	}

	@Override
	public Phile findPhileByEntryID(int entryId) {
		return super.findByOther("files.selectByEntryId", entryId);
	}

	@Override
	public Integer updatePhile(Phile file) {
		return super.update("files.updateByPrimaryKey", file);
	}

	@Override
	public List<Phile> findPhileByStatus(int category, int status) {
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("category", category);
		params.put("status", status);		
		return super.getList("files.getList", params);
	}

	@Override
	public Integer getTotalNum(int category, int status){
		Map<String, Integer> params = new HashMap<String, Integer>();		
		params.put("category", category);
		params.put("status", status);
		Integer count = (Integer) findOtherType("files.findDataCount", params);
		return count;
	}
	
	
	@Override
	public List<Phile> getSildeList(int category, int number){
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("category", category);
		params.put("limit", number);		
		return super.getList("files.getSlideList", params);
	}
}
