package edu.spring.persistence;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import edu.spring.domain.User;
import edu.spring.service.UserServiceImple;

@Repository
public class UserDaoImple implements UserDao{

	private final Logger logger = LoggerFactory.getLogger(UserDaoImple.class);
	
	@Override
	public User loginCheck(User user) {
		
		return null;
	}
}
