package edu.spring.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.domain.Message;
import edu.spring.domain.Reply;
import edu.spring.service.BoardService;
import edu.spring.service.MessageService;


@Controller
@RequestMapping(value = "message")
public class MessageController {
	private final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired private MessageService messageService;
	
	
	@RequestMapping(method = RequestMethod.POST, value = "insert")
	public String createMessage(Message message, Model model){
		logger.info("createMessage 호출");
		
		messageService.insert(message);
//		logger.info("createMessage{()} 호출",message.toString());
//		
//		int result = messageService.insert(message);
//		logger.info("insert 결과 = {}",result);
//		
//		ResponseEntity<Integer> entity = null;
//		if(result == 1) {
//			entity = new ResponseEntity<Integer>(
//					result, HttpStatus.OK);
//		}else {
//			entity = new ResponseEntity<Integer>(result, HttpStatus.BAD_REQUEST);
//		}
//		
		return "redirect:message";
	}
	
//	public String creageMessage(Model model) {
//		logger.info("createMessage () 호출");
//		
//		
//		
//		
//		return "/user/message";
//	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void readMessage(Model model){
//		logger.info("readMessage = (mno={})", mno);
//		
//		List<Message> list = messageService.read(mno);
//		
//		ResponseEntity<List<Message>> entity = new ResponseEntity<List<Message>>(list, HttpStatus.OK);
		logger.info("readMessage() 호출");
		
		List<Message> list = messageService.read();
		model.addAttribute("messageList",list);
		
		
	}
	
//	@RequestMapping(value = "{mno}", method = RequestMethod.GET )
//	public ResponseEntity<Integer> readMnoOne(
//			@PathVariable(name = "mno") int mno
//		){
//		logger.info("readSelectOne = ({})",mno);
//		
//		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(mno,HttpStatus.OK);
//				
//		return entity;
//				
//	}
	
	@RequestMapping(value = "readMnoOne", method = RequestMethod.GET)
	public void readMnoOne(Model model, int mno) {
		logger.info("message(mno={}) 호출", mno);
		
		Message messageOne = messageService.selectOne(mno);
		
		model.addAttribute("messageOne",messageOne);
		
	}
	
	
//	@RequestMapping(value = "delete", method = RequestMethod.GET)
//	public String deleteMessage(int mno, RedirectAttributes re){
//		logger.info("delete controller = {}",mno);
//		
//		int result = messageService.delete(mno);
//		if(result == 1) {
//			re.addFlashAttribute("deleteResult", "success");
//			re.addFlashAttribute("deleteMno", mno);
//		}
//				
//		
//		return "redirect:list";		
//	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int mno, RedirectAttributes re) {
		logger.info("delete(mno={})",mno);
		
		int result = messageService.delete(mno);
		if(result == 1) {
			re.addFlashAttribute("deleteResult","success");
			re.addFlashAttribute("deleteMno", mno);
		}
		
		return "redirect:list";
	}
	
//		
//	@RequestMapping(value = "update", method = RequestMethod.POST)
//	public String updateMessage(Message message, RedirectAttributes re){
//		logger.info("updateMessage({}) POST 호출",message.toString());		
//		
//		
//		
//		int result = messageService.update(message);
//		ResponseEntity<Integer> entity = null;
//		if(result == 1) {
//			entity = new ResponseEntity<Integer>(mno,HttpStatus.OK);
//		}else {
//			entity = new ResponseEntity<Integer>(mno,HttpStatus.BAD_REQUEST);
//		}
//		
//		return entity;		
//	}
	
	public String update(int mno, RedirectAttributes re) {
		logger.info("update = {}",mno);
		
		int result = messageService.update(mno);
		if(result == 1) {
			re.addFlashAttribute("updateResult", "success");
		}
				
		return "redirect:list";
	}
	

}
