package edu.spring.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.domain.Reply;
import edu.spring.persistence.BoardDao;
import edu.spring.persistence.ReplyDao;

@Service
public class ReplyServiceImple implements ReplyService {

	private final Logger logger = 
			LoggerFactory.getLogger(ReplyServiceImple.class);
	
	@Autowired private ReplyDao replyDao;
	@Autowired private BoardDao boardDao;
	
	@Override
	public int insert(Reply reply) {
		logger.info("insert({}) 호출",reply.toString());

		int result = replyDao.create(reply);
		if(result == 1) {
			boardDao.updateBoardReplyCnt(reply.getParentNumber(), 1);
		}
		
		
		return result;
	}

	@Override
	public List<Reply> select(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int rno) {
		// TODO Auto-generated method stub
		return 0;
	}

}
