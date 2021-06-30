package com.example.demo.exception;

public class PasswordMismatchException extends No24exception {

	public PasswordMismatchException() {}
	
	public PasswordMismatchException(String message) {
		super(message);
	}
	
	public PasswordMismatchException(String message, Throwable cause) {
		super(message, cause);
	}
}
