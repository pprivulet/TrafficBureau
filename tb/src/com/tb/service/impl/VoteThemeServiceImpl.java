package com.tb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tb.service.VoteThemeService;
import com.tb.dao.VoteThemeDao;
import com.tb.domain.VoteTheme;

@Service("voteThemeService")
public class VoteThemeServiceImpl implements VoteThemeService{

	
	@Autowired
	private VoteThemeDao voteThemeDao;
	
	@Override
	public Integer deleteById(int id) {
		// TODO Auto-generated method stub		
		return voteThemeDao.deleteById(id);
	}

	@Override
	public VoteTheme findById(int id) {
		// TODO Auto-generated method stub
		return voteThemeDao.findById(id);
	}

	@Override
	public Integer updateVoteTheme(VoteTheme voteTheme) {
		// TODO Auto-generated method stub
		return voteThemeDao.updateVoteTheme(voteTheme);
	}

	@Override
	public Integer insertVoteTheme(VoteTheme voteTheme) {
		// TODO Auto-generated method stub
		return voteThemeDao.insertVoteTheme(voteTheme);
	}

	@Override
	public List<VoteTheme> getVoteThemeList(int begin, int offset) {
		// TODO Auto-generated method stub
		return voteThemeDao.getVoteThemeList(begin, offset);
	}

	@Override
	public VoteTheme getPublishedVoteTheme() {
		// TODO Auto-generated method stub
		return voteThemeDao.getPublishedVoteTheme();
	}

	@Override
	public Integer getVoteThemeNum() {
		// TODO Auto-generated method stub
		return voteThemeDao.getTotalNum(0);
	}

	@Override
	public Integer getClosedVoteThemeNum() {
		// TODO Auto-generated method stub
		return voteThemeDao.getTotalNum(2);
	}

	@Override
	public List<VoteTheme> getClosedVoteThemeList(int begin, int offset) {
		// TODO Auto-generated method stub
		return voteThemeDao.getClosedVoteThemeList(begin, offset);
	}

}
