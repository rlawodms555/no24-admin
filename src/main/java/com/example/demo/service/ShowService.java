package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dto.PutShowDto;
import com.example.demo.dto.ShowDto;
import com.example.demo.vo.Category;
import com.example.demo.vo.Show;

@Transactional
public interface ShowService {

	List<Category> getAllCategories();
	List<Category> getAllTopCategories();
	List<Category> getCategoryByTopNo(int TopNo);
	List<Category> getCategoryListByNo(int categoryNo);
	Category getCategoryByNo(int categoryNo);
	List<Show> getAllShows();
	
	ShowDto getShowByNo(int showNo);
	
	Map<String, Object> getShows(Map<String, Object> condition);
	
	List<PutShowDto> getAllAboutShowByNo(int showNo);
	
	void insertShow(Show show);
	void updateShow(Show show);
	void deleteShow(int showNo);
	
	List<Show> getShowHome();
}
