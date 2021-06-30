package com.example.demo.web.advice;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

@ControllerAdvice
public class CommonControllerAdvice {

	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	/*
	 * @InitBinder
	 * 		- 컨트롤러로 들어오는 요청에 대해서 추가적인 설정을 하고 싶을 때 사용할 수 있다.
	 * 		- 객체의 특정 필드에 요청파라미터값이 바인딩되거나 바인딩되지 않도록 설정할 수 있다.
	 * 		- 특정타입의 객체에 대한 요청파라미터값의 바인딩을 설정할 수 있다.
	 * 			Date타입의 객체에 대해서 SimpleDateFormat으로 문자열을 Date로 변환한 후 바인딩되도록 설정할 수 있다.
	 * 			String타입의 객체에 대해서 StringTrimmerEditor로 문자열의 불필요한 공백을 제거한 후 바인딩되도록 설정할 수 있다.
	 * 		- @ControllerAdvice 어노테이션이 부착된 클래스에서 정의된 @InitBinder 설정은 모든 컨트롤러에 적용된다.
	 * 		- 특정 컨트롤러에 안에서 정의된 @InitBinder 설정은 해당 컨트롤러 안에서만 적용된다.
	 */
	@InitBinder
	public void initBinder(WebDataBinder webDateBinder) {
	// 바인딩을 설정
		// 지정한 값을 제외하고 나머지 값들만 폼객체의 필드에 바인딩된다.
		//webDateBinder.setDisallowedFields("id");
		// 지정한 값들만 Form객체의 필드에 바인딩된다.
		//webDateBinder.setAllowedFields("name", "password", "tel", "email");
	
	// 포맷터를 설정
		// 특정 포맷으로 작성된 숫자나 날짜 형식의 문자열 데이터를 자바의 데이터타입으로 변환해주는 포맷터를 설정한다.
		
		// 바인딩되는 필드의 타입이 Date타입인 경우 "yyyy-MM-dd"패턴의 문자열은 Date타입으로 변환한다.
		webDateBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
		// 바인딩되는 필드의 타입이 String타입인 경우 문자열에서 불필요한 공백을 제거한다.
		webDateBinder.registerCustomEditor(String.class, new StringTrimmerEditor(false));
	}
}
