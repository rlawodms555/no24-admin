package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ReviewDao;
import com.example.demo.dto.Pagination;
import com.example.demo.dto.ReviewDto;
import com.example.demo.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDao reviewDao;
	
	@Override
	public Map<String, Object> getReviewDtos(Map<String, Object> condition) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		// 검색조건에 해당하는 리뷰DTO의 개수를 조회한다.
		int totalRows = reviewDao.getTotalCountByCondition(condition);
		
		// 페이지정보 생성
		Pagination pagination = new Pagination((Integer)condition.get("pageNo"), totalRows);
		
		// 검색조건에 해당하는 리뷰DTO를 조회한다.
		List<ReviewDto> reviewDtos = reviewDao.getReviewsByCondition(condition);
		
		result.put("reviewDtos", reviewDtos);
		result.put("pagination", pagination);
		
		return result;
	}
	
	@Override
	public Review getReviewByNo(int reviewNo) {
		return reviewDao.getReviewByNo(reviewNo);
	}

	/*
	@Override
	public void insertReview(Review review) {
		reviewDao.insertReview(review);
	}
	*/

	@Override
	public void updateReview(Review review) {
		reviewDao.updateReview(review);
	}
	
}
