package edu.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.domain.Reply;
import edu.spring.service.ReplyService;

@RestController
@RequestMapping(value = "replies")
public class ReplyController {
	private final Logger logger = 
			LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired private ReplyService replyService;
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Integer> createReply(
			@RequestBody Reply reply){
		
		logger.info("createReply{()} 호출",reply.toString());
		
		int result = replyService.insert(reply);
		logger.info("insert 결과: {}",result);
		
		ResponseEntity<Integer> entity = null;
		if(result == 1) {
			entity = new ResponseEntity<Integer>(
				result,HttpStatus.OK);
		}else {
			entity = new ResponseEntity<Integer>(result,
					HttpStatus.BAD_REQUEST);
		}
		
		
		
		return entity;
		
	}

}
