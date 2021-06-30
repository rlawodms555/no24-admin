package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ActorDao;
import com.example.demo.dto.ActorDto;

@Service
public class ActorServiceImpl implements ActorService {

	@Autowired
	ActorDao actorDao;
	
	@Override
	public List<ActorDto> getActorByPutShowNo(int putShowNo) {
		return actorDao.getActorByPutShowNo(putShowNo);
	}
}
