package com.tb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tb.dao.PhileDao;
import com.tb.domain.Phile;
import com.tb.service.PhileService;

@Service("fileService")
public class PhileServiceImpl implements PhileService {

	@Autowired
	private PhileDao phileDao;

	@Override
	public Integer insert(Phile file) {
		return phileDao.insertPhile(file);
	}

	@Override
	public Integer delete(int id) {
		return phileDao.deletePhile(id);
	}

	@Override
	public Phile findByID(int id) {
		return phileDao.findPhileByID(id);
	}

	@Override
	public Phile findByEntryID(int entryId) {
		return phileDao.findPhileByEntryID(entryId);
	}

	@Override
	public Integer update(Phile file) {
		return phileDao.updatePhile(file);
	}
	
	
	@Override
	public List<Phile> findByStatus(int category, int status){
		return phileDao.findPhileByStatus(category, status);
	}

	@Override
	public Integer getTotalNum(int category, int status){
		return phileDao.getTotalNum(category, status);
	}
	
	@Override
	public List<Phile> getSildeFileList(int category, int number){
		return phileDao.getSildeList(category, number);
	}
	
}
