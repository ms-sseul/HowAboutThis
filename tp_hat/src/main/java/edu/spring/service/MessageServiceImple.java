package edu.spring.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.spring.domain.Message;
import edu.spring.persistence.MessageDao;

@Service
public class MessageServiceImple implements MessageService {

	private final Logger logger = LoggerFactory.getLogger(MessageServiceImple.class);
	
	@Autowired MessageDao messageDao;
	
	@Transactional
	@Override
	public int insert(Message message) {
		logger.info("insert service call()");
				
		return messageDao.insert(message);
	}

	@Override
	public List<Message> read(String id) {
		logger.info("read Service call = {}");
		return messageDao.read(id);
	}

	@Override
	public int updateread(int message) {
		logger.info("message update service call = {}", message);
		return messageDao.updateRead(message);
	}

	@Override
	public int delete(int mno) {
		logger.info("delete Service call = {}",mno);
		return messageDao.delete(mno);
	}

	@Override
	public Message selectOne(int mno) {
		logger.info("selectOne 호출 = ({})",mno);
		
		
		return messageDao.selectMno(mno);
			
	}

}
