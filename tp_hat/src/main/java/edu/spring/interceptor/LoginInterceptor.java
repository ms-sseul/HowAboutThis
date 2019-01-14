package edu.spring.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import edu.spring.domain.User;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	private final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("preHandle() 호출");
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("loginId");
		
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {
		
		logger.info("postHandle() 호출");
		
		String target = request.getParameter("queryString");
		logger.info("target : ({})", target);
		Map<String, Object> model = mav.getModel();
		
		User result = (User) model.get("loginResult");
		if(result != null) { // 로그인 성공
			logger.info("로그인 성공");
			
			request.getSession().setAttribute("loginId", result.getUserId());
			response.sendRedirect(target);
		} else { // 로그인 실패
			logger.info("로그인 실패");
			
			response.sendRedirect("/controller/user/login?url=" + target);
		}
		
	}

} // end class LoginInterceptor
