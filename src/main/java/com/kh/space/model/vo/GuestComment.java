package com.kh.space.model.vo;

import java.sql.Date;

public class GuestComment {
	private int commentNo;
	private String userId;
	private String commentContent;
	private Date insertDate;
	private String hostReply;
	private int spaceNum;
	private int userNo;
	

	public GuestComment() {
		
	}


	public GuestComment(int commentNo, String userId, String commentContent, Date insertDate, String hostReply) {
		super();
		this.commentNo = commentNo;
		this.userId = userId;
		this.commentContent = commentContent;
		this.insertDate = insertDate;
		this.hostReply = hostReply;
	}


	public GuestComment(String userId, String commentContent, Date insertDate, String hostReply) {
		super();
		this.userId = userId;
		this.commentContent = commentContent;
		this.insertDate = insertDate;
		this.hostReply = hostReply;
	}
	
	
	
	
	public GuestComment(int commentNo, String userId, String commentContent, Date insertDate, String hostReply,
			int userNo) {
		super();
		this.commentNo = commentNo;
		this.userId = userId;
		this.commentContent = commentContent;
		this.insertDate = insertDate;
		this.hostReply = hostReply;
		this.userNo = userNo;
	}


	public int getUserNo() {
		return this.userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo=userNo;
	}


	public int getCommentNo() {
		return commentNo;
	}


	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getCommentContent() {
		return commentContent;
	}


	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}


	public Date getInsertDate() {
		return insertDate;
	}


	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}


	public String getHostReply() {
		return hostReply;
	}


	public void setHostReply(String hostReply) {
		this.hostReply = hostReply;
	}


	public int getSpaceNum() {
		return spaceNum;
	}


	public void setSpaceNum(int spaceNum) {
		this.spaceNum = spaceNum;
	}


	@Override
	public String toString() {
		return "GuestComment [userId=" + userId + ", commentContent=" + commentContent + ", insertDate=" + insertDate
				+ ", hostReply=" + hostReply + "]";
	}
	
	
	
	
}
