package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.ReviewDto;
import com.example.demo.vo.Review;

@Mapper
public interface ReviewDao {

	// 페이지네이션 관련 메소드 2개
	int getTotalCountByCondition(Map<String, Object> condition);
	List<ReviewDto> getReviewsByCondition(Map<String, Object> condition);
	
	Review getReviewByNo(int reviewNo);
	//void insertReview(Review review);	// ???
	void updateReview(Review review);	// 삭제된 리뷰를 보관해야 하므로 Y를 N으로 바꿀 것임
}
