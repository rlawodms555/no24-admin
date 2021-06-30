package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.Place;

@Mapper
public interface PlaceDao {

	List<Place> getAllPlaces();
	Place getPlaceByNo(int placeNo);
	
	int getTotalCountByCondition(Map<String, Object> condition);
	List<Place> getPlacesByCondition(Map<String, Object> condition);
	
	void insertPlace(Place place);
	void updatePlace(Place place);
	void deletePlace(int placeNo);	// 잘못 등록 + 공연장소 완전 삭제
}
