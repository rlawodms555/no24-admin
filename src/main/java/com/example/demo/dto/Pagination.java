package com.example.demo.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Pagination {

	private int rowsPerPage = 10;		// 한 화면에 표시할 데이터의 갯수
	private int pagesPerBlock = 5;		// 한 화면에 표시할 페이지번호의 갯수
	private int pageNo;               	// 현재 페이지 번호
	private int blockNo;            	// 현재 블록번호
	private int totalRows;            	// 총 데이터 갯수
	private int totalPages;            	// 총 페이지 갯수
	private int totalBlocks;         	// 총 블록 갯수
	private int beginPage;            	// 블록 시작 페이지번호
	private int endPage;            	// 블록 끝 페이지번호
   
	public Pagination(int pageNo, int totalRows) {
		this.pageNo = pageNo;
		this.totalRows = totalRows;
		init();
	}
   
	public Pagination(int pageNo, int totalRows, int rowsPerPage) {
		this.pageNo = pageNo;
		this.totalRows = totalRows;
		this.rowsPerPage = rowsPerPage;
		init();
	}

	public Pagination(int pageNo, int totalRows, int rowsPerPage, int pagesPerBlock) {
		this.pageNo = pageNo;
		this.totalRows = totalRows;
		this.rowsPerPage = rowsPerPage;
		this.pagesPerBlock = pagesPerBlock;
		init();
	}
   
	private void init() {
		// 총 페이지 갯수
		this.totalPages = (int) (Math.ceil((double) totalRows/rowsPerPage));
		// 총 블록 갯수
		this.totalBlocks = (int) (Math.ceil((double) totalPages/pagesPerBlock));
		// 현재 페이지번호가 잘못된 값인 경우 무조건 현재 페이지번호를 1로 한다.
		if (pageNo <= 0 || pageNo > totalPages) {
			pageNo = 1;
		}
		// 현재 페이지번호가 속한 블록번호
		blockNo = (int) (Math.ceil((double) pageNo/pagesPerBlock));
		// 시작 페이지 번호(blockNo를 알면 beginPage를 알 수 있다)
		beginPage = (blockNo - 1)*pagesPerBlock + 1;
		// 끝 페이지 번호
		endPage = blockNo*pagesPerBlock;
		if (blockNo == totalBlocks) {		// 맨마지막 블록인 경우
			endPage = totalPages;			// 블록 끝 페이지번호를 총 페이지 갯수로 설정한다.
		}
	} 
}