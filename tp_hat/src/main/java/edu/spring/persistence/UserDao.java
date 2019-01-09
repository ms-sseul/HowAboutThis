package edu.spring.persistence;

import edu.spring.domain.User;

public interface UserDao {
	
	User loginCheck(User user);
	
	int insert(User user);
	
	int update(User user);
	
	int delete(String userId);
	
	int certiUpdate(String userId);

}
