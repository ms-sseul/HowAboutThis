package edu.spring.controller;

import java.util.List;

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
import edu.spring.service.ReplyService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml"

})
public class ReplyTest {

	private final Logger logger = LoggerFactory.getLogger(ReplyTest.class);

	@Autowired
	private ReplyDao replyDao;
	
	@Autowired ReplyService replyService;

	@Test
	public void doTest() {
//		 insertTest();
//		selectAllTest();
//		update();
//		delete();
//		insertrrno();
//		rrnoList();
//		updaterrno();
//		deleterrno();
	}

	/*private void insertTest() {
		Reply r = new Reply();
		r.setParentNumber(24);
		r.setContent("짜증이 밀려온다");
		r.setUserId("ccccccccc");

		int result = replyDao.create(r);
		if(result == 1) {		
		logger.info("insert result = {}", result);
		}else {
			logger.info("not message");
		}

	}

	private void selectAllTest() {
		List<Reply> list = replyDao.read(24);
		
		if(list != null) {
			for (Reply p : list) {
				logger.info(p.toString());
			}
		} else {
			logger.info("list is null!!");
		}
	}
	
	private void update() {
		
		Reply reply = new Reply();
		reply.setRno(3);
		reply.setContent("바꾸기");
		
		
		int result = replyDao.update(reply);
		logger.info("update result = {}",result);
		
	}
	
	private void delete() {
		int result = replyDao.delete(5);
		logger.info("댓글 delete 결과: {}", result);
				
	}
	
	private void insertrrno() {
		Reply r = new Reply(7,1,"rrno댓글2","bbb",3,null,0);
		int result = replyDao.createrrno(r);
		
		logger.info("대댓글 insert = {}",result);	
	}
	
	private void rrnoList() {
		List<Reply> list = replyService.selectrrno(24);
		
		if(list != null) {
			for(Reply r : list) {
				logger.info(r.toString());
			}
		}else {
			logger.info("not rrno List");
		}
		
	}
	
	private void updaterrno() {
		Reply reply = new Reply();
		reply.setRno(10);
		reply.setContent("rrno 바꾸기");
		
		int result = replyService.updaterrno(reply);
		if(result == 1) {
			logger.info("updaterrno = {}",result);
		}else {
			logger.info("no updateRrno");
		}
		
	}
	
	private void deleterrno() {
		int result = replyService.deleterrno(7);
		
		logger.info("deleterrno 결과 = {}",result);		
		
	}*/
	
	
	
	

}
