package edu.spring.domain;

import java.util.Date;

public class Reply {
	
	private int rno;				// 댓글 번호
	private int parentNumber;				// 프로젝트 번호
	private String content;			// 댓글 내용
	private String userId;			// 댓글 작성자 아이디
	private int rrno;				// 대댓글 번호
	private Date regDate;			// 댓글 작성 시간
	private int type;
	public Reply() {}
	public Reply(int rno, int pno, String content, String userId, int rrno, Date regDate, int type) {
		super();
		this.rno = rno;
		this.parentNumber = pno;
		this.content = content;
		this.userId = userId;
		this.rrno = rrno;
		this.regDate = regDate;
		this.type = type;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getParentNumber() {
		return parentNumber;
	}
	public void setParentNumber(int parentNumber) {
		this.parentNumber = parentNumber;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getRrno() {
		return rrno;
	}
	public void setRrno(int rrno) {
		this.rrno = rrno;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Reply [rno=" + rno + ", pno=" + parentNumber + ", content=" + content + ", userId=" + userId + ", rrno=" + rrno
				+ ", regDate=" + regDate + ", type=" + type + "]";
	}
	
	
	
		
}
