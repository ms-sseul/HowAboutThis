package edu.spring.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.domain.Reply;

@Repository
public class ReplyDaoImple implements ReplyDao {

	private final Logger logger =
			LoggerFactory.getLogger(ReplyDaoImple.class);
	
	private static final String REPLY_MAPPER = "edu.spring.ReplyMapper";
	
	@Autowired private SqlSession session;
	
	@Override
	public int create(Reply reply) {
		logger.info("create{()} call",reply.toString());
		
		return session.insert(REPLY_MAPPER+".insert",reply);
	}

	@Override
	public List<Reply> read(int pno) {
		logger.info("readAllReply(pno={}) call",pno);
		
		return session.selectList(REPLY_MAPPER +".selectReplyByBno", pno);
	}

	@Override
	public int update(Reply reply) {
		logger.info("updateReply() call");
		return session.update(REPLY_MAPPER +".update",reply);
	}

	@Override
	public int delete(int rno) {
		logger.info("delete() call");
		return session.delete(REPLY_MAPPER+".delete",rno);
	}

	@Override
	public int selectPno(int rno) {
		logger.info("selectPno(rno={}) 호출", rno);
		
		return session.selectOne(REPLY_MAPPER+".selectpno",rno);
	}

	@Override
	public int createrrno(Reply reply) {
		logger.info("createrrno() call"); 
		return session.insert(REPLY_MAPPER+".insertrrno",reply);
	}

	@Override
	public int updaterrno(Reply reply) {
		logger.info("update() call"); 
		
		return session.update(REPLY_MAPPER+".updaterrno",reply);
	}

	@Override
	public int deleterrno(int rrno) {
		logger.info("delete() call"); 
		return session.delete(REPLY_MAPPER+".deleterrno",rrno);
	}

	@Override
	public List<Reply> readrrno(int rno) {
		logger.info("readrrno() 호출");
		return session.selectList(REPLY_MAPPER+".selectAllrrno",rno);
	}

	@Override
	public int selectRno(int rrno) {
		// TODO Auto-generated method stub
		return 0;
	}

}
