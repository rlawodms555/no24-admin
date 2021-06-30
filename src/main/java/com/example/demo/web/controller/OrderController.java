package com.example.demo.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.OrderService;
import com.example.demo.service.ShowService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@Autowired
	ShowService showService;
	
	@RequestMapping("/list.do")
	public String list(@RequestParam(name = "opt", required = false, defaultValue = "id") String opt,
						@RequestParam(name = "keyword", required = false) String keyword,
						@RequestParam(name = "sort", required = false, defaultValue = "date") String sort,
						@RequestParam(name = "pageNo", required = false, defaultValue = "1") int pageNo,
						@RequestParam(name = "rows", required = false, defaultValue = "10") int rows,
						Model model) {

		// 공지 검색조건을 저장하는 Map객체 생성
		Map<String, Object> condition = new HashMap<String, Object>();

		if (opt != null && !opt.isEmpty() && keyword != null && !keyword.isEmpty()) {
			condition.put("opt", opt);
			condition.put("keyword", keyword);
		}
		
		condition.put("pageNo", pageNo);
		condition.put("rows", rows);
		condition.put("begin", (pageNo - 1) * rows + 1);
		condition.put("end", pageNo * rows);
		condition.put("sort", sort);
		
		// 뷰에 표시할 주문 정보와 페이징 정보를 조회한다.
		Map<String, Object> resultMap = orderService.getOrdersByCondition(condition);

		model.addAttribute("page", resultMap.get("pagination"));
		model.addAttribute("orders", resultMap.get("orders"));
		
		return "order/list";
	}

	@RequestMapping("/detail.do")
	public String detail(@RequestParam("orderNo") int orderNo, Model model) {

		return "order/detail";
	}
	
	@RequestMapping("/stats.do")
	public String stats(Model model) {
		
		model.addAttribute("categories", showService.getAllTopCategories());
		return "order/stats";
	}
	
}
