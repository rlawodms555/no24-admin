package com.example.demo.web.advice;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/*
 * @ControllerAdvice
 * 		- 모든 컨트롤러에서 공통으로 사용되는 예외처리 등의 작업이 정의된 클래스에 부착하는 어노테이션이다.
 * 		- @ControllerAdvice가 부착된 클래스에서 정의한 내용은 모든 컨트롤러의 요청핸들러 메소드가 
 * 		    실행될 때 영향을 미친다.
 * 		- 주로, 예외처리등의 작업을 구현해 놓는다.
 */
@ControllerAdvice
public class ExceptionHandlerControllerAdvice {

	/*
	 * @ExceptionHandler
	 * 		- 예외처리를 지원하는 어노테이션이다.
	 * 		- 지정된 예외가 발생했을 때 예외처리 메소드가 실행된다.
	 * 		- @ExceptionHandler(DataAccessException.class)라고 설정하면 
	 * 		  DataAccessException 및 그 하위 예외가 발생했을 때(요청처리 과정에서) 
	 * 		    예외처리 메소드가 실행된다.
	 * 		- 요청처리 메소드에 예외클래스 타입의 매개변수를 정의하면, 요청처리과정에서 발생한 해당 예외가 전달되고, 
	 * 		    에러페이지에서도 예외가 자동으로 전달된다.
	 * 		  (단, 에러 페이지에 <%@ page isErrorPage="true" %>로 되어 있어야 한다.)
	 * 		- 하나의 ControllerAdvice 클래스에 다양한 종류의 예외를 처리할 수 있도록 여러 개의 예외처리 메소드를 정의할 수 있다.
	 * 		- 만약, 발생된 예외와 연관된 @ExceptionHandler 설정이 여러개 매칭되는 경우에는 발생한 예외와 가장 가까운 예외가 지정되어 있는 
	 * 		  @ExceptionHandler가 그 예외를 처리한다.
	 */
	@ExceptionHandler(DataAccessException.class)
	public String handleDataAccessException(DataAccessException ex) {
		ex.printStackTrace();
		return "error/database";
	}
	
	// 예상하지 못한 예외가 발생했을 때를 대비한 예외처리 메소드용으로 정의한 것
	@ExceptionHandler(Exception.class)
	public String handleException(Exception ex) {
		ex.printStackTrace();
		return "error/server";
	}
}
