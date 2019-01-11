package edu.spring.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.domain.Message;

@Repository
public class MessageDaoImple implements MessageDao {

	Logger logger = LoggerFactory.getLogger(MessageDao.class);
	
	private static final String MESSAGE_MAPPER = "edu.spring.MessageMapper";
	
	@Autowired private SqlSession session;
	
	
	@Override
	public int insert(Message message) {
		logger.info("insertMessage () call");
		
		return session.insert(MESSAGE_MAPPER+".insert",message);
	}

	@Override
	public List<Message> read() {
		logger.info("List Dao  출력");

		
		return session.selectList(MESSAGE_MAPPER+".selectAll");
	}

	@Override
	public Message selectMno(int mno) {
		logger.info("select one Dao = ({})",mno);
		
		
		return session.selectOne(MESSAGE_MAPPER+".selectOne",mno);
	}

	
	@Override
	public int delete(int mno) {
		logger.info("delete Message = ({})", mno);
		return session.delete(MESSAGE_MAPPER+".delete",mno);
	}

	@Override
	public int updateRead(int mno) {
		logger.info("updateReadDao Message = ({})", mno);
		
//		Map<String, Integer> params = new HashMap<>();
//		params.put("increment", 1);
//		params.put("mno", mno);
		
		return session.update(MESSAGE_MAPPER+".updateRead", /*params*/mno);
	}

}
