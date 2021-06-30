package com.example.demo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Notice {

	private int no;
	private String type;
	private String title;
	private String content;
	private	Date createdDate;
	private int views;
	
	// 개행문자(\n) 줄바꿈(<br>) 변환 처리
	public String getHtmlContent() {
		if (content != null) {
			return content.replace("\n", "<br>");
		}
		return null;
	}
}
