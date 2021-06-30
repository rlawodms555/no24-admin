package com.example.demo.web.form;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ShowForm {

	// 일자는 컨트롤러어드바이스 사용해야 할 거 같은데
	// 디폴트 값이 있는 컬럼은 제외
	// private int topCategoryNo; shows 테이블에 당장 필요없음
	private int categoryNo;
	private String name;
	private int viewingNo;
	private String runningTime;
	private MultipartFile posterfile;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date beginDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	private int placeNo;
	private MultipartFile attentionfile;
	private MultipartFile salefile;
	private MultipartFile showDetailfile;
}
