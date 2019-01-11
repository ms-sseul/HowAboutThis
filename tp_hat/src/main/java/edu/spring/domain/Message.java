package edu.spring.domain;

import java.util.Date;

public class Message {
	
	private int mno;			// 쪽지 번호
	private String sender;		// 쪽지보내는 사람
	private String reciever;	// 쪽지받는 사람
	private String title;		// 쪽지 제목
	private String content;		// 쪽지 내용
	private Date regDate;		// 쪽지 보낸 시간
	private int read;			// 읽었는지 확인하기
	
	public Message() {}

	public Message(int mno, String sender, String reciever, String title, String content, Date regDate, int read) {
		super();
		this.mno = mno;
		this.sender = sender;
		this.reciever = reciever;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.read = read;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReciever() {
		return reciever;
	}

	public void setReciever(String reciever) {
		this.reciever = reciever;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	

	public int getRead() {
		return read;
	}

	public void setRead(int read) {
		this.read = read;
	}

	@Override
	public String toString() {
		return "Message [mno=" + mno + ", sender=" + sender + ", reciever=" + reciever + ", title=" + title
				+ ", content=" + content + ", regDate=" + regDate +", read=" +read+"]";
	}
	
}
