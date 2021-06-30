package com.example.demo.service;

import java.util.Map;

import javax.transaction.Transactional;

import com.example.demo.dto.UserDto;
import com.example.demo.vo.User;
import com.example.demo.vo.UserRole;

@Transactional
public interface UserService {

	UserDto getLoginedUserInfo(String userId, String password);
	
	UserDto getUserByNo(int userNo);
	
	UserRole getUserRoleByNo(int userNo);
	
	Map<String, Object> getUsersByCondition(Map<String, Object> condition);
	
	void updateUser(User user);
	void updateUserRole(UserRole userRole);
}
