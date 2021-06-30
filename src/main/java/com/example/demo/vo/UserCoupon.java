package com.example.demo.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserCoupon {

	private int historyNo;
	private int no;
	private int userNo;
	private String disabled;
	private Date usedDate;
	private String name;
	private int price;
	private Date stratDate;
	private Date endDate;
	private String status;
}
