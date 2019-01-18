package edu.spring.controller;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import edu.spring.domain.Message;
import edu.spring.persistence.MessageDao;
import edu.spring.service.MessageService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml"

})
public class MessageTest {

	private final Logger logger = LoggerFactory.getLogger(MessageTest.class);
	
	@Autowired private MessageService messageService;
	
	@Autowired private MessageDao messageDao;
	
	@Test
	public void doTest() {
		insert();
//		list();
//		selectOne();
//		delete();
//		update();
	
	}
	
	public void insert() {
		Message message = new Message();
		
		message.setTitle("두번째 메시지 title");
		message.setContent("두번째 메시지 content");
		message.setSender("두번째");
		message.setReciever("김상현");
		
		int result = messageService.insert(message);
		
		if(result == 1) {
			logger.info("insert result = {}",result);
		}else {
			logger.info("insert message null");
		}
		
	}
	
//	public void list() {
//		List<Message> list = messageService.read();
//		
//		if(list != null) {
//			for(Message m : list) {
//				logger.info(m.toString());
//			}
//		}else {
//			logger.info("출력할 내용이 없습니다");
//		}
//		
//	}
	
	public void selectOne() {
		Message result = messageService.selectOne(1);
		
		if(result != null) {
			logger.info("selectTest one = ({})",result);
		}else {
			logger.info("출력할 내용이 없습니다");
		}	
		
	}
	
	public void delete() {
		int result = messageService.delete(3);
		
		if(result == 1) {
			logger.info("MnoDelete = {}",result);
		}else {
			logger.info("삭제할 내용이 없습니다");
		}
		
	}
	
	public void update() {
		int result = messageDao.updateRead(4);
		
		if(result == 1) {
			logger.info("MnoUpdate = {}",result);
		}else {
			logger.info("updateRead가 잘못 되었습니다");
		}
		
	}
	
	
}
