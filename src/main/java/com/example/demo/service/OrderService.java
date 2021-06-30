package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dto.OrderDto;
import com.example.demo.vo.Bank;
import com.example.demo.vo.Coupon;
import com.example.demo.vo.Order;
import com.example.demo.vo.ShowUserPointHistories;
import com.example.demo.vo.UserCoupon;

@Transactional
public interface OrderService {

	Map<String, Object> getOrdersByCondition(Map<String, Object> condition);
	
	// 월 기준 주문 횟수 통계
	List<Integer> getOrdersCreatedDateStats(int categoryNo);
	
	// 월 기준 주문 금액 통계
	List<Integer> getTotalPaymentPriceStats(int categoryNo);
	
	/*
	List<UserCoupon> getUserCoupon(int userNo);
	Coupon getCouponPrice(int couponNo);
	void updateCoupon(int couponNo);
	
	void updateShowSeat(Map<String, Object> showSeat);
	
	void insertPointHistories(ShowUserPointHistories pointHistories);

	Bank getBank(String bankName);
	
	void insertOrder(Order order);
	
	int getOrderNo();
	
	void insertTicketOrderItems(Map<String, Object> ticketOrderItems);
	*/
	
	OrderDto getAllAboutOrder(int userNo);
}
