package edu.spring.persistence;

import java.util.List;

import edu.spring.domain.Message;

public interface MessageDao {

	int insert(Message message);
	List<Message> read(String id);
	Message selectMno(int mno);
	int updateRead(int mno);
	int delete(int mno);
	
	
}
