package com.tb.service;

import java.util.List;

import com.tb.domain.VoteTheme;


public interface VoteThemeService {

	Integer deleteById(int id);	

	VoteTheme findById(int id);

	Integer updateVoteTheme(VoteTheme voteTheme);

	Integer insertVoteTheme(VoteTheme voteTheme);     	
	
	List<VoteTheme> getVoteThemeList(int begin, int offset);
	
	List<VoteTheme> getClosedVoteThemeList(int begin, int offset);
	
	VoteTheme getPublishedVoteTheme();
	 
    Integer getVoteThemeNum();
    
    Integer getClosedVoteThemeNum();
}
