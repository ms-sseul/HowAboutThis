package edu.spring.persistence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.tags.ParamAware;

import edu.spring.domain.User;
import edu.spring.service.UserServiceImple;

@Repository
public class UserDaoImple implements UserDao{
	private static final String USER_MAPPERS = "edu.spring.UserMapper";

	private final Logger logger = LoggerFactory.getLogger(UserDaoImple.class);
	
	@Autowired SqlSession session;
	@Autowired private BCryptPasswordEncoder encode;
	
	@Override
	public User loginCheck(User user) {
		logger.info("loginCheck({})", user);
		
		return session.selectOne(USER_MAPPERS+ ".loginCheck", user);
	}

	@Override
	public int insert(User user) {
		logger.info("UserDaoImple insert() 호출");
		user.setCertification("n");
		
		String pwd = user.getUserPwd();
		logger.info("기존 비밀 번호: " + pwd);
		
		String encPwd = encode.encode(user.getUserPwd());
		
		if(encode.matches(pwd, encPwd)) {
			logger.info("비밀번호 일치");
			user.setUserPwd(encPwd);
			logger.info("암호화된 비밀번호 : " + user.getUserPwd());
		} else {
			logger.info("비밀번호 불일치");
		}
		
		
		return session.insert(USER_MAPPERS+ ".insert", user);
	}
	

	@Override
	public int update(User user) {
		logger.info("UserDaoImple update() 호출");
		
		String pwd = user.getUserPwd();
		logger.info("기존 비밀 번호: " + pwd);
		
		String encPwd = encode.encode(user.getUserPwd());
		logger.info("암호화된 비밀번호 : " + user.getUserPwd());
		
		user.setUserPwd(encPwd);
		
		return session.update(USER_MAPPERS+".update", user);
	}

	@Override
	public int delete(String userId) {
		logger.info("UserDaoImple delete() 호출");
		
		return session.delete(USER_MAPPERS + ".delete", userId);
	}
	
	@Override
	public int passwordUpdate(User user) {
		logger.info("passwordUpdate() 호출");
		String encPwd = encode.encode(user.getUserPwd());
		user.setUserPwd(encPwd);
		
		return session.update(USER_MAPPERS+".passwordUpdate", user);
	}
	
	@Override
	public int certiUpdate(String userId) {
		logger.info("UserDaoImple certiUpdate() 호출");
		
		Map<String, String> params = new HashMap<>();
		params.put("userId", userId);
		return session.update(USER_MAPPERS+".certiUpdate", params);
	}
	
	@Override
	public User selectOne(String userId) {
		logger.info("userDaoImple selectOne() 호출");
		
		return session.selectOne(USER_MAPPERS+".selectOne", userId);
	}
	
	@Override
	public int pointUpdate(User user) {
		
		return session.update(USER_MAPPERS + ".pointUpdate", user);
	}

	@Override
	public int updateSupportPoint(String userId, int supportAmount) {
		Map<String, Object> params = new HashMap<>();
		params.put("userId", userId);
		params.put("supportAmount", supportAmount);
		return session.update(USER_MAPPERS + ".updatesupprotPoint" , params);
	}
	
}
