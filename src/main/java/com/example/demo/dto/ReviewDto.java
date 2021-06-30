package com.example.demo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDto {

	// Review
	private int no;
	private int showNo;
	private int userNo;
	private int rating;
	private String content;
	private String ableStatus;
	private Date createdDate;
	
	// User
	private String userName;
	private String id;
	private String password;
	private String birth;
	private String tel;
	private String email;
	private String address;
	private String emailReceivingConsent;
	private String smsReceivingConsent;
	private int availablePoint;
	private Date userCreatedDate;
	
	// Show
	private int categoryNo;
	private String showName;
	private int viewingNo;
	private String runningTime;
	private String posterImg;
	private Date beginDate;
	private Date endDate;
	private int placeNo;
	private String attentionImg;
	private String saleImg;
	private String showDetailImg;
	private Date showCreatedDate;
	
	/*
	// PutShow
	private int putShowNo;
	private String showDay;
	private String showStartTime;
	
	// TicketOrder
	private int ticketOrderNo;
	private int amount;
	private String status;
	private int totalOrderPrice;
	private int usedPoint;
	private int totalPaymentPrice;
	private String paymentMethod;
	private int bankNo;
	private Date createdDate;
	private int couponHistoryNo;
	
	// TicketOrderItem
	private int ticketOrderItemNo;
	private int seatNo;
	*/
}
