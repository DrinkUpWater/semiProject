package test;

public class HostComment {
	private int hostCommentNo;
	private String hostCommentContent;//커맨트 내용
	
	private int commentNo;//게스트 QA번호

	
	private static int sq=0;
	public HostComment() {
		++sq;
	}
	
	public HostComment(String hostCommentContent, int commentNo) {
	
		++sq;
		this.hostCommentNo = sq;
		this.hostCommentContent = hostCommentContent;
		this.commentNo = commentNo;
	}
	

	public int getHostCommentNo() {
		return hostCommentNo;
	}

	public void setHostCommentNo(int hostCommentNo) {
		this.hostCommentNo = hostCommentNo;
	}

	public String getHostCommentContent() {
		return hostCommentContent;
	}

	public void setHostCommentContent(String hostCommentContent) {
		this.hostCommentContent = hostCommentContent;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	@Override
	public String toString() {
		return "HostComment [hostCommentNo=" + hostCommentNo + ", hostCommentContent=" + hostCommentContent
				+ ", commentNo=" + commentNo + "]";
	}
	
	
	
	
}
