package edu.spring.domain;

import java.util.Date;

public class Reply {
	
	private int rno;				// 댓글 번호
	private int pno;				// 프로젝트 번호
	private String content;			// 댓글 내용
	private String userId;			// 댓글 작성자 아이디
	private int rrno;				// 대댓글 번호
	private Date regDate;			// 댓글 작성 시간
	
	public Reply() {}

	public Reply(int rno, int pno, String content, String userId, int rrno, Date regDate) {
		super();
		this.rno = rno;
		this.pno = pno;
		this.content = content;
		this.userId = userId;
		this.rrno = rrno;
		this.regDate = regDate;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
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

	@Override
	public String toString() {
		return "Reply [rno=" + rno + ", pno=" + pno + ", recommendation=" + ", content=" + content
				+ ", userId=" + userId + ", rrno=" + rrno + ", regDate=" + regDate + "]";
	}
	
}
