package com.example.demo.web.controller.api;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.ShowService;
import com.example.demo.vo.Category;

@RestController
@RequestMapping("/api/show")
public class ShowAjaxController {

	@Autowired
	ShowService showService;
	
	@RequestMapping("/categoryList.do")
	public List<Category> categoryList(@RequestParam("bigCatNo") int TopNo) {
		// System.out.println(TopNo);
		List<Category> result = showService.getCategoryByTopNo(TopNo);
		
		return result;
	}
	
}
