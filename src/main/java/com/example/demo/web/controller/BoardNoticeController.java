package com.example.demo.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.NoticeService;
import com.example.demo.vo.Notice;

@Controller
@RequestMapping("/board/notice")
public class BoardNoticeController {

	@Autowired
	NoticeService noticeService;

	@RequestMapping("/list.do")
	public String notice(@RequestParam(name = "opt", required = false, defaultValue = "title") String opt,
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
		
		// 뷰에 표시할 공지 정보와 페이징 정보를 조회한다.
		Map<String, Object> resultMap = noticeService.getNotices(condition);

		model.addAttribute("page", resultMap.get("pagination"));
		model.addAttribute("notices", resultMap.get("notices"));
		
		return "board/notice/list";
	}

	@RequestMapping("/detail.do")
	public String detail(@RequestParam("noticeNo") int noticeNo, Model model) {
		Notice notice = noticeService.getNoticeByNo(noticeNo);

		model.addAttribute("notice", notice);
		// model.addAttribute("pageNo", pageNo); 굳이 모델에 담기보다는 param.pageNo이 나으려나
		return "board/notice/detail";
	}

	@RequestMapping("/form.do")
	public String form() {
		return "board/notice/form";
	}

	@RequestMapping("/add.do")
	public String add(@RequestParam("type") String type, @RequestParam("title") String title,
			@RequestParam("content") String content) {

		Notice notice = new Notice();

		notice.setType(type);
		notice.setTitle(title);
		notice.setContent(content);

		noticeService.insertNotice(notice);

		return "redirect:list.do";
	}

	@RequestMapping("/modifyform.do")
	public String modifyform(@RequestParam("noticeNo") int noticeNo, Model model) {
		Notice notice = noticeService.getNoticeByNo(noticeNo);
		model.addAttribute("notice", notice);
		System.out.println(notice);
		return "board/notice/modifyform";
	}

	@RequestMapping("/modify.do")
	public String modify(@RequestParam("noticeNo") int noticeNo, @RequestParam("pageNo") int pageNo, @RequestParam("type") String type, 
						@RequestParam("title") String title, @RequestParam("content") String content) {
		Notice notice = noticeService.getNoticeByNo(noticeNo);
		
		notice.setType(type);
		notice.setTitle(title);
		notice.setContent(content);
		
		noticeService.updateNotice(notice);
		
		return "redirect:detail.do?pageNo=" + pageNo + "&noticeNo=" + noticeNo;
	}

	// noticeNoList은 어차피 체크된 항목 없으면 return false; 해버리니까 required 안 써도 되려나? 안전하게 쓸까?
	@RequestMapping("/delete.do")
	public String delete(@RequestParam("noticeNo") List<Integer> noticeNoList) {
		
		for (int noticeNo :noticeNoList) {
			noticeService.deleteNotice(noticeNo);
		}
		
		return "redirect:list.do";
	}
}
