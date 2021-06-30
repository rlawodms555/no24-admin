package com.example.demo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Order {

	private int no;
	private int userNo;
	private int putShowNo;
	private int amount;
	private String status;
	private int totalOrderPrice;
	private int usedPoint;
	private int totalPaymentPrice;
	private String paymentMethod;
	private int bankNo;
	private String bankCardAccount;
	private Date createdDate;
	private int couponHistoryNo;
	
}
