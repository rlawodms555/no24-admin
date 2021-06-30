package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.UserDao;
import com.example.demo.dto.Pagination;
import com.example.demo.dto.UserDto;
import com.example.demo.exception.PasswordMismatchException;
import com.example.demo.exception.UnacceptableRoleException;
import com.example.demo.exception.UserNotFoundException;
import com.example.demo.vo.User;
import com.example.demo.vo.UserRole;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	@Override
	public UserDto getLoginedUserInfo(String userId, String password) {
		// 아이디로 사용자 정보조회
		UserDto user = userDao.getUserById(userId);
		
		// 사용자정보가 존재하지 않으면 예외발생
		if (user == null) {
			throw new UserNotFoundException("사용자 정보가 존재하지 않습니다.");
		}
		
		// 로그인 권한이 ADMIN이 아니면 예외발생
		if (!user.getRole().equals("ADMIN")) {
			throw new UnacceptableRoleException("허용되지 않은 접근입니다.");
		}
		
		String secretPassword = DigestUtils.sha256Hex(password);
		// 비밀번호가 일치하지 않으면 예외발생
		if (!user.getPassword().equals(secretPassword)) {
			throw new PasswordMismatchException("아이디 혹은 비밀번호가 일치하지 않습니다.");
		}
		
		return user;
	}
	
	@Override
	public UserDto getUserByNo(int userNo) {
		return userDao.getUserByNo(userNo);
	}
	
	@Override
	public UserRole getUserRoleByNo(int userNo) {
		return userDao.getUserRoleByNo(userNo);
	}
	
	@Override
	public Map<String, Object> getUsersByCondition(Map<String, Object> condition) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		// 검색조건에 해당하는 유저의 개수를 조회한다.
		int totalRows = userDao.getTotalCountByCondition(condition);
		
		// 페이지정보 생성
		Pagination pagination = new Pagination((Integer)condition.get("pageNo"), totalRows);
		
		// 검색조건에 해당하는 유저목록을 조회한다.
		List<UserDto> users = userDao.getUsersByCondition(condition);
		
		result.put("users", users);
		result.put("pagination", pagination);
		
		return result;
	}
	
	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public void updateUserRole(UserRole userRole) {
		userDao.updateUserRole(userRole);
	}

}
