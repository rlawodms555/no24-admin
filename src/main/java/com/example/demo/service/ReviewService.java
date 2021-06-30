package com.example.demo.service;

import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.example.demo.vo.Review;

@Transactional
public interface ReviewService {

	Map<String, Object> getReviewDtos(Map<String, Object> condition);
	
	Review getReviewByNo(int reviewNo);
	
	//void insertReview(Review review);	// 관리자 insert 기능... 관리자한테도 USER 권한이 있긴 한데... 대댓글
	void updateReview(Review review);	// 삭제된 리뷰를 보관해야 하므로 Y를 N으로 바꿀 것임
}
