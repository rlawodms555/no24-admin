package com.example.demo.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Coupon {

	private int no;
	private String name;
	private int price;
	private Date startDate;
	private Date endDate;
	private String status;
}
