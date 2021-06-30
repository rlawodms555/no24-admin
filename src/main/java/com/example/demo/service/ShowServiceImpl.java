package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CategoryDao;
import com.example.demo.dao.ShowDao;
import com.example.demo.dto.Pagination;
import com.example.demo.dto.PutShowDto;
import com.example.demo.dto.ShowDto;
import com.example.demo.vo.Category;
import com.example.demo.vo.Show;

@Service
public class ShowServiceImpl implements ShowService {

	@Autowired
	ShowDao showDao;
	
	@Autowired
	CategoryDao categoryDao;

	@Override
	public List<Category> getAllCategories() {
		return categoryDao.getAllCategories();
	}
	
	@Override
	public List<Category> getAllTopCategories() {
		return categoryDao.getAllTopCategories();
	}
	
	@Override
	public List<Category> getCategoryByTopNo(int TopNo) {
		return categoryDao.getCategoryByTopNo(TopNo);
	}
	
	@Override
	public Category getCategoryByNo(int categoryNo) {
		return categoryDao.getCategoryByNo(categoryNo);
	}
	
	@Override
	public List<Show> getAllShows() {
		return showDao.getAllShows();
	}

	@Override
	public ShowDto getShowByNo(int showNo) {
		return showDao.getShowByNo(showNo);
	}
	
	@Override
	public Map<String, Object> getShows(Map<String, Object> condition) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		// 검색조건에 해당하는 공연의 갯수를 조회한다.
		int totalRows = showDao.getTotalCountByCondition(condition);
		
		// 페이지정보 생성
		Pagination pagination = new Pagination((Integer)condition.get("pageNo"), totalRows);
		
		// 검색조건에 해당하는 유저목록을 조회한다.
		List<Show> shows = showDao.getShowsByCondition(condition);
		
		result.put("shows", shows);
		result.put("pagination", pagination);
		
		return result;
	}
	
	@Override
	public List<PutShowDto> getAllAboutShowByNo(int showNo) {
		return showDao.getAllAboutShowByNo(showNo);
	}

	@Override
	public void insertShow(Show show) {
		showDao.insertShow(show);
	}

	@Override
	public void updateShow(Show show) {
		showDao.updateShow(show);
	}

	@Override
	public void deleteShow(int showNo) {
		showDao.deleteShow(showNo);
	}

	@Override
	public List<Category> getCategoryListByNo(int categoryNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Show> getShowHome() {
		return showDao.getShowHome();
	}

}
