package com.example.demo.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class UserRole {

	private int no;
	private String role;
	private String ableStatus;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date withdrawalDate;
}
