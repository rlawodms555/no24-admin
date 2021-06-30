package com.example.demo.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dto.ActorDto;

@Transactional
public interface ActorService {

	List<ActorDto> getActorByPutShowNo(int putShowNo);
}
