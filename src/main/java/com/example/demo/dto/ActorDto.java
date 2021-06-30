package com.example.demo.dto;

import lombok.Data;

@Data
public class ActorDto {
	// 두 테이블을 합쳤음
	private int putShowNo;
	private int actorNo;
	private String actorName;
}
