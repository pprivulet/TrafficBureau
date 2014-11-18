package com.tb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tb.dao.MailDao;
import com.tb.dao.MessageDao;
import com.tb.domain.Mail;
import com.tb.domain.Message;
import com.tb.service.MessageService;

@Service("messageService")
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDao messageDao;

	@Override
	public Integer deleteById(int id) {

		return messageDao.deleteById(id);
	}
	@Override
	public Integer deleteByIds(String ids) {
		return messageDao.deleteByIds(ids);
	}
	@Override
	public Message findById(int id) {
		return messageDao.findById(id);
	}
	@Override
	public Integer updateMessageStatus(Message message) {
		return messageDao.updateMessageStatus(message);
	}
	@Override
	public Integer insertMessage(Message message) {
		return messageDao.insertMessage(message);
	}
	@Override
	public List<Message> getMessageList(int begin, int offset, int category) {
		return messageDao.getMessageList(begin, offset, category);
	}
	@Override
	public Integer getMessageNum(int category) {
		return messageDao.getTotalNum(category);
	}

	
}
