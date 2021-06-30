package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.example.demo.vo.Notice;

@Transactional
public interface NoticeService {

	List<Notice> getAllNotice();
	Notice getNoticeByNo(int noticeNo);
	
	Map<String, Object> getNotices(Map<String, Object> condition);
	void insertNotice(Notice notice);
	void updateNotice(Notice notice);
	void deleteNotice(int noticeNo);
	
	List<Notice> getNoticeHome();
}
