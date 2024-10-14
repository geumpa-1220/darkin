package com.example.darkin.dto;

import java.sql.Timestamp;

public class AllChatDto {
	
	private int id;
	private String sender,content;
	private Timestamp messageTime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getMessageTime() {
		return messageTime;
	}
	public void setMessageTime(Timestamp messageTime) {
		this.messageTime = messageTime;
	}
	

}
