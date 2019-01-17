package edu.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.UsesSunHttpServer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.domain.User;
import edu.spring.service.UserService;

@Controller
@RequestMapping(value = "user")
public class UserController {
	
	private final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired UserService userService;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void login(Model model, String url) {
		logger.info("url=({})", url);
		if(url != null) {
			model.addAttribute("targetUrl", url);
		}
	}
	
	@RequestMapping(value = "login-post", method = RequestMethod.POST)
	public void loginPost (User user, String url, Model model) {
		logger.info("loginPost({}) 호출", user);
		
		// preHandle 위치
		User result = userService.loginCheck(user);
		model.addAttribute("loginResult", result);
		logger.info("result = ({})", result);
		
		// 여기서 디비에 체크(true / flase) 하고 model에 저장된 값 보내기
		
		// postHandle 위치
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(User user, Model model, RedirectAttributes rttr) {
		logger.info("register({}) 호출");
		logger.info("user({})", user);
		int result = 0;
		try {
			result = userService.insert(user);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		rttr.addFlashAttribute("msg", "가입시 사용가능한 이메일로 인증해 주세요");
		logger.info("user = ({})", result);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(User user, Model model, RedirectAttributes rttr) {
		logger.info("emailConfirm({})호출", user);
		
		/*User certiCheck = new User();
		if(certiCheck.getCertification() == "n") {
			rttr.addFlashAttribute("msg", "이메일 인증이 확인되지 않았습니다. 이메일 인증을 다시 해주세요");
			return "redirect:/";
		}*/
		
		// model.addAttribute("certiCheck", certiCheck);
		String userId = user.getUserId();
		
		logger.info("userId = ({})", userId);
		userService.certiUpdate(userId);
		
		model.addAttribute("user_Id", user.getUserId());
		return "/user/emailConfirm";
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("logout() 호출");
		logger.info("loginId: {}", session.getAttribute("loginId"));
		
		session.invalidate();
		
		return "redirect:/"; // 메인 페이지로 이동
	}
	
	@RequestMapping(value = "idcheck", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> idcheck(User user) {
		
		User result  = userService.loginCheck(user);
		
		logger.info("result({})", result);

		ResponseEntity<String> entity = null;
		if (result != null) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		return entity;
	}
	
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public void profile(User user, HttpSession session, Model model) {
		// 후원한 페이지, 개인 보낸 쪽지, 개인정보 사항 select 해서 리스트로 출력해줘야함.
		logger.info("profile() 호출");
		logger.info("loginId: {}", session.getAttribute("loginId"));
		
		logger.info("userId:({})", user.getUserId());
		String userId = (String) session.getAttribute("loginId");
		
		User result = userService.selectOne(userId);
		
		String userEamil = result.getUserEmail();
		String phone = result.getPhone();
		
		model.addAttribute("user_email", userEamil);
		model.addAttribute("user_phone", phone);
		
	}
	@RequestMapping(value = "profile", method = RequestMethod.POST)
	public void profilePost(User user, HttpSession session) {
		logger.info("userId: {}", session.getAttribute("loginId"));
		logger.info("user = ({})", user);
		
		String userId = (String) session.getAttribute("loginId");
		User updateUser = new User(userId, user.getUserPwd(), user.getUserEmail(), user.getPhone(), 0, "y");
		
		int result = userService.update(updateUser);
		
		logger.info("result = ({})", result);
	}
	

} // end class UserController
