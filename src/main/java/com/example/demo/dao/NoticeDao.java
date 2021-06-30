package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.Notice;

@Mapper
public interface NoticeDao {

	List<Notice> getAllNotice();
	Notice getNoticeByNo(int noticeNo);
	
	// 페이지네이션
	int getTotalCountByCondition(Map<String, Object> condition);
	List<Notice> getNoticesByCondition(Map<String, Object> condition);
	
	void insertNotice(Notice notice);
	void updateNotice(Notice notice);
	void deleteNotice(int noticeNo);
	
	List<Notice> getNoticeHome();
}
