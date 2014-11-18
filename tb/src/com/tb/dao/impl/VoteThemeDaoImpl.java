package com.tb.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tb.dao.BaseDao;
import com.tb.dao.VoteThemeDao;
import com.tb.domain.VoteTheme;

@Repository
public class VoteThemeDaoImpl extends BaseDao<VoteTheme> implements VoteThemeDao{
	@Override
	protected Class getEntityClass() {
		return VoteTheme.class;
	}	

	@Override
	public Integer deleteById(int id) {
		return super.delete("votethemes.deleteByPrimaryKey", id);
	}
	

	@Override
	public VoteTheme findById(int id) {
		return super.findById("votethemes.selectByPrimaryKey", id);
	}

	@Override
	public Integer updateVoteTheme(VoteTheme voteTheme) {
		return super.update("votethemes.updateByPrimaryKey", voteTheme);
	}

	@Override
	public Integer insertVoteTheme(VoteTheme voteTheme) {
		return super.insert("votethemes.insert", voteTheme);
	}	
	
	@Override
	public List<VoteTheme> getVoteThemeList(int begin, int offset) {
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("begin", begin);
		params.put("offset", offset);		
		return super.getList("votethemes.getList", params);
	}

	@Override
	public Integer getTotalNum(int status){
		Map<String, Integer> params = new HashMap<String, Integer>();
		if(status > 0)params.put("status", status);
		Integer count = (Integer) findOtherType("votethemes.findDataCount", params);
		return count;
	}
	
	@Override
	public VoteTheme getPublishedVoteTheme() {
		Map<String, Integer> params = new HashMap<String, Integer>();		
		params.put("status", 1);
		return super.findById("votethemes.findBaseByCondition", params);
	}
	
	@Override
	public List<VoteTheme> getClosedVoteThemeList(int begin, int offset) {
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("begin", begin);
		params.put("offset", offset);		
		return super.getList("votethemes.getClosedList", params);
	}
	
}
