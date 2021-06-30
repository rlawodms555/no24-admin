package com.example.demo.exception;

public class UnacceptableRoleException extends No24exception {

	public UnacceptableRoleException() {}
	
	public UnacceptableRoleException(String message) {
		super(message);
	}
	
	public UnacceptableRoleException(String message, Throwable cause) {
		super(message, cause);
	}
}
