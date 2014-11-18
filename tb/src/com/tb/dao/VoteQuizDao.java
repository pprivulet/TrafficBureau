package com.tb.dao;

import java.util.List;

import com.tb.domain.VoteQuiz;

public interface VoteQuizDao {

	Integer deleteById(int id);

	Integer deleteByThemeId(int themeId);

	VoteQuiz findById(int id);

	Integer updateVoteQuiz(VoteQuiz voteQuiz);

	Integer insertVoteQuiz(VoteQuiz voteQuiz);

	List<VoteQuiz> getVoteQuizListByThemeId(int themeId);

	// List<VoteQuiz> getPublishedVoteQuizListByThemeId(int themeId);

	Integer getTotalNum(int status);
}
