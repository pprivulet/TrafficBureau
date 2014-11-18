package com.tb.dao;


import java.util.List;

import com.tb.domain.Phile;

public interface PhileDao {

	Integer insertPhile(Phile file);

	Integer deletePhile(int id);

	Phile findPhileByID(int id);

	Phile findPhileByEntryID(int entryId);
	
	Integer updatePhile(Phile file);

	List<Phile> findPhileByStatus(int category, int status);

	Integer getTotalNum(int category, int status);

	List<Phile> getSildeList(int category, int number);

}