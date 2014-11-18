package com.tb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tb.dao.VoteOptionDao;
import com.tb.domain.VoteOption;
import com.tb.service.VoteOptionService;

@Service("voteOptionService")
public class VoteOptionServiceImpl implements VoteOptionService{
	@Autowired
	private VoteOptionDao voteOptionDao;

	@Override
	public Integer deleteById(int id) {
		// TODO Auto-generated method stub
		return voteOptionDao.deleteById(id);
	}

	@Override
	public Integer deleteByThemeId(int themeId) {
		// TODO Auto-generated method stub
		return voteOptionDao.deleteByThemeId(themeId);
	}

	@Override
	public Integer deleteByQuizId(int quizId) {
		// TODO Auto-generated method stub
		return voteOptionDao.deleteByQuizId(quizId);
	}

	@Override
	public VoteOption findById(int id) {
		// TODO Auto-generated method stub
		return voteOptionDao.findById(id);
	}

	@Override
	public Integer updateVoteOption(VoteOption voteOption) {
		// TODO Auto-generated method stub
		return voteOptionDao.updateVoteOption(voteOption);
	}

	@Override
	public Integer insertVoteOption(VoteOption voteOption) {
		// TODO Auto-generated method stub
		return voteOptionDao.insertVoteOption(voteOption);
	}

	@Override
	public List<VoteOption> getVoteOptionListByQuizId(int quizId) {
		// TODO Auto-generated method stub
		return voteOptionDao.getOptionVoteListByQuiz(quizId);
	}

	@Override
	public List<VoteOption> getVoteOptionListByThemeId(int themeId,int optionIndex) {
		// TODO Auto-generated method stub
		return voteOptionDao.getOptionVoteListByTheme(themeId, optionIndex);
	}

	@Override
	public VoteOption findByThemeQuizAndIndex(int themeId, int quizId, int index) {
		// TODO Auto-generated method stub
		return voteOptionDao.findByThemeQuizAndIndex(themeId, quizId, index);
	}
	
	
}
