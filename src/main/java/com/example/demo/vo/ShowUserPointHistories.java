package com.example.demo.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ShowUserPointHistories {

	private int no;
	private int userNo;
	private int pointAmount;
	private String content;
	private Date createdDate;
}
