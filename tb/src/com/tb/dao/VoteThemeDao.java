package com.tb.dao;

import java.util.List;

import com.tb.domain.VoteTheme;

public interface VoteThemeDao {	

	Integer deleteById(int id);	

	VoteTheme findById(int id);

	Integer updateVoteTheme(VoteTheme voteTheme);

	Integer insertVoteTheme(VoteTheme voteTheme);	

	List<VoteTheme> getVoteThemeList(int begin, int offset);
	
	VoteTheme getPublishedVoteTheme();
	
	List<VoteTheme> getClosedVoteThemeList(int begin, int offset);

	Integer getTotalNum(int status);	
}
