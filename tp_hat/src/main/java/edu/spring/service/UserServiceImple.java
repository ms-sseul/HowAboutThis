package edu.spring.service;

import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.spring.domain.User;
import edu.spring.persistence.UserDao;
import edu.spring.util.MailHandler;
import edu.spring.util.TempKey;

@Service
public class UserServiceImple implements UserService {

	private final Logger logger = LoggerFactory.getLogger(UserServiceImple.class);

	@Autowired
	private UserDao userDao;
	@Inject
	private JavaMailSender mailsender;

	@Override
	public User loginCheck(User user) {
		logger.info("loginCheck", user);

		return userDao.loginCheck(user);
	}

	@Transactional
	@Override
	public int insert(User user) throws MessagingException, UnsupportedEncodingException {
		logger.info("UserService insert() 호출");
		
		int result = 0;

		result = userDao.insert(user);

		MailHandler sendMail = new MailHandler(mailsender);
		sendMail.setSubject("이거어때 서비스 이메일 인증!");
		sendMail.setText(new StringBuffer().append("<h1>메일 인증</h1>")
				.append("<a href='https://localhost:8443/controller/user/emailConfirm?userId=").append(user.getUserId())
				.append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("myulchi0522@gmail.com", "김상현");
		sendMail.setTo(user.getUserEmail());
		sendMail.send();

		return result;
	}

	@Override
	public int update(User user) {
		logger.info("UserService update() 호출");

		return userDao.update(user);
	}
	
	@Override
	public int passwordUpdate(User user) {
		logger.info("userService passwordUpdate() 호출");
		
		return userDao.passwordUpdate(user);
	}

	@Override
	public int delete(String userId) {
		logger.info("UserService delete() 호출");

		return userDao.delete(userId);
	}

	@Override
	public int certiUpdate(String userId) {
		
		return userDao.certiUpdate(userId);
	}
	
	@Override
	public User selectOne(String userId) {
		
		return userDao.selectOne(userId);
	}
	
	@Override
	public int pointUpdate(User user) {
		return userDao.pointUpdate(user);
	}

}
