package com.tb.dao;

import java.util.List;

//import com.tb.common.PageBean;
import com.tb.domain.Mail;

public interface MailDao {

	Integer deleteById(int id);

	Integer deleteByIds(String ids);

	Mail findById(int id);

	Integer updateMailStatus(Mail mail);

	Integer insertMail(Mail mail);

	List<Mail> getMailList(int begin, int offset, int category);

	Integer getTotalNum(int category);

}
