package com.kh.common;

import java.sql.Date;

public class NoticeAttachment {
	private int fileNo;
	private int refNoticeNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private int fileLevel;
	private String status;
	
	public NoticeAttachment() {
		super();
	}

	public NoticeAttachment(int fileNo, int refNoticeNo, String originName, String changeName, String filePath,
			Date uploadDate, int fileLevel, String status) {
		super();
		this.fileNo = fileNo;
		this.refNoticeNo = refNoticeNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.status = status;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getRefNoticeNo() {
		return refNoticeNo;
	}

	public void setRefNoticeNo(int refNoticeNo) {
		this.refNoticeNo = refNoticeNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "NoticeAttachment [fileNo=" + fileNo + ", refNoticeNo=" + refNoticeNo + ", originName=" + originName
				+ ", changeName=" + changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate
				+ ", fileLevel=" + fileLevel + ", status=" + status + "]";
	}
	
}
