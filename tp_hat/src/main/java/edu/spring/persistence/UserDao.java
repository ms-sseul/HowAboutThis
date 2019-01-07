package edu.spring.persistence;

import edu.spring.domain.User;

public interface UserDao {
	
	User loginCheck(User user);

}
