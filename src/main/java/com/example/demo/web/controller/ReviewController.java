package com.example.demo.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ReviewService;
import com.example.demo.vo.Review;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	@RequestMapping("/list.do")
	public String list(@RequestParam("status") String status,
			@RequestParam(name = "opt", required = false, defaultValue = "id") String opt,
			@RequestParam(name = "keyword", required = false) String keyword,
			@RequestParam(name = "sort", required = false, defaultValue = "date") String sort,
			@RequestParam(name = "pageNo", required = false, defaultValue = "1") int pageNo,
			@RequestParam(name = "rows", required = false, defaultValue = "10") int rows,
			Model model) {
		
		// 리뷰 검색 조건을 저장하는 Map객체 생성
		Map<String, Object> condition = new HashMap<String, Object>();
		// 쿼리스트링으로 무조건 오니까 담음
		condition.put("status", status);
		
		if (opt != null && !opt.isEmpty() && keyword != null && !keyword.isEmpty()) {
			condition.put("opt", opt);
			condition.put("keyword", keyword);
		}
		condition.put("pageNo", pageNo);
		condition.put("rows", rows);
		condition.put("begin", (pageNo - 1)*rows + 1);
		condition.put("end", pageNo*rows);
		condition.put("sort", sort);
		
		// 뷰에 표시할 리뷰 정보와 페이지네이션 정보를 조회한다.
		Map<String, Object> resultMap = reviewService.getReviewDtos(condition);
				
		// 뷰에 전달할 데이터를 모델에 담기
		model.addAttribute("page", resultMap.get("pagination"));
		// 검색 조건에 해당하는 리뷰목록(역으로 확인해보면 DTO로 담음)
		model.addAttribute("reviewDtos", resultMap.get("reviewDtos"));
		// status를 condition에서 가져와야 하나?
		model.addAttribute("status", condition.get("status"));
		
		return "review/list";
	}
	
	// 실상은 delete 기능
	@RequestMapping("/updateReviewStatus.do")
	public String updateReview(@RequestParam("status") String status, 
			@RequestParam("sort") String sort,
			@RequestParam("reviewNo") List<Integer> reviewNoList) {
		
		for (int reviewNo : reviewNoList) {
			Review review =  reviewService.getReviewByNo(reviewNo);
			review.setAbleStatus("N");
			reviewService.updateReview(review);
		}
		
		return "redirect:list.do?status=" + status + "&sort=" + sort;
	}
}
