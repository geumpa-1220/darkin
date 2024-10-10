package com.example.darkin.dto;

import java.sql.Timestamp;

public class QuestionDto {
	
	private int id;
	private String questionTitle,questionContent,questionUser;
	private Timestamp questionTime;

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public String getQuestionUser() {
		return questionUser;
	}
	public void setQuestionUser(String questionUser) {
		this.questionUser = questionUser;
	}
	
	public Timestamp getQuestionTime() {
		return questionTime;
	}
	public void setQuestionTime(Timestamp questionTime) {
		this.questionTime = questionTime;
	}
	

}
