package controller.notice.model.vo;

public class Reply {
	private int replyNo;
	private String replyContent;
	private int refNoticeNo;
	private String replyWriter;
	private String createDate;
	private String status;
	
	public Reply() {
		super();
	}

	public Reply(int replyNo, String replyContent, int refNoticeNo, String replyWriter, String createDate,
			String status) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.refNoticeNo = refNoticeNo;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
		this.status = status;
	}
	
	

	public Reply(int replyNo, String replyContent, int refNoticeNo, String replyWriter, String createDate) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.refNoticeNo = refNoticeNo;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
	}

	public Reply(int replyNo, String replyContent, String replyWriter, String createDate) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
	}
	
	public Reply(String replyContent, int refNoticeNo, String replyWriter) {
		super();
		this.replyContent = replyContent;
		this.refNoticeNo = refNoticeNo;
		this.replyWriter = replyWriter;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getRefNoticeNo() {
		return refNoticeNo;
	}

	public void setRefNoticeNo(int refBoardNo) {
		this.refNoticeNo = refBoardNo;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	


	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", refNoticeNo=" + refNoticeNo
				+ ", replyWriter=" + replyWriter + ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	
}
