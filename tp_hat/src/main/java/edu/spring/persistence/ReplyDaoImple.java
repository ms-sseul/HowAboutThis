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
		logger.info("createReply() call");
		
		return session.insert(REPLY_MAPPER+".insert",reply);
	}

	@Override
	public List<Reply> read(int bno) {
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

	@Override
	public int selectBno(int rno) {
		// TODO Auto-generated method stub
		return 0;
	}

}
