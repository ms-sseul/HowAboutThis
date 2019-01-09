package edu.spring.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(method = RequestMethod.POST, value = "{rno}")
	public ResponseEntity<Integer> createReplyrrno(
			@RequestBody Reply reply,
			@PathVariable (name = "rno") int rno){
		
		logger.info("createReplyrrno{()} 호출",reply.toString());
		
		int result = replyService.insertrrno(reply);
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
  
	@RequestMapping(value = "all/{pno}", method = RequestMethod.GET)
	public ResponseEntity<List<Reply>> readReplies(
				@PathVariable(name = "pno") int pno
			){
		logger.info("readReplies(pno={})",pno);		
		
		List<Reply> list = replyService.select(pno);
		
		ResponseEntity<List<Reply>> entity =
				new ResponseEntity<List<Reply>>(list, HttpStatus.OK);
		
		
		return entity;	
		
	}
	
	@RequestMapping(value="all/{rno}", method = RequestMethod.GET)
	public ResponseEntity<List<Reply>> readRepliesRrno(@PathVariable(name = "rno") int rno){
		
		logger.info("readRepliesRrno(rno={})", rno);
		
		List<Reply> list = replyService.selectrrno(rno);
		
		ResponseEntity<List<Reply>> entity =
				new ResponseEntity<List<Reply>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "{rno}", method = RequestMethod.PUT)
	public ResponseEntity<Integer> updateReply(
			@PathVariable(name="rno") int rno,
			@RequestBody Reply reply){
		logger.info("updateReply(rno={}, reply={})",rno, reply);		
		
		reply.setRno(rno);
		
		int result = replyService.update(reply);
		ResponseEntity<Integer> entity = null;
		if(result == 1) {
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<Integer>(result, HttpStatus.BAD_REQUEST);
		}
		
		return entity;		
	}
	
	@RequestMapping(value = "{rrno}", method= RequestMethod.PUT)
	public ResponseEntity<Integer> updateReplyrrno(
			@PathVariable(name = "rrno") int rrno,
			@RequestBody Reply reply
			){
		logger.info("updateReplyrrno(rrno ={}, reply= {})",rrno,reply);
		
		reply.setRrno(rrno);
		
		int result = replyService.updaterrno(reply);
		ResponseEntity<Integer> entity = null;
		if(result == 1) {
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<Integer>(result, HttpStatus.BAD_REQUEST);
		}
			
		return entity;
	}
	
	@RequestMapping(value = "{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteReply(@PathVariable(name="rno") int rno){
		logger.info("deleteReply(rno={})", rno);
		
		int result = replyService.delete(rno);
		logger.info("댓글 삭제 결과: {}",result);
		
		ResponseEntity<String> entity = null;
		if(result == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}				
		
		return entity;		
	}
	
	public ResponseEntity<String> deleteReplyrrno(@PathVariable(name = "rrno") int rrno){
		logger.info("deleteReplyrrno(rrno={})",rrno);
		
		int result = replyService.deleterrno(rrno);
		logger.info("댓글 삭제 결과: {}",result);
		
		ResponseEntity<String> entity = null;
		if(result == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	
	
	
	

}
