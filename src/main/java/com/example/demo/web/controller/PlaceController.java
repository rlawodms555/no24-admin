package com.example.demo.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.PlaceService;

@Controller
public class PlaceController {

	@Autowired
	PlaceService placeService;
	
	@RequestMapping("")
	public String list() {
		return "";
	}
	
}
