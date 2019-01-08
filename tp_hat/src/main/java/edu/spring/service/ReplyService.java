package edu.spring.service;

import java.util.List;

import edu.spring.domain.Reply;

public interface ReplyService {

	int insert(Reply reply);
	List<Reply> select(int pno);
	int update(Reply reply);
	int delete(int rno);
	
	int insertrrno(Reply reply);
	List<Reply> selectrrno(int rno);
	int updaterrno(Reply reply);
	int deleterrno(int rrno);
}
