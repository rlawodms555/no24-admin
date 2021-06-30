package com.example.demo.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.UserDto;
import com.example.demo.exception.UnacceptableRoleException;
import com.example.demo.exception.UserNotFoundException;
import com.example.demo.service.NoticeService;
import com.example.demo.service.ShowService;
import com.example.demo.service.UserService;
import com.example.demo.util.SessionUtils;
import com.example.demo.vo.Notice;
import com.example.demo.exception.PasswordMismatchException;

@Controller
public class HomeController {

	@Autowired
	UserService userService;
	
	@Autowired
	ShowService showService;
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/home.do")
	public String home(Model model) {
		// 홈페이지 공연정보 뿌리기
		model.addAttribute("showList", showService.getShowHome());
		// 홈페이지 공지사항 뿌리기
		model.addAttribute("noticeList", noticeService.getNoticeHome());
		return "home";
	}
	
	@RequestMapping("/loginform.do")
	public String loginform() {
		return "loginform";
	}
	
	@RequestMapping("/login.do")
	public String login(@RequestParam("id") String userId, @RequestParam("password") String password) {
		if (StringUtils.isEmpty(userId) || StringUtils.isEmpty(password)) {
			return "redirect:loginform.do?error=empty";
		}
		
		try {
			UserDto user = userService.getLoginedUserInfo(userId, password);
			// 세션에 로그인된 사용자정보를 저장한다.
			SessionUtils.setAttribute("LOGINED_USER", user);
			
		} catch (UserNotFoundException e) {
			e.printStackTrace();
			return "redirect:loginform.do?error=notfound";
		
		} catch (UnacceptableRoleException e) {
			e.printStackTrace();
			return "redirect:loginform.do?error=role";
			
		} catch (PasswordMismatchException e) {
			e.printStackTrace();
			return "redirect:loginform.do?error=mismatch";
		}
		return "redirect:home.do";
	}
	
	@RequestMapping("/logout.do")
	public String logout() {
		SessionUtils.removeAttribute("LOGINED_USER");
		
		return "redirect:loginform.do";
	}
	
}
