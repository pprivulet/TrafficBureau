package com.tb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;



import com.tb.dao.VoteThemeDao;
import com.tb.domain.VoteTheme;
import com.tb.service.VoteThemePagingService;

public class VoteThemePagingServiceImpl implements VoteThemePagingService {

	@Autowired
	private VoteThemeDao voteThemeDao;

	private int pageSize; // entry num per page
	private int pageDelta; // page index per page
	private int currentPage;
	private int pageCount; // whole page numbers

	@Override
	public void setRecordsSubst(List recordsSubset) {
	}

	@Override
	public void setRealRecordCount(long realRecordCount) {
	}

	@Override
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public int getPageSize() {
		return this.pageSize;
	}

	@Override
	public int getTotalCount(int status) {
		return voteThemeDao.getTotalNum(status);
	}

	@Override
	public int getPageCount(int status) {
		this.pageCount = voteThemeDao.getTotalNum(status) / this.pageSize;
		if (voteThemeDao.getTotalNum(status) % this.pageSize > 0) {
			this.pageCount += 1;
		}
		return this.pageCount;
	}

	@Override
	public int getPageDelta() {
		return this.pageDelta;
	}

	@Override
	public void setPageDelta(int pageDelta) {
		this.pageDelta = pageDelta;
	}

	@Override
	public int getCurrentPage() {
		return this.currentPage;
	}

	@Override
	public void setCurrentPage(int pageNum) {
		this.currentPage = pageNum;
	}

	@Override
	public void setMaxLinkedPages(int maxLinkedPages) {
	}

	@Override
	public int getMaxLinkedPages() {
		return 0;
	}

	@Override
	public int getFirstLinkedPage() {
		int bp = this.currentPage - this.pageDelta;
		return bp < 1 ? 1 : bp;
	}

	@Override
	public int getLastLinkedPage() {
		int lp = this.currentPage + this.pageDelta;
		return lp > this.pageCount ? this.pageCount : lp;
	}

	@Override
	public void previousPage() {
	}

	@Override
	public void nextPage() {
	}

	@Override
	public void firstPage() {
	}

	@Override
	public void lastPage() {
	}

	@Override
	public long getNrOfElements() {
		return 0;
	}

	@Override
	public int getFirstElementOnPage() {
		return 0;
	}

	@Override
	public int getLastElementOnPage() {
		return 0;
	}

	@Override
	public List getList() {
		int pageNum = this.currentPage;
		int begin = (pageNum - 1) * this.pageSize;
		int offset = this.pageSize;
		List<VoteTheme> voteThemeList = voteThemeDao.getVoteThemeList(begin, offset);
		return voteThemeList;
	}
	
	@Override
	public List getClosedList(int status){
		int pageNum = this.currentPage;
		int begin = (pageNum - 1) * this.pageSize;
		int offset = this.pageSize;
		List<VoteTheme> voteThemeList = voteThemeDao.getClosedVoteThemeList(begin, offset);
		return voteThemeList;
	}
}
