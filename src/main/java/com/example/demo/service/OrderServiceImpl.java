package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.OrderDao;
import com.example.demo.dao.UserDao;
import com.example.demo.dto.OrderDto;
import com.example.demo.dto.Pagination;
import com.example.demo.vo.Bank;
import com.example.demo.vo.Coupon;
import com.example.demo.vo.Order;
import com.example.demo.vo.ShowUserPointHistories;
import com.example.demo.vo.UserCoupon;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	OrderDao orderDao;
	
	@Autowired
	UserDao userDao;

	@Override
	public Map<String, Object> getOrdersByCondition(Map<String, Object> condition) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		// 검색조건에 해당하는 주문(Order만) 횟수를 조회한다.
		int totalRows = orderDao.getTotalCountByCondition(condition);
		
		// 페이지정보 생성
		Pagination pagination = new Pagination((Integer)condition.get("pageNo"), totalRows);
		
		// 검색조건에 해당하는 주문목록을 조회한다.
		List<OrderDto> orderDtos = orderDao.getOrdersByCondition(condition);
		
		result.put("orders", orderDtos);
		result.put("pagination", pagination);
		
		return result;
	}
	
	@Override
	public List<Integer> getOrdersCreatedDateStats(int categoryNo) {
		return orderDao.getOrdersCreatedDateStats(categoryNo);
	}
	
	@Override
	public List<Integer> getTotalPaymentPriceStats(int categoryNo) {
		return orderDao.getTotalPaymentPriceStats(categoryNo);
	}
	
	/*
	@Override
	public List<UserCoupon> getUserCoupon(int userNo) {
		return orderDao.getUserCoupon(userNo);
	}

	@Override
	public Coupon getCouponPrice(int couponNo) {
		return orderDao.getCouponPrice(couponNo);
	}

	@Override
	public void updateCoupon(int couponNo) {
		orderDao.updateCoupon(couponNo);
	}

	@Override
	public void updateShowSeat(Map<String, Object> showSeat) {
		orderDao.updateShowSeat(showSeat);
	}

	@Override
	public void insertPointHistories(ShowUserPointHistories pointHistories) {
		orderDao.insertPointHistories(pointHistories);
	}

	@Override
	public Bank getBank(String bankName) {
		return orderDao.getBank(bankName);
	}

	@Override
	public void insertOrder(Order order) {
		orderDao.insertOrder(order);
	}

	@Override
	public int getOrderNo() {
		return orderDao.getOrderNo();
	}

	@Override
	public void insertTicketOrderItems(Map<String, Object> ticketOrderItems) {
		orderDao.insertTicketOrderItems(ticketOrderItems);
	}
*/
	@Override
	public OrderDto getAllAboutOrder(int userNo) {
		return orderDao.getAllAboutOrder(userNo);
	}
	
}
