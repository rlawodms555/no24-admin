package com.example.demo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ShowDto {

	// show
	private int no;
	private int categoryNo;	// categoryNo를 통해서 Category를 Map에 담을 수 있음
	private String name;
	private int viewingNo;
	private String runningTime;
	private String posterImg;
	private Date beginDate;
	private Date endDate;
	private int placeNo;
	private String attentionImg;
	private String saleImg;
	private String showDetailImg;
	private Date createdDate;
	
	// place
	private String localName;
	private String placeName;
	private String address;
	private int seatCapacity;
	
	// viewingGrade
	private int viewingGradeSd;
	private String viewingGradeName;
}
