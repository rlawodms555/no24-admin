package com.example.demo.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	/*
	 * HandlerInterceptor
	 * 		- boolean preHandle() 메소드는 요청핸들러 메소드 실행전에 실행되는 메소드다.
	 * 		- 스프링 MVC는 preHandle() 메소드가 true를 반환하면 요청핸들러 메소드를 실행하고, 
	 * 		  false를 반환하면 요청핸들러 메소드를 실행하지 않는다.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if (session.getAttribute("LOGINED_USER") == null) {
			response.sendRedirect("/no24-admin/loginform.do?error=deny");
			// 요청핸들러 메소드가 실행되지 않게 함
			return false;
		}
		// 요청핸들러 메소드가 실행되게 함
		return true;
	}
}
