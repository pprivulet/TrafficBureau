package com.tb.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tb.dao.BaseDao;
import com.tb.dao.VoteQuizDao;
import com.tb.domain.VoteQuiz;

@Repository
public class VoteQuizDaoImpl extends BaseDao<VoteQuiz> implements VoteQuizDao {

	@Override
	protected Class getEntityClass() {
		return VoteQuiz.class;
	}

	@Override
	public Integer deleteById(int id) {
		return super.delete("votequizzes.deleteByPrimaryKey", id);
	}

	@Override
	public Integer deleteByThemeId(int themeId){
		return super.delete("votequizzes.deleteByThemeId", themeId);
	}
		
	@Override
	public VoteQuiz findById(int id) {
		return super.findById("votequizzes.selectByPrimaryKey", id);
	}

	@Override
	public Integer updateVoteQuiz(VoteQuiz Votequiz) {
		return super.update("votequizzes.updateByPrimaryKey", Votequiz);
	}

	@Override
	public Integer insertVoteQuiz(VoteQuiz Votequiz) {
		return super.insert("votequizzes.insert", Votequiz);
	}

	@Override
	public List<VoteQuiz> getVoteQuizListByThemeId(int themeId) {
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("themeId", themeId);		
		return super.getList("votequizzes.getList", params);
	}

	@Override
	public Integer getTotalNum(int status) {
		Map<String, Integer> params = new HashMap<String, Integer>();
		if(status > 0)params.put("status", status);
		Integer count = (Integer) findOtherType("votequizzes.findDataCount", params);
		return count;
	}
}
