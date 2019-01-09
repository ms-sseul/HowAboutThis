package edu.spring.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.domain.User;
import edu.spring.persistence.UserDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {
				"file:src/main/webapp/WEB-INF/spring/root-context.xml"
		}
)

public class UserTest {
	
	private final Logger logger = LoggerFactory.getLogger(UserTest.class);
	
	@Autowired private UserDao userDao;
	
	@Test
	public void doTest() {
		insert();
		
	}
	
	private int insert() {
		int result = 0;
		User Test = new User("김상현", "aaa", "aaa@aaa.com", "010-1111-1111", 1, null);
		
		result = userDao.insert(Test);
		logger.info("result = ", result);
		
		return result;
	}

}





