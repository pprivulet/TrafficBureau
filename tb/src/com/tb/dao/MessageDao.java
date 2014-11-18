package com.tb.dao;

import java.util.List;

import com.tb.domain.Message;

public interface MessageDao {

	Integer deleteById(int id);

	Integer deleteByIds(String ids);

	Message findById(int id);

	Integer updateMessageStatus(Message message);

	Integer insertMessage(Message message);

	List<Message> getMessageList(int begin, int offset, int category);

	Integer getTotalNum(int category);

	
}
