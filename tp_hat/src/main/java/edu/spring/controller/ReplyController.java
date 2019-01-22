package edu.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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

import edu.spring.domain.Message;
import edu.spring.domain.Reply;
import edu.spring.persistence.ReplyDao;
import edu.spring.service.ReplyService;

@RestController
@RequestMapping(value = "replies")
public class ReplyController {
	private final Logger logger = 
			LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired private ReplyService replyService;
	@Autowired private ReplyDao replyDao;
	
	
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
	
	@RequestMapping(method = RequestMethod.POST, value = "rrno/{rno}")
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
	
	@RequestMapping(value = "rno", method=RequestMethod.GET)
	public ResponseEntity<Integer> readOne(@RequestBody Message message
			,@PathVariable int rno){
		logger.info("readOne = {}",message);
		
		int result = replyDao.selectrno(rno);
		logger.info("result 결과 = {}",result);
		
		ResponseEntity<Integer> entity = null;
		if(result == 1) {
			entity = new ResponseEntity<Integer>(result,HttpStatus.OK);
		}else {
			entity = new ResponseEntity<Integer>(result,HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
  
	@RequestMapping(value = "all/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<Reply>> readReplies(
				@PathVariable(name = "bno") int bno
			){
		logger.info("readReplies(bno={})",bno);		
		
		List<Reply> list = replyService.select(bno);
		logger.info("list값" + list.toString());
		ResponseEntity<List<Reply>> entity =
				new ResponseEntity<List<Reply>>(list, HttpStatus.OK);
		
		
		return entity;	
		
	}
	
	@RequestMapping(value="/allRno", method = RequestMethod.POST)
	public ResponseEntity<List<Reply>> readRepliesRrno(@RequestBody Reply reply){
		
		logger.info("readRepliesRrno(rno={})", reply.getParentNumber());
		
		List<Reply> list = replyService.selectrrno(reply.getParentNumber());
		
		ResponseEntity<List<Reply>> entity =
				new ResponseEntity<List<Reply>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/update/{rno}", method = RequestMethod.PUT)
	public ResponseEntity<Integer> updateReply(
			@PathVariable(name="rno") int rno,
			@RequestBody Reply reply, HttpSession session){
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
	
	@RequestMapping(value = "update2/{rrno}", method= RequestMethod.PUT)
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
	
	@RequestMapping(value = "delete/{rno}", method = RequestMethod.DELETE)
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
	
	@RequestMapping(value="delete2/{rrno}", method = RequestMethod.DELETE)
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
