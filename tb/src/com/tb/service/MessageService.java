package com.tb.service;

import java.util.List;
import java.util.Map;


import com.tb.domain.Message;

public interface MessageService {	

	Integer deleteById(int id);

	Integer deleteByIds(String ids);

	Message findById(int id);

	Integer updateMessageStatus(Message mail);

	Integer insertMessage(Message mail);     	
	
	List<Message> getMessageList(int begin, int offset, int category);
	 
    Integer getMessageNum(int category);
}
