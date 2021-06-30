package com.example.demo.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class UserDto {

	private int no;
	private String name;
	private String id;
	private String password;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String tel;
	private String email;
	private String address;
	private String emailReceivingConsent;
	private String smsReceivingConsent;
	private String availablePoint;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;
	private String role;
	private String ableStatus;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date withdrawalDate;
}
