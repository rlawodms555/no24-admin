package com.example.demo.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.example.demo.vo.Coupon;
import com.example.demo.vo.Order;
import com.example.demo.vo.OrderItem;
import com.example.demo.vo.PutShow;
import com.example.demo.vo.Show;
import com.example.demo.vo.ShowSeat;
import com.example.demo.vo.ShowUserPointHistories;
import com.example.demo.vo.User;

import lombok.Data;

@Data
public class OrderDto {

	// Order
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
	
	
	// OrderItem
	private int orderItemNo;
	private int seatNo;
	
	// User
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
	private int availablePoint;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date userCreatedDate;
	
	// PutShow
	private int showNo;
	private String showDay;
	private String showStartTime;
	
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
	
	//private ShowUserPointHistories point;
	//private Coupon coupon;
	//private ShowSeat showSeat;
}
