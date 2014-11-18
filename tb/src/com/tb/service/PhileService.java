package com.tb.service;


import java.util.List;

import com.tb.domain.Phile;

public interface PhileService {
	Integer insert(Phile file);

	Integer delete(int id);

	Phile findByID(int id);

	Phile findByEntryID(int entryId);
	
	Integer update(Phile file);	
	
	Integer getTotalNum(int category, int status);

	List<Phile> findByStatus(int category, int status);

	List<Phile> getSildeFileList(int category, int number);
}
