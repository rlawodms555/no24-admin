package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.example.demo.vo.Place;

@Transactional
public interface PlaceService {

	List<Place> getAllPlaces();
	Place getPlaceByNo(int placeNo);
	
	Map<String, Object> getPlaces(Map<String, Object> condition);
	
	void insertPlace(Place place);
	void updatePlace(Place place);
	void deletePlace(int placeNo);	// 잘못 등록 + 공연장소 완전 삭제
}
