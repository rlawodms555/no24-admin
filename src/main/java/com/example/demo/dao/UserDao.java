package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.UserDto;
import com.example.demo.vo.User;
import com.example.demo.vo.UserRole;

@Mapper
public interface UserDao {

	UserDto getUserById(String userId);
	UserDto getUserByNo(int userNo);
	// 밑의 메소드는 로직상 DTO로 만들 수 없는 듯
	UserRole getUserRoleByNo(int userNo);
	
	// 페이지네이션 관련 메소드 2개
	int getTotalCountByCondition(Map<String, Object> condition);
	List<UserDto> getUsersByCondition(Map<String, Object> condition);
	
	//void insertUser(User user);	// 만들긴 했지만 사실상 필요 없는 듯하여 우선은 UserDao에만 생성함
	//void insertUser(UserRole user);	// 만들긴 했지만 사실상 필요 없는 듯하여 우선은 UserDao에만 생성함
	void updateUser(User user);
	void updateUserRole(UserRole userRole);
}
