package edu.spring.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import edu.spring.domain.User;

public interface UserService {
	
	User loginCheck(User user);
	
	User selectOne(String userId);
	
	int insert(User user) throws MessagingException, UnsupportedEncodingException;
	
	int update(User user);
	
	int passwordUpdate(User user);
	
	int delete(String userId);

	int certiUpdate(String userId);
	
	int pointUpdate(User user);

}
