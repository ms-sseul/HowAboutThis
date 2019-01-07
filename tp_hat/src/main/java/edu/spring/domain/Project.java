package edu.spring.domain;

import java.util.Date;

public class Project {
	
	private int pno;			  // 글번호
	private String title;		  // 제목
	private String content;		  // 내용
	private int recommendation;	  // 추천수
	private int category;	  // 카테고리
	private int currentAmount;    // 현재 금액
	private int targetAmount;  	  // 목표 금액
	private String userId;			  // 프로젝트 작성자 아이디
	private Date targetTime;	  // 프로젝트 목표 시간 
	private Date regTime;		  // 프로젝트 작동 시간
	private int readCnt;		//조회수
	private int replyCnt;		//댓글수
	private int finished;	  // 종료여부
	
	public Project() {}
	
			

	public Project(int pno, String title, String content, int recommendation, int category, int currentAmount,
			int targetAmount, String userId, Date targetTime, Date regTime, int readCnt, int replyCnt,
			int finished) {
		super();
		this.pno = pno;
		this.title = title;
		this.content = content;
		this.recommendation = recommendation;
		this.category = category;
		this.currentAmount = currentAmount;
		this.targetAmount = targetAmount;
		this.userId = userId;
		this.targetTime = targetTime;
		this.regTime = regTime;
		this.readCnt = readCnt;
		this.replyCnt = replyCnt;
		this.finished = finished;
	}






	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
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

	public int getRecommendation() {
		return recommendation;
	}

	public void setRecommendation(int recommendation) {
		this.recommendation = recommendation;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getCurrentAmount() {
		return currentAmount;
	}

	public void setCurrentAmount(int currentAmount) {
		this.currentAmount = currentAmount;
	}

	public int getTargetAmount() {
		return targetAmount;
	}

	public void setTargetAmount(int targetAmount) {
		this.targetAmount = targetAmount;
	}

	

	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
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



	public Date getTargetTime() {
		return targetTime;
	}

	public void setTargetTime(Date targetTime) {
		this.targetTime = targetTime;
	}

	public Date getRegTime() {
		return regTime;
	}

	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}

	public int isFinished() {
		return finished;
	}

	public void setFinished(int finished) {
		this.finished = finished;
	}

	@Override
	public String toString() {
		return "Project [pno=" + pno + ", title=" + title + ", content=" + content + ", recommendation="
				+ recommendation + ", category=" + category + ", currentAmount=" + currentAmount + ", targetAmount="
				+ targetAmount + ", userId=" + userId + ", targetTime=" + targetTime + ", regTime=" + regTime
				+", readCnt="+readCnt+", replyCnt="+replyCnt +", finished=" + finished + "]";
	}
	
	
}
