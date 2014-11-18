package com.tb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tb.service.MailPagingService;
import com.tb.dao.MailDao;
import com.tb.domain.Entry;
import com.tb.domain.Mail;

@Service("mailPagingService")
public class MailPagingServiceImpl implements MailPagingService {
	
	@Autowired
	private MailDao mailDao;	
	
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
	public int getTotalMailCount(int category) {
		return mailDao.getTotalNum(category);		
	}
	
	@Override
	public int getPageCount(int category) {
		this.pageCount = mailDao.getTotalNum(category) / this.pageSize;
		if( mailDao.getTotalNum(category) % this.pageSize > 0) {
			this.pageCount += 1;
		}		
		return 	this.pageCount;
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
		return bp<1?1:bp;	
	}

	@Override
	public int getLastLinkedPage() {
		int lp = this.currentPage + this.pageDelta;		
		return lp>this.pageCount?this.pageCount:lp;		
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
	public List getList(int category) {
		int pageNum = this.currentPage;
		int begin = (pageNum-1) * this.pageSize;
		int offset = this.pageSize;			
		List<Mail> entryList = mailDao.getMailList(begin, offset, category);
		return entryList;
	}
	
	@Override
	public List getPublishedEntryList(int category) {
		
		return null;
	}

}
