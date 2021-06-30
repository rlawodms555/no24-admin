package com.example.demo.web.controller.api;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.OrderService;

@RestController
@RequestMapping("/api/order")
public class OrderAjaxController {

	@Autowired
	OrderService orderService;
	
	@RequestMapping("/orderStats.do")
	public List<Integer> getOrdersCreatedDateStats(@RequestParam("categoryNo") int categoryNo) {
		return orderService.getOrdersCreatedDateStats(categoryNo);
	}
	
	@RequestMapping("/priceStats.do")
	public List<Integer> getTotalPaymentPriceStats(@RequestParam("categoryNo") int categoryNo) {
		return orderService.getTotalPaymentPriceStats(categoryNo);
	}
	
}
