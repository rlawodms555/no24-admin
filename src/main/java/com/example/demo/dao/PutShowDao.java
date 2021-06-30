package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.PutShow;
import com.example.demo.vo.Show;

@Mapper
public interface PutShowDao {

	void insertPutShow(PutShow putShow);
	
	// 한 공연에 상연이 여러 번이니까
	List<PutShow> getPutShowByshowNo(int showNo);
}
