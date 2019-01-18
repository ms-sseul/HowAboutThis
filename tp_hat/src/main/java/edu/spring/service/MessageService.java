package edu.spring.service;

import java.util.List;

import edu.spring.domain.Message;

public interface MessageService {
	
	int insert(Message message);
	List<Message> read(String id);
	int updateread(int message);
	int delete(int mno);
	Message selectOne(int mno);

}
