package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.PutShowDto;
import com.example.demo.dto.ShowDto;
import com.example.demo.vo.Show;

@Mapper
public interface ShowDao {

	List<Show> getAllShows();
	
	int getTotalCountByCondition(Map<String, Object> condition);
	List<Show> getShowsByCondition(Map<String, Object> condition);
	
	List<PutShowDto> getAllAboutShowByNo(int showNo);
	
	ShowDto getShowByNo(int showNo);
	
	void insertShow(Show show);
	void updateShow(Show show);
	void deleteShow(int showNo);	// 관리자가 공연을 실수로 잘못 등록했을 때 진짜로 삭제할 거임 일회성 데이터
	
	List<Show> getShowHome();
}
