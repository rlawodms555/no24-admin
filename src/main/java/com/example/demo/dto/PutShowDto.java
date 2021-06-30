package com.example.demo.dto;

import java.util.Date;

import com.example.demo.vo.Actor;
import com.example.demo.vo.Category;
import com.example.demo.vo.Place;
import com.example.demo.vo.PutShow;
import com.example.demo.vo.Show;
import com.example.demo.vo.ShowActor;

import lombok.Data;

@Data
public class PutShowDto {

	// Category
	private Category category;
	//private String categoryName;
	//private int topCategoryNo;
	
	// Show
	private Show show;
	/*
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
	*/
	
	// PutShow
	private PutShow putShow;
	/*
	private int putShowNo;
	private String showDay;
	private String showStartTime;
	*/
	
	// place
	private Place place;
	/*
	private String localName;
	private String placeName;
	private String address;
	private int seatCapacity;
	*/
	
	// 2개 테이블
	//private int actorNo;
	//private String actorName;
	private Actor actor;
	private ShowActor showActor;

}
