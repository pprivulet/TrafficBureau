package com.tb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tb.dao.VoteQuizDao;
import com.tb.domain.VoteQuiz;
import com.tb.service.VoteQuizService;

@Service("voteQuizService")
public class VoteQuizServiceImpl implements VoteQuizService{

	@Autowired
	private VoteQuizDao voteQuizDao;
	
	@Override
	public Integer deleteById(int id) {
		// TODO Auto-generated method stub
		return voteQuizDao.deleteById(id);
	}

	@Override
	public Integer deleteByThemeId(int themeId) {
		// TODO Auto-generated method stub
		
		return voteQuizDao.deleteByThemeId(themeId);
	}

	@Override
	public VoteQuiz findById(int id) {
		// TODO Auto-generated method stub
		return voteQuizDao.findById(id);
	}

	@Override
	public Integer updateVoteQuiz(VoteQuiz voteQuiz) {
		// TODO Auto-generated method stub
		return voteQuizDao.updateVoteQuiz(voteQuiz);
	}

	@Override
	public Integer insertVoteQuiz(VoteQuiz voteQuiz) {
		// TODO Auto-generated method stub
		return voteQuizDao.insertVoteQuiz(voteQuiz);
	}

	@Override
	public List<VoteQuiz> getVoteQuizListByThemeId(int themeId) {
		// TODO Auto-generated method stub
		return voteQuizDao.getVoteQuizListByThemeId(themeId);
	}
	
}
