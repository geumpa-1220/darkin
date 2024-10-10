package com.example.darkin.dto;

import java.sql.Timestamp;

public class AnswerDto {
	
	private int id,qid;
	private String answerContent,answerUser;
	private Timestamp answerTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}

	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	public String getAnswerUser() {
		return answerUser;
	}
	public void setAnswerUser(String answerUser) {
		this.answerUser = answerUser;
	}
	public Timestamp getAnswerTime() {
		return answerTime;
	}
	public void setAnswerTime(Timestamp answerTime) {
		this.answerTime = answerTime;
	}

}
