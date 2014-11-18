package com.tb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tb.dao.MailDao;
import com.tb.domain.Entry;
import com.tb.domain.Mail;
import com.tb.service.MailService;


@Service("mailService")
public class MailServiceImpl implements MailService {

	@Autowired
	private MailDao mailDao;

	public Integer deleteById(int id) {

		return mailDao.deleteById(id);
	}

	public Integer deleteByIds(String ids) {
		return mailDao.deleteByIds(ids);
	}

	public Mail findById(int id) {
		return mailDao.findById(id);
	}

	public Integer updateMailStatus(Mail mail) {
		return mailDao.updateMailStatus(mail);
	}

	public Integer insertMail(Mail mail) {
		return mailDao.insertMail(mail);
	}

	public List<Mail> getMailList(int begin, int offset, int category) {
		return mailDao.getMailList(begin, offset, category);
	}

	public Integer getMailNum(int category) {
		return mailDao.getTotalNum(category);
	}


}
