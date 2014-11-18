package com.tb.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tb.dao.BaseDao;
import com.tb.dao.VoteOptionDao;
import com.tb.domain.VoteOption;


public class VoteOptionDaoImpl extends BaseDao<VoteOption> implements VoteOptionDao {
	@Override
	protected Class getEntityClass() {
		return VoteOption.class;
	}

	@Override
	public Integer deleteById(int id) {
		return super.delete("voteoptions.deleteByPrimaryKey", id);
	}

	@Override
	public Integer deleteByThemeId(int themeId){
		return super.delete("voteoptions.deleteByThemeId", themeId);
	}
	
	@Override
	public Integer deleteByQuizId(int quizId){
		return super.delete("voteoptions.deleteByQuizId", quizId);
	}
		
	@Override
	public VoteOption findById(int id) {
		return super.findById("voteoptions.selectByPrimaryKey", id);
	}

	
	@Override
	public VoteOption findByThemeQuizAndIndex(int themeId, int quizId, int index){
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("themeId", themeId);
		params.put("quizId", quizId);
		params.put("index", index);
		return super.findByOther("voteoptions.selectByThemeQuizAndIndex", params);
	}
	
	@Override
	public Integer updateVoteOption(VoteOption voteOption) {
		return super.update("voteoptions.updateByPrimaryKey", voteOption);
	}

	@Override
	public Integer insertVoteOption(VoteOption voteOption) {
		return super.insert("voteoptions.insert", voteOption);
	}

	@Override
	public List<VoteOption> getOptionVoteListByTheme(int themeId, int optionIndex) {
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("themeId", themeId);	
		if(optionIndex<0){
			return super.getList("voteoptions.getListByTheme", params);			
		}
		params.put("index", optionIndex);	
		return super.getList("voteoptions.getListByThemeAndIndex", params);
	}

	@Override
	public List<VoteOption> getOptionVoteListByQuiz(int quizId) {
		Map<String, Integer> params = new HashMap<String, Integer>();		
		params.put("quizId", quizId);			
		return super.getList("voteoptions.getListByQuiz", params);
	}
}
