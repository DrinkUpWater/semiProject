package test;

import java.sql.Date;

public class Comment {
	private int commentNo;
	private String userId;
	private String commentContent;
	private String hostReply;
	private int spaceNum;
	private String insertDate;
	
	private static int sq=0;
	
	public Comment() {
		++sq;
	}
	
	public Comment( String userID, String commentContent, String hostReply, int spaceNum,
			String insertdate) {
		super();
		this.commentNo = ++sq;
		this.userId = userID;
		this.commentContent = commentContent;
		this.hostReply = hostReply;
		this.spaceNum = spaceNum;
		this.insertDate = insertdate;
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
	public void setUserId(String userID) {
		this.userId = userID;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
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

	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertdate) {
		this.insertDate = insertdate;
	}
	
}
