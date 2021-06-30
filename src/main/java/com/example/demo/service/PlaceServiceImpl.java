package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.PlaceDao;
import com.example.demo.dto.Pagination;
import com.example.demo.vo.Notice;
import com.example.demo.vo.Place;

@Service
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	PlaceDao placeDao;
	
	@Override
	public List<Place> getAllPlaces() {
		return placeDao.getAllPlaces();
	}

	@Override
	public Place getPlaceByNo(int placeNo) {
		return placeDao.getPlaceByNo(placeNo);
	}

	@Override
	public Map<String, Object> getPlaces(Map<String, Object> condition) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		int totalRows = placeDao.getTotalCountByCondition(condition);
		
		Pagination pagination = new Pagination((Integer)condition.get("pageNo"), totalRows);
		
		List<Place> places = placeDao.getPlacesByCondition(condition);
		
		result.put("places", places);
		result.put("pagination", pagination);
		
		return result;
	}
	
	@Override
	public void insertPlace(Place place) {
		placeDao.insertPlace(place);
	}

	@Override
	public void updatePlace(Place place) {
		placeDao.updatePlace(place);
	}

	@Override
	public void deletePlace(int placeNo) {
		placeDao.deletePlace(placeNo);
	}

}
