package com.tb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tb.service.PagingService;
import com.tb.dao.EntryDao;
import com.tb.domain.Entry;

@Service("pagingService")
public class PagingServiceImpl implements PagingService {
	
	@Autowired
	private EntryDao entryDao;	
	
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
	public int getTotalEntryCount(int category) {
		return entryDao.getTotalNum(category);		
	}
	
	@Override
	public int getPageCount(int category) {
		this.pageCount = entryDao.getTotalNum(category) / this.pageSize;
		if( entryDao.getTotalNum(category) % this.pageSize > 0) {
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
	
	
	//@Override
	//public void setPageCount(int pageCount) {		
		//this.pageCount = pageCount;
	//}

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
		System.out.println(bp);
		return bp<1?1:bp;	
	}

	@Override
	public int getLastLinkedPage() {
		int lp = this.currentPage + this.pageDelta;	
		System.out.println(lp);
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
	public List getEntryList(int category) {
		int pageNum = this.currentPage;
		int begin = (pageNum-1) * this.pageSize;
		int offset = this.pageSize;			
		List<Entry> entryList = entryDao.getEntryList(begin, offset, category);
		return entryList;
	}

}
