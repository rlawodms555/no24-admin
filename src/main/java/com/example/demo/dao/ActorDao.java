package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.ActorDto;

@Mapper
public interface ActorDao {

	List<ActorDto> getActorByPutShowNo(int putShowNo);
}
