package com.tb.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tb.dao.BaseDao;
import com.tb.dao.MessageDao;
import com.tb.domain.Message;

@Repository
public class MessageDaoImpl extends BaseDao<Message> implements MessageDao {

	@Override
	protected Class getEntityClass() {
		return Message.class;
	}

	@Override
	public Integer deleteById(int id) {
		return super.delete("messages.deleteByPrimaryKey", id);
	}

	@Override
	public Integer deleteByIds(String ids) {
		return super.delete("messages.deleteByIds", ids);
	}

	@Override
	public Message findById(int id) {
		return super.findById("messages.selectByPrimaryKey", id);
	}

	@Override
	public Integer updateMessageStatus(Message message) {
		return super.update("messages.updateStatusByPrimaryKey", message);
	}

	@Override
	public Integer insertMessage(Message message) {
		return super.insert("messages.insert", message);
	}

	@Override
	public List<Message> getMessageList(int begin, int offset, int category) {
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("begin", begin);
		params.put("offset", offset);
		return super.getList("messages.getList", params);
	}

	@Override
	public Integer getTotalNum(int category) {
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("", null);
		Integer count = (Integer) findOtherType("messages.findDataCount",
				params);
		return count;
	}

}
