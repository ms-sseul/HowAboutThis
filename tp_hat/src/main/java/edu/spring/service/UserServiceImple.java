package edu.spring.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.domain.User;
import edu.spring.persistence.UserDao;

@Service
public class UserServiceImple implements UserService {
	
	private final Logger logger = LoggerFactory.getLogger(UserServiceImple.class);
	
	@Autowired private UserDao userDao;

	@Override
	public User loginCheck(User user) {
		logger.info("loginCheck", user);
		
		return userDao.loginCheck(user);
	}
	
	@Override
	public int insert(User user) {
		logger.info("UserService insert() 호출");
		
		
		return userDao.insert(user);
	}
	
	@Override
	public int update(User user) {
		logger.info("UserService update() 호출");
		
		return userDao.update(user);
	}
	
	@Override
	public int delete(String userId) {
		logger.info("UserService delete() 호출");
		
		return userDao.delete(userId);
	}
	
}
