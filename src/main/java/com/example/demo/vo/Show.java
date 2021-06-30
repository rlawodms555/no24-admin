package com.example.demo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Show {

	private int no;
	private int categoryNo;
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
}
