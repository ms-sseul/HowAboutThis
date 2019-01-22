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
	public List<Reply> select(int pno, int type) {
		logger.info("select(pno={}) 호출",pno);
		return replyDao.read(pno, type);
	}

	@Override
	public int update(Reply reply) {
		logger.info("update({}) 호출",reply.toString());
		return replyDao.update(reply);
	}

	@Override
	public int delete(int rno) {
		logger.info("delete({}) 호출",rno);
		return replyDao.delete(rno);
	}

	@Override
	public int insertrrno(Reply reply) {
		logger.info("insert({}) 호출",reply);
		
		int result = replyDao.createrrno(reply);
			
		
		return result;
	}

	@Override
	public List<Reply> selectrrno(int pno) {
		logger.info("select(pno={}) 호출",pno);
		return replyDao.readrrno(pno);
	}

	@Override
	public int updaterrno(Reply reply) {
		logger.info("updaterrno({}) 호출",reply.toString());
		return replyDao.updaterrno(reply);
	}

	@Override
	public int deleterrno(int rrno) {
		logger.info("deleterrno({}) 호출",rrno);
		return replyDao.deleterrno(rrno);
	}

	@Override
	public List<Reply> readPno(int pno, int type) {
		logger.info("readPno ({}) 호출");
		return replyDao.readPno(pno, type);
	}

}
