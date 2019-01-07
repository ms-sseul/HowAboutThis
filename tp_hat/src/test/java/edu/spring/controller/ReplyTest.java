package edu.spring.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.domain.Reply;
import edu.spring.persistence.ReplyDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
					
		}
)
public class ReplyTest {

	private final Logger logger = 
			LoggerFactory.getLogger(ReplyTest.class);
	
	@Autowired private ReplyDao replyDao;
	
	@Test
	public void doTest() {
		insertTest();
	}
	
	private void insertTest() {
		Reply r = new Reply(0, 1, "댓글1", "aaa", 0, null, 0);
		
		int result = replyDao.create(r);
		logger.info("insert result = {}",result);
		
	}
	
	
	
	
	
}
