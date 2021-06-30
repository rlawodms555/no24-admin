package com.example.demo.exception;

// 회원가입 때 필요한 exception이라 관리자가 쓸 일은 없는 거 같네
public class DuplicatedUserIdException extends No24exception {

	public DuplicatedUserIdException() {}
	
	public DuplicatedUserIdException(String message) {
		super(message);
	}
	
	public DuplicatedUserIdException(String message, Throwable cause) {
		super(message);
	}
}
