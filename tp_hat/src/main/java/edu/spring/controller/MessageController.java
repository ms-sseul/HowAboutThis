package edu.spring.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import edu.spring.domain.Message;

import edu.spring.service.MessageService;



@Controller
@RequestMapping(value = "message")
public class MessageController {
	private final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired private MessageService messageService;
	
	
	
	@RequestMapping(method = RequestMethod.GET, value = "createMessage")
	public void createMessage(Message message, Model model){
		System.out.println("createMessage (message= {} , model = {})");
		logger.info("message= {} , model = {}",message,model);
		
		
	}
	
	@RequestMapping(method = RequestMethod.POST, value  = "createMessage")
	public String create(Message message, RedirectAttributes re) {
		logger.info("createMessage(message) POST 호출");
		logger.info("message {}", message);
		int result = messageService.insert(message);
		logger.info("create result 결과=", result);
		if(result == 1) {
			re.addFlashAttribute("createMessage", "success");
		}
		
		return "redirect:/user/profile";
		
	}
	
	
	
		

	@RequestMapping(method = RequestMethod.GET , value = "/{loginId}")
	public ResponseEntity<List<Message>> readMessage(@PathVariable(name="loginId") String id){
		logger.info("readMessage() 호출 ");
		
		List<Message> result = messageService.read(id);
		
		ResponseEntity<List<Message>> entity = null;
		
		if(result != null) {
			entity = new ResponseEntity<List<Message>>(result, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<List<Message>>(result, HttpStatus.BAD_REQUEST);
		}
		
		return entity;	
		
	}
	

	
	@RequestMapping(value = "list/{mno}", method = RequestMethod.GET)
	public void readMnoOne(Model model, int mno) {
		logger.info("message(mno={}) 호출", mno);
		
		Message messageOne = messageService.selectOne(mno);
		
		model.addAttribute("messageOne",messageOne);
		
	}

	
	
	@RequestMapping(value = "delete/{mno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable(name="mno") int mno) {
		logger.info("delete(mno={})",mno);
		
		int result = messageService.delete(mno);
		logger.info("result Delete ={}",result);
		ResponseEntity<String> entity = null;
		if(result == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
		
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateread(int mno, RedirectAttributes re) {
		logger.info("update = {}",mno);
		
		int result = messageService.updateread(mno);
		if(result == 1) {
			re.addFlashAttribute("updateResult", "success");
		}
				
		return "redirect:list";
	}
	
//	@RequestMapping(value = "{mno}", method = RequestMethod.PUT)
//	public ResponseEntity<Integer> update(@PathVariable(name="mno") int mno){
//		logger.info("update controller 실행 = (mno={})", mno);
//		
//				
//		int result = messageService.updateread(mno);
//		ResponseEntity<Integer> entity = null;
//		if(result == 1) {
//			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
//		}else {
//			entity = new ResponseEntity<Integer>(result, HttpStatus.BAD_REQUEST);
//		}
//		
//		
//		return entity;
//	}

}
