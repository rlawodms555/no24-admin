package com.example.demo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Review {

	private int no;
	private int showNo;
	private int userNo;
	private int rating;
	private String content;
	private String ableStatus;
	private Date createdDate;
	
	// 개행문자(\n) 줄바꿈(<br>) 변환 처리
	public String getHtmlContent() {
		if (content != null) {
			return content.replace("\n", "<br>");
		}
		return null;
	}
	
}
