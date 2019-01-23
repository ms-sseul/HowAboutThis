package edu.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.domain.Project;
import edu.spring.domain.User;
import edu.spring.service.UserService;
import edu.spring.util.MailHandler;
import edu.spring.util.TempKey;

@Controller
@RequestMapping(value = "user")
public class UserController {
	
	private final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired UserService userService;
	
	@Autowired edu.spring.persistence.ProjectDao ProjectDao;
	@Autowired JavaMailSender mailsender;
	
	@Autowired private BCryptPasswordEncoder encode;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void login(Model model, @RequestParam String url) {
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
		
		return "redirect:/project/main"; // 메인 페이지로 이동
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
	
	@RequestMapping(value = "pwdCheck", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> pwdCheck(User user) {
		
		// 유저의 아이디 체크
		User result  = userService.loginCheck(user);
		logger.info("result({})", result);
		
		// 디비에 저장되어있는 유저의 비밀번호
		String userPwd = result.getUserPwd();
		logger.info("userPwd = ({})", userPwd);
		
		// 브라우저에서 전달받은 비밀번호
		String requestPwd = user.getUserPwd();
		logger.info("requestPwd = ({})", requestPwd);
		
		String encPwd = encode.encode(result.getUserPwd());
		
		ResponseEntity<String> entity = null;
		if(encode.matches(requestPwd, userPwd)) {
			logger.info("비밀번호 일치");
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			logger.info("암호화된 비밀번호 = ({}): " + encPwd);
		} else {
			logger.info("비밀번호 불일치");
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "emailcheck", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> emailCheck(User user) {
		
		User result  = userService.loginCheck(user);
		
		String userEmail = result.getUserEmail();
		
		String reponseEmail = user.getUserEmail();
		logger.info("userEmail = ({})", userEmail);
		logger.info("reponseEmail = ({})", reponseEmail);
		
		logger.info("result({})", result);

		ResponseEntity<String> entity = null;
		if (userEmail.equals(reponseEmail)) {
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
		
		List<Project> myProjects = ProjectDao.showMyProject(userId);
		
		model.addAttribute("user", result);
		model.addAttribute("myProjects", myProjects);
		
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
	
	@RequestMapping(value = "point-charge", method = RequestMethod.GET)
	public void pointCharge(HttpSession session, Model model, User user) {
		logger.info("point-charge() 호출");
		
		String userId = (String) session.getAttribute("loginId");
		
		User result = userService.selectOne(userId);
		
		String phone = result.getPhone();
		logger.info("userPhone = ({})", phone);
		
		logger.info("userId({})", userId);
		model.addAttribute("userId", userId);
		model.addAttribute("phone", phone);
	}
	
	@RequestMapping(value = "point-charge", method = RequestMethod.POST)
	public String pointChargePost(User user, HttpSession session) {
		logger.info("pointChargePost() 호출");
		logger.info("userPointChargePost = ({})", user);
		String userId = (String) session.getAttribute("loginId");
		
		User beforeUser = userService.selectOne(userId);
		int beforePoint = beforeUser.getPoint();
		logger.info("beforePoint = ({})", beforePoint);
		
		int nowPoint = user.getPoint();
		logger.info("nowPoint = ({})", nowPoint);
		
		int resultPoint = beforePoint + nowPoint;
		logger.info("resultPoint = ({})", resultPoint);
		
		User updateUser = new User(userId, null, null, null, resultPoint, null);
		
		int result = userService.pointUpdate(updateUser);
		logger.info("resultUser = ({})", result);
		
		return "redirect:/user/profile";
	}
	
	@RequestMapping(value = "find-password", method = RequestMethod.GET)
	public void findPwd() {
		logger.info("findPwd() 호출");
	}
	
	@RequestMapping(value = "find-password", method = RequestMethod.POST)
	public String findPwdPost(User user, Model model) {
		logger.info("findPwdPost() 호출");
		
		String userId = user.getUserId();
		String email = user.getUserEmail();
		
		logger.info("id = ({})", userId);
		logger.info("email = ({})", email);
		
		String key = new TempKey().getKey(10, false); // 인증키 생성
		logger.info("key = ({})", key);
		
		// 비밀번호 변경 하고나서 메일발송
		User newPwd = new User(userId, key, null, null, 0, null);
		
		int result = userService.passwordUpdate(newPwd);
		logger.info("result = ({})", result);
		
		User newUser = userService.selectOne(userId);
		logger.info("newUserPwd = ({})", newUser.getUserPwd());
		
		
		MailHandler sendMail;
		try {
			sendMail = new MailHandler(mailsender);
			sendMail.setSubject("이거어때 서비스 비밀번호 찾기 인증이메일!");
			sendMail.setText(new StringBuffer().append("<h1>메일 인증</h1>")
					.append("<h2>변경된 임시 비밀번호는 : " + key + " 입니다.</h2>")
					.append("<a href='https://localhost:8443/controller/user/pwd-emailConfirm?userId=").append(user.getUserId())
					.append("' target='_blenk'>이메일 인증 확인</a>").toString());
			sendMail.setFrom("myulchi0522@gmail.com", "김상현");
			sendMail.setTo(user.getUserEmail());
			sendMail.send();
			model.addAttribute("user_Id", userId);
			model.addAttribute("user_email", email);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("find-password() 에러발생");
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "pwd-emailConfirm", method = RequestMethod.GET)
	public String pweEmailConfirm(User user, Model model, RedirectAttributes rttr) {
		String userId = user.getUserId();
		logger.info("userId = ({})", userId);
		
		model.addAttribute("user_Id", user.getUserId());
		
		return "/user/pwd-emailConfirm";
	}

} // end class UserController
