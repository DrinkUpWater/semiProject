package com.kh.space.model.vo;

import java.sql.Date;

public class Review {
	
	private int reviewNo;
	private String content;
	private Date insertDate;
	private String userName;
	private int reviewStar;
	private int spaceNo;
	private int userNo;
	
	
	public Review() {
		super();
	}
	
	public Review(int reviewNo, String content, Date insertDate, String userName,int reviewStar,int userNo) {
		super();
		this.reviewNo = reviewNo;
		this.content = content;
		this.insertDate = insertDate;
		this.userName = userName;
		this.reviewStar=reviewStar;
		this.userNo=userNo;
	}


	

	public Review(int reviewNo, String content, Date insertDate, String userName) {
		super();
		this.reviewNo = reviewNo;
		this.content = content;
		this.insertDate = insertDate;
		this.userName = userName;
	}
	public Review(int reviewNo, String content, Date insertDate, String userName,int userNo) {
		super();
		this.reviewNo = reviewNo;
		this.content = content;
		this.insertDate = insertDate;
		this.userName = userName;
		this.userNo=userNo;
	}


	

	public int getReviewStar() {
		return reviewStar;
	}


    public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}







	public int getReviewNo() {
		return reviewNo;
	}


	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getInsertDate() {
		return insertDate;
	}


	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public int getSpaceNo() {
		return spaceNo;
	}


	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", content=" + content + ", insertDate=" + insertDate + ", userName="
				+ userName + ", spaceNo=" + spaceNo + ", userNo=" + userNo + "]";
	}
	
	
	
	
}
