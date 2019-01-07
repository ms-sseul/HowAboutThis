package edu.spring.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.domain.User;
import edu.spring.service.UserServiceImple;

@Repository
public class UserDaoImple implements UserDao{
	private static final String USER_MAPPERS = "edu.spring.UserMapper";

	private final Logger logger = LoggerFactory.getLogger(UserDaoImple.class);
	
	@Autowired SqlSession session;
	
	@Override
	public User loginCheck(User user) {
		logger.info("loginCheck{}", user);
		
		return session.selectOne(USER_MAPPERS+ ".loginCheck", user);
	}

	@Override
	public int insert(User user) {
		logger.info("UserDaoImple insert() 호출");
		
		return session.insert(USER_MAPPERS+ ".insert", user);
	}

	@Override
	public int update(User user) {
		logger.info("UserDaoImple update() 호출");
		return session.update(USER_MAPPERS+".update", user);
	}

	@Override
	public int delete(String userId) {
		logger.info("UserDaoImple delete() 호출");
		
		return session.delete(USER_MAPPERS + ".delete", userId);
	}
	
	
}
