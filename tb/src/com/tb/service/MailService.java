package com.tb.service;

import java.util.List;
import java.util.Map;


import com.tb.domain.Mail;

public interface MailService {	

	Integer deleteById(int id);

	Integer deleteByIds(String ids);

	Mail findById(int id);

	Integer updateMailStatus(Mail mail);

	Integer insertMail(Mail mail);     	
	
	List<Mail> getMailList(int begin, int offset, int category);
	 
    Integer getMailNum(int category);
}
