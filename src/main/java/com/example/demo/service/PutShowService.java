package com.example.demo.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.example.demo.vo.PutShow;

@Transactional
public interface PutShowService {

	void insertPutShow(PutShow putShow);
	
	List<PutShow> getPutShowByshowNo(int showNo);
}
