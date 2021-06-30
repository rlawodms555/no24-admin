package com.example.demo.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.UserDto;
import com.example.demo.service.UserService;
import com.example.demo.vo.UserRole;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping("/list.do")
	public String list(@RequestParam("status") String status,
			@RequestParam(name = "opt", required = false, defaultValue = "id") String opt,
			@RequestParam(name = "keyword", required = false) String keyword,
			@RequestParam(name = "sort", required = false, defaultValue = "date") String sort,
			@RequestParam(name = "pageNo", required = false, defaultValue = "1") int pageNo,
			@RequestParam(name = "rows", required = false, defaultValue = "10") int rows,
			Model model) {
		
		// 유저 검색 조건을 저장하는 Map객체 생성
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
		
		// 뷰에 표시할 고객 정보와 페이지네이션 정보를 조회한다.
		Map<String, Object> resultMap = userService.getUsersByCondition(condition);
				
		// 뷰에 전달할 데이터를 모델에 담기
		model.addAttribute("page", resultMap.get("pagination"));
		// 검색 조건에 해당하는 유저목록
		model.addAttribute("users", resultMap.get("users"));
		// status를 condition에서 가져와야 하나?
		model.addAttribute("status", condition.get("status"));
		
		return "user/list";
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam("status") String status, @RequestParam("sort") String sort,
						@RequestParam("userNo") int userNo, @RequestParam("pageNo") int pageNo, 
						Model model) {
		UserDto user = userService.getUserByNo(userNo);
		
		model.addAttribute("status", status);
		model.addAttribute("user", user);
		model.addAttribute("pageNo", pageNo);
		
		return "user/detail";
	}
	
	// 체크박스로 일괄 변경(삭제)이 될 수도, 1개 변경(삭제)이 될 수도 있음
	// status와 sort는 접근할 때 필수값이라 hidden으로 숨겨둠
	@RequestMapping("/updateUserRole.do")
	public String delete(@RequestParam("status") String status, 
			@RequestParam("sort") String sort,
			@RequestParam(name = "pageNo", required = false, defaultValue = "1") int pageNo,
			@RequestParam(name = "opt", required = false, defaultValue = "id") String opt,
			@RequestParam(name = "keyword", required = false) String keyword,
			@RequestParam("userNo") List<Integer> userNoList) {
		// 근데 detail에서  회원을 삭제하면 list의 처음으로 넘어가나? status 같은 건 당연히 넣어줘야 함
		for (int userNo : userNoList) {
			UserRole userRole = userService.getUserRoleByNo(userNo);
			
			userRole.setAbleStatus("N");
			Date date = new Date();
			userRole.setWithdrawalDate(date);
			
			userService.updateUserRole(userRole);
		}
		return "redirect:list.do?status=" + status + "&sort=" + sort +"&pageNo=" + pageNo + "&opt=" + opt + "&keyword=" + keyword;
	}
}
