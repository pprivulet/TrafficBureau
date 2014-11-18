package com.tb.service;

import java.util.List;

public interface VoteThemePagingService {
	void setRecordsSubst(List recordsSubset);

	void setRealRecordCount(long realRecordCount);

	void setPageSize(int pageSize); // How many records display on one page

	int getPageSize(); // Number of records on the page

	int getPageCount(int category); // Calculate the page number by whole
						// records/recordsPerPage

	//void setPageCount(int pageCount); // set whole page count

	int getCurrentPage(); // get current page

	void setCurrentPage(int page); // 0 for first page

	void setMaxLinkedPages(int maxLinkedPages); // set the number of pages
												// arround current page

	int getMaxLinkedPages(); // get the number of pages arround current page

	int getFirstLinkedPage(); // get the first page 

	int getLastLinkedPage(); // get the last page

	void previousPage(); // get previous page

	void nextPage(); // get next page

	void firstPage(); // go to first page

	void lastPage(); // go to last page

	long getNrOfElements(); // get whole number of records

	int getFirstElementOnPage(); // get the number of first record on current
									// page

	int getLastElementOnPage(); // get last number of the record on current page	

	int getPageDelta();

	void setPageDelta(int pageDelta);

	List getList();
	
	List getClosedList(int status);

	int getTotalCount(int status);
}
