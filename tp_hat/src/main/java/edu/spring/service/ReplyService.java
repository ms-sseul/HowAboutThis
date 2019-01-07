package edu.spring.service;

import java.util.List;

import edu.spring.domain.Reply;

public interface ReplyService {

	int insert(Reply reply);
	List<Reply> select(int bno);
	int update(Reply reply);
	int delete(int rno);
}
