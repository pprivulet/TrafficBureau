package com.tb.service;

import java.util.List;

import com.tb.domain.VoteQuiz;

public interface VoteQuizService {
	Integer deleteById(int id);	
	
	Integer deleteByThemeId(int themeId);	

	VoteQuiz findById(int id);

	Integer updateVoteQuiz(VoteQuiz voteQuiz);

	Integer insertVoteQuiz(VoteQuiz voteQuiz);     	
		
	List<VoteQuiz> getVoteQuizListByThemeId(int themeId);
}
