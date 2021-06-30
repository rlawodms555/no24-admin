package com.example.demo.web.resolver;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.example.demo.util.SessionUtils;
import com.example.web.annotation.LoginUser;

public class LoginUserAnnotationArgumentResolver implements HandlerMethodArgumentResolver {

	// 지금 실행되는 요청핸들러 메소드의 매개변수 중에서 
	// 사용자정의 ArgumentResolver의 적용대상이 되는 매개변수인 경우 true가 반환된다.
	// - LoginUserAnnotationArgumentResolver의 경우에는 @LoginUser 어노테이션 정보가 
	//   존재하는지 여부로 true/false를 반환하게 된다.
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		// 요청 핸들러 메소드의 매개변수에 @LoginUser 어노테이션정보가 존재하는지 조회한다.
		// 어노테이션 정보가 존재하면 LoginUser 어노테이션 객체가 반환되고, 
		// 어노테이션 정보가 존재하지 않으면 null이 반환된다.
		return parameter.getParameterAnnotation(LoginUser.class) != null;
		
		/*
		LoginUser loginUserAnnotation = parameter.getParameterAnnotation(LoginUser.class);
		if (loginUserAnnotation != null) {
			return true;
		} else {
			return false;
		}
		*/
	}

	// LoginUserAnnotationArgumentResolver의 적용대상으로 확인된 매개변수에게
	// (supportsParameter() 메소드가 true를 반환한 경우) 세션객체에서 로그인된 사용자정보를 
	// 조회해서 반환한다.
	// 이 메소드가 반환하는 값이 LoginUserAnnotationArgumentResolver의 적용대상으로 
	// 확인된 매개변수에게 전달된다.
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		
		return SessionUtils.getAttribute("LOGINED_USER");
		
		/*
		User user = (User) SessionUtils.getAttribute("LOGINED_USER");
		
		return user;
		*/
	}

}
