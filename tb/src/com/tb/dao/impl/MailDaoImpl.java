package com.tb.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;



//import com.tb.common.PageBean;
import com.tb.dao.BaseDao;
import com.tb.dao.MailDao;
import com.tb.domain.Mail;

@Repository
public class MailDaoImpl extends BaseDao<Mail> implements MailDao {

	@Override
	protected Class getEntityClass() {
		return Mail.class;
	}	

	@Override
	public Integer deleteById(int id) {
		return super.delete("mails.deleteByPrimaryKey", id);
	}

	@Override
	public Integer deleteByIds(String ids) {
		return super.delete("mails.deleteByIds", ids);
	}

	@Override
	public Mail findById(int id) {
		return super.findById("mails.selectByPrimaryKey", id);
	}

	@Override
	public Integer updateMailStatus(Mail mail) {
		return super.update("mails.updateStatusByPrimaryKey", mail);
	}

	@Override
	public Integer insertMail(Mail mail) {
		return super.insert("mails.insert", mail);
	}	

	@Override
	public List<Mail> getMailList(int begin, int offset, int category) {
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("begin", begin);
		params.put("offset", offset);		
		return super.getList("mails.getList", params);
	}

	@Override
	public Integer getTotalNum(int category){
		Map<String, Integer> params = new HashMap<String, Integer>();		
		params.put("", null);
		Integer count = (Integer) findOtherType("mails.findDataCount", params);
		return count;
	}
	
	
}
