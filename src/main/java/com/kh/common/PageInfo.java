package com.kh.common;

public class PageInfo {
	private int listCount;  // 현재 총 게시글 수
	private int currentPage;  //현재 페이지(사용자가 요청한 페이지)
	private int pageLimit; // 페이지 하단에 보여질 페이징바의 개수
	private int noticeLimit; // 한페이지 내에 보여질 게시글 최대갯수
	// 위 4개의 값을 기준으로 4개의 값을 구해야 함
	
	private int maxPage;  // 가장 마지막 페이지(총 페이지의 수)
	private int startPage;  // 페이징바의 시작 수
	private int endPage;  // 페이징바의 마지막 끝수
	
	public PageInfo() {
		super();
	}

	public PageInfo(int listCount, int currentPage, int pageLimit, int noticeLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.noticeLimit = noticeLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getNoticeLimit() {
		return noticeLimit;
	}

	public void setNoticeLimit(int noticeLimit) {
		this.noticeLimit = noticeLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageInfo [listCount=" + listCount + ", currentPage=" + currentPage + ", pageLimit=" + pageLimit
				+ ", noticeLimit=" + noticeLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}
	
	
}