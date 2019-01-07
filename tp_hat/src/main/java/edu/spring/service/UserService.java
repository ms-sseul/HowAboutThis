package edu.spring.service;

import edu.spring.domain.User;

public interface UserService {
	
	User loginCheck(User user);
	
	int insert(User user);
	
	int update(User user);
	
	int delete(String userId);

}
