package com.tb.service;

import java.util.List;

import com.tb.domain.VoteOption;

public interface VoteOptionService {
	Integer deleteById(int id);	
	
	Integer deleteByThemeId(int themeId);	
	
	Integer deleteByQuizId(int quizId);

	VoteOption findById(int id);
	
	VoteOption findByThemeQuizAndIndex(int themeId, int quizId, int index);

	Integer updateVoteOption(VoteOption voteOption);

	Integer insertVoteOption(VoteOption voteOption);     	
	
	List<VoteOption> getVoteOptionListByThemeId(int themeId, int optionIndex); 
	
	List<VoteOption> getVoteOptionListByQuizId(int quizId);
 
}
