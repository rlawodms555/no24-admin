package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.NoticeDao;
import com.example.demo.dto.Pagination;
import com.example.demo.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao noticeDao;
	
	@Override
	public List<Notice> getAllNotice() {
		return noticeDao.getAllNotice();
	}
	
	@Override
	public Notice getNoticeByNo(int noticeNo) {
		Notice notice = noticeDao.getNoticeByNo(noticeNo);
		// 조회수 1 증가
		notice.setViews(notice.getViews() + 1);
		noticeDao.updateNotice(notice);
		
		return noticeDao.getNoticeByNo(noticeNo);
	}

	@Override
	public Map<String, Object> getNotices(Map<String, Object> condition) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		// 검색조건에 해당하는 공지의 개수를 조회한다.
		int totalRows = noticeDao.getTotalCountByCondition(condition);
		
		// 페이지정보 생성
		Pagination pagination = new Pagination((Integer)condition.get("pageNo"), totalRows);
		
		// 검색조건에 해당하는 공지를 조회한다.
		List<Notice> notices = noticeDao.getNoticesByCondition(condition);
		
		result.put("notices", notices);
		result.put("pagination", pagination);
		
		return result;
	}
	
	@Override
	public void insertNotice(Notice notice) {
		noticeDao.insertNotice(notice);
	}

	@Override
	public void updateNotice(Notice notice) {
		noticeDao.updateNotice(notice);
	}

	@Override
	public void deleteNotice(int noticeNo) {
		noticeDao.deleteNotice(noticeNo);
	}

	@Override
	public List<Notice> getNoticeHome() {
		return noticeDao.getNoticeHome();
	}
}
