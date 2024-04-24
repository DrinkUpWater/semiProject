package com.kh.common;

public class Pagination {

	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		int maxPage = (int)Math.ceil((double)listCount / boardLimit); // 가장 마지막 페이지(총페이지 수)
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1; //페이징바의 시작
		int endPage = startPage + pageLimit - 1; // 페이징바의 끝수
		
		endPage = endPage > maxPage ? maxPage : endPage;
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit , boardLimit, maxPage, startPage, endPage);
		
		return pi;
	}
}
