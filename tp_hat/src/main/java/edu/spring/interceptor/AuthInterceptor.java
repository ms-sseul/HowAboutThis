package edu.spring.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AuthInterceptor extends HandlerInterceptorAdapter{
	private final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("preHandle() 호출");
		
		// 로그인이 되어 있는 경우 user/register 콘트롤러 실행
		// 로그인이 되어 있지 않는 경우 -> 로그인 양식 페이지로 이동
		
		boolean result = false;
		
		HttpSession session = request.getSession();
		Object loginId = session.getAttribute("loginId");
		if(loginId != null) { // 로그인 되어 있는 경우
			logger.info("로그인 상태 : {}", loginId);
			result = true;
		} else { // 로그인 안되어 있는경우
			logger.info("로그아웃 상태");
			
			String target = getRedirectTarget(request);
			response.sendRedirect(target);
			result = false;
		}
		
		return result;
	}
	
	private String getRedirectTarget(HttpServletRequest request) throws Exception {
		// ex03/member/login?url=http://... 로그인 페이지 주소를 리턴
		
		String requestUrl = request.getRequestURI().toString();
		logger.info("요청주소 : " + requestUrl);
		
		String queryString = request.getQueryString();
		logger.info("질의 문자열 : " + queryString);
		
		String targetUrl = ""; // 로그인 끝난 후 이동할 페이지
		if (queryString == null) {
			targetUrl = requestUrl;
		} else {
			targetUrl = requestUrl + "?" + queryString;
		}
		
		String result = "/controller/user/login?url=" + URLEncoder.encode(targetUrl, "utf-8");
		logger.info("target : " + result);
		
		return result;
	}
	
	
}
