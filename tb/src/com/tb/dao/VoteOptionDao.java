package com.tb.dao;

import java.util.List;

import com.tb.domain.VoteOption;

public interface VoteOptionDao {
	Integer deleteById(int id);
	
	Integer deleteByThemeId(int themeId);
	
	Integer deleteByQuizId(int quizId);
	
	VoteOption findById(int id);
	
	VoteOption findByThemeQuizAndIndex(int themeId, int quizId, int index);

	Integer updateVoteOption(VoteOption voteOption);

	Integer insertVoteOption(VoteOption VoteOption);	

	List<VoteOption> getOptionVoteListByTheme(int themeId, int optionIndex);	
	
	List<VoteOption> getOptionVoteListByQuiz(int quizId);	
	
}
