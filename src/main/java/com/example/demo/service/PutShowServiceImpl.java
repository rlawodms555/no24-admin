package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.PutShowDao;
import com.example.demo.vo.PutShow;

@Service
public class PutShowServiceImpl implements PutShowService {

	@Autowired
	PutShowDao putShowDao;
	
	public void insertPutShow(PutShow putShow) {
		putShowDao.insertPutShow(putShow);
	}
	
	@Override
	public List<PutShow> getPutShowByshowNo(int showNo) {
		return putShowDao.getPutShowByshowNo(showNo);
	}
}
