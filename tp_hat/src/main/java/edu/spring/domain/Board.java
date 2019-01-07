package edu.spring.domain;

import java.util.Date;

public class Board {
	
	private int bno;			// 글번호
	private String userId;		// 글작성자
	private int category;	// 카테고리
	private String title;		// 글제목
	private String content;		// 글내용
	private int readCnt;		// 조회수
	private int replyCnt;		// 댓글수
	private Date regDate;		// 글 작성시간
	
	public Board() {}

	
	

	public Board(int bno, String userId, int category, String title, String content, int readCnt, int replyCnt,
			Date regDate) {
		this.bno = bno;
		this.userId = userId;
		this.category = category;
		this.title = title;
		this.content = content;
		this.readCnt = readCnt;
		this.replyCnt = replyCnt;
		this.regDate = regDate;
	}




	public int getBno() {
		return bno;
	}




	public void setBno(int bno) {
		this.bno = bno;
	}




	public String getUserId() {
		return userId;
	}




	public void setUserId(String userId) {
		this.userId = userId;
	}




	public int getCategory() {
		return category;
	}




	public void setCategory(int category) {
		this.category = category;
	}




	public String getTitle() {
		return title;
	}




	public void setTitle(String title) {
		this.title = title;
	}




	public String getContent() {
		return content;
	}




	public void setContent(String content) {
		this.content = content;
	}




	public int getReadCnt() {
		return readCnt;
	}




	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}




	public int getReplyCnt() {
		return replyCnt;
	}




	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}




	public Date getRegDate() {
		return regDate;
	}




	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}




	@Override
	public String toString() {
		return "Board [bno=" + bno + ", userId=" + userId + ", category=" + category + ", title=" + title + ", content="
				+ content +", readCnt="+readCnt+", replyCnt="+replyCnt +", regDate=" + regDate + "]";
	}

}
